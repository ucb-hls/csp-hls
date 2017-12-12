# CS294-141 go2fpga Final Report

Qijing Huang, Tan Nguyen, Arya Reais-Parsi

## Introduction

With the emergence of FPGA Acceleration-as-a-Service offerings from major cloud service providers in the past year Amazon [1], Alibaba [2], Baidu [3], Tencent [4], FPGAs have become more accessible to general application developers. However, ease of use remains a critical barrier to the adoption of FPGAs. High Level Synthesis (HLS) is one potential solution, providing a more familiar environment for software developers and software minded hardware engineers to develop hardware accelerators. HLS allows developers to code an accelerator in a familiar language, such as C, and to compile that program description into RTL. Support of sequential C is maturing in existing HLS frameworks like Vivado HLS [5], Altera OpenCL [6], LegUp [7], but the high-level abstraction to support concurrent models of computation is still limited in these tools. Given the complexity of modern applications and the underlying hardware platforms, an expressive yet simple abstraction for concurrency is needed. 

In this work, we propose to map a concurrency similar to Communicating Sequential Processes (CSP) to hardware through HLS, and to select a subset of features from the CSP-inspired language -- Go -- to map to our intermediate translation layer. CSP is an established formalism for concurrency in computer programs, having been an active area of research since its introduction by Hoare in 1977 [8]. It is similar in many respects to slightly older Actor model. Traditionally, concurrently executing programs must negotiate access to shared memory in the presence of arbitrary interleaving, usually requiring careful management of locks around critical sections. Under CSP and the Actor model, processes within programs execute as if independently, concerned only with their local state. (In CSP these processes are anonymous, while under the Actor model they are themselves named actors.) To communicate with each other or share information CSP usest synchronised unbuffered channels; under the Actor model the channel is implicit (Actors send messages to each other by name) and unbuffered. Under CSP, writes to a channel cannot complete until another process is ready to read the value, whereas Actors do not need to synchronous message writes to others read. 

Modern programming languages like Go and Rust embed ideas from CSP and Actor systems [9], [10], as higher level interfaces to concurrency. Using channels as a first class concurrency primitive avoids the difficulty of (and the human errors introduced by) managing lower-level primitives like mutexes, conditions variables, and so on. These channels can be buffered or unbuffered, with multiple producers and consumers. Crucially, this general idea seems to map neatly to hardware logic implementation. Independent actors/processes can be implemented as independent hardware modules, and the channels interconnecting them as fixed FIFO channels. Asking programmers to write in a CSP/Actor model might make it easier to synthesise hardware acceleration for certain processes, as they themselves have are forced to demarcate the processes states and boundaries more cleanly than under lower-level concurrency models.
## Related Work

Xilinx Vivado HLS supports channel communication and enforces a strict Kahn’s Process Network (KPN) model with point-to-point FIFOs (`ap_fifo` interface with the dataflow pragma). Once a feedback loop is detected in the KPN design specified by the user,  Vivado HLS will abort the synthesis to prevent deadlock from happening during runtime. LegUp supports a more flexible model with multi-sender multi-receiver FIFOs. However, deadlocks can be incurred if there exists some feedback loops in the design and the FIFO buffers are not properly sized. LegUp also supports the Pthreads/OpenMP model [11] to generate multi-core hardware accelerators on both FPGA-SoC and FPGA-only system. While Pthreads can be used to construct various concurrency models, synchronization through the low-level shared-memory mutex abstraction it provides is problematic. The dependencies of parallel tasks in the program are manifested by accesses to shared variables, which makes it hard to write, understand and debug the programs. Besides, runtime crashes in critical sections will contaminate memory, making it hard to recover from failures. Ultimately, Pthreads/OpenMP support in LegUp assumes the existence of a shared address space, which limits its usage to single machine with shared memory. Among other tools, OpenCL supports limited parallelism in a Single Program Multiple Data scheme. [12] proposes using Message Passing Interface as a programming model for configurable computers, which could be used to complement the Pthreads/OpenMP model. CSP-like models, on the other hand, could be used to unify the concurrency model for single machines and distributed systems with stricter semantics for inter-process communication and synchronization than in MPI.

Reconfigure.io [12]  is a company that develops a commercial tool to synthesize Go applications to FPGA. Their compiler first emits an Intermediate Representation called Teak [13], followed by synthesizing to Verilog. Teak is a dataflow hardware description language developed by a research group at University of Manchester. Go’s CSP model can naturally map to a dataflow graph represented by Teak. The tool is offered as a service on Amazon EC2 F1, where the FPGA and CPU are loosely coupled via PCIe. Unlike their approach, our tool flow consists of two steps. First, we compile original Go code to LLVM IR, followed by LLVM IR to C using existing toolchains. Next, we leverage existing commercial C-based HLS tool to synthesize the generated C code to RTL. Thus, we might be able to eventually reap the benefit from the existing optimizations of LLVM and HLS software to attain better performance for each Go process.
## Implementation
### Overview
In this work, leveraging existing HLS tools, an LLVM compiler for Go (llgo) and an LLVM C-backend (llvm-cbe), we implement a Go to Verilog HLS flow. Given a program written in Go, our tool first compiles it with llgo and emits LLVM IR. The C-Backend of LLVM then takes  the generated LLVM IR and decompiles it to C code. The C code is later fed into the HLS tools for Verilog generation. As a GC language, Go has a runtime system, whereas in C, everything is statically scheduled during compile time. When a Go program is compiled into LLVM IR, particular operations are transformed into function calls to interface with the Go runtime system. The difference in the language features of Go and C imposes the first set of requirements our tool needs to handle: 

1. The function calls to the runtime system should be replaced with C functions that perform the same task 
1. The Go channel interface should be changed to equivalent constructs in C 
1. The initialization of the runtime system should be removed from the generated C code.
 
In addition, current HLS tools only support a subset of features in the C/C++ language. This limitation imposes a second set of requirements on the form of C code we generate as input to HLS tools. The common constructs that are not supported by HLS in C include:

1. Dynamic allocation of variables/arrays
1. Dereferencing pointers that are not resolvable during compile time 
1. Recursion 
1. Indirect function calls 


Basically, current HLS tools do not have mature support for any features that would involve the use of dynamic memory. This is mainly due to the lack of a central, shared stack or heap memory system in the statically scheduled FPGA accelerators for holding intermediate values. With the addition of a similar memory system those features can be potentially supported. However, this is left to the future work. In this project, we confine our goal to source-to-source transformation from Go to the HLS-compatible C code. There are two commercial HLS tools that we are targeting: LegUp HLS and Vivado HLS.  
### LegUp HLS  
LegUp HLS, as we mentioned before, provides APIs for multi-sender and multi-receiver FIFOs abstraction. We can map the Go channel interface to the FIFO APIs of LegUp in a rather straightforward manner as listed in table x. A major difference is that Go Runtime takes pointer to the variable of random size as the input, whereas LegUp only takes a 64-bit value as the input to their send interface. For the intrinsic variables that are smaller than 64-bit in Go, we can dereference its pointer and send its value over LegUp FIFOs. For struct variable in larger size, a wrapper is to be created to serialize it and to instantiate several fifo_write transactions. On the receiver end, another wrapper needs to be created to receive the data until a done token is seen. 

Go API | Go Runtime | LegUp API
--- | --- | ---
`make` | `__go_new_channel` | `fifo_malloc`
`_ <- chan` | `__go_receive` | `fifo_read`
`chan <- _` | `__go_send_big` | `fifo_write`
`close`  | `__go_builtin_close` | `fifo_free`
`select` | `runtime.selectrecv2` | `fifo_read_nb`
### Vivado HLS
Similar to LegUp, Vivado HLS also supports streaming interface by either using the hls::stream data type or interface pragma, for example:

```
void func(int * a) {
#pragma HLS INTERFACE port=a ap_fifo
```

Additionally, hls::stream can be configured to be either standard FIFO communication (ap_fifo) or handshake communication (ap_hls). In this work, we only exploit the FIFO interface. What have been done for synthesizing Go’s channel operations to LegUp’s fifo type is also applicable to Vivado HLS. We only need to write a simple wrapper file to invoke Vivado HLS’s read/write FIFO function instead of LegUp’s when targeting Vivado HLS flow. Vivado HLS also supports dataflow optimization which a producer task and a consumer task can run concurrently. Nonetheless, unlike LegUp, the dataflow optimization cannot support multiple producers or consumers. We expand this capability in our tool flow by installing arbiters to arbitrate concurrent requests during system integration.
### llgo
`llgo` [is an existing Go compiler](http://llvm.org/svn/llvm-project/llgo/trunk/README.TXT) using the LLVM system and is still being actively developed. Though its (sparse) documentation suggests that its support of Go features is incomplete, it provides a robust framework for ingesting Go into LLVM. It uses the [Go frontend](https://github.com/golang/gofrontend), part of the published Go compiler for gcc, and the [go-tools](https://github.com/golang/tools) collection of libraries for generating and manipulating the AST, compiling to SSA form, and representing the Go type system. `llgo` leverages the [go-llvm binding](https://github.com/go-llvm/llvm) and implements Go’s LLVM backends. It is also written in Go itself. Similar to [python-llvm](https://github.com/numba/llvmlite), `go-llvm` binding simplifies the interface to the LLVM libraries written in C++. `llgo` adds a wrapper to generate LLVM IR from the `gofrontend` SSA representation. It converts Go’s SSA to LLVM’s. It introduces another type domain and maps the Go frontend’s types to it.

In order to generate C that meets the requirements [imposed by the HLS tools](#overview), `llgo` was modified as is described below.

Go’s channel type had to be replaced with a pointer to a `FIFO` struct, defined in the external LegUp HLS libraries. This was the single most substantial modification to the Go code. Usually Go passes all object references around as `uint8*` and treats them as “unsafe pointers”. This is presumably because Go’s type checking and up-front analysis obviate the need for stricter type safety in the IR. As a result, the only types distinguishable in the IR are signed/unsigned integers of various widths. In order to generate C code that maintains a specific type’s identity (i.e. calling “`FIFO`” a “`FIFO`” explicitly), the type structure had to be fundamentally changed.

In order to specify argument types for runtime calls to library functions (see below), a new “named” type was created in the Go frontend. Named types implement builtin types like `error` and are typically backed by other structures - in our case `FIFO` maps to an empty struct. In `llgo`, the frontend types `FIFO` (new) and `chan` (existing) were then mapped to new primitive `backendType`s: an empty struct and a pointer to that struct respectively. This allowed us to refer to the `FIFO` type explicitly in LLVM IR. The C backend is then able to treat this type differently to preserve its name, allowing the HLS tools to work.

Note that LLVM allows you define structs as _opaque_, meaning external. This doesn’t seem to be supported by the llgo framework so we left it to the C backend to massage the declarations into good looking C (by removing the definitions and leaving the declarations).

Replacing the fundamental representation of a `chan` also meant changing the metadata structures which actually encode them in mainline Go. When you create a variable of any type, the associated initialiser, garbage collection routines, hash functions, and so on, are all stored in these metadata structures. Channels are actually represented along with most other types as a generic `commonType`. This single type enables several neat optimisations, such as for example using slices (arrays) of single types as arguments in all function signatures. Painfully, creating a separate type with these properties removed (the `FIFO` has no garbage collection routine, hash function, etc) meant enabling heterogeneous metadata types for functions signatures, arrays, slices, maps and structs themselves. The bookkeeping involved is significantly more complex, too, since type descriptors for each type can only be created once and must be identically mapped for all equivalent types in the future. Fixing this went most of the way to preserving existing Go functionality (see [Future Work](#future-work)).

Calls to create, read from and write to Go channels were replaced with equivalent operations on a FIFO type from libraries provided by the HLS tools (see [Overview](#overview)). For LegUp, this meant inserting `fifo_malloc`, `fifo_read` and `fifo_write` respectively. Go generates a default first argument for all functions to [pass closure information](https://groups.google.com/forum/#!topic/llgo-dev/z9mNiAO9888) which also had to be selectively removed for our runtime calls.

Invocations of the Go Garbage Collector were elided. Garbage collection for variables in hardware, as well as those shared between hardware and software, is an interesting problem - but it is beyond the scope of this work (see [Future Work](#future-work)). Calls to allocate new memory on the heap were replaced with allocations (LLVM `alloca`) in the current frame’s stack. Processes synthesised to hardware do not need to “delete” their memory, since these are permanently synthesised in hardware per design (for now). In future, garbage collection should be left in for software processes left in the program (see [Future Work](#future-work)).

Goroutines were replaced with calls to the `pthread` library. LegUp HLS replaces valid pthread code with its own abstractions about parallel processes, in turn generating independent hardware blocks. Go’s `go foo()` invocation of goroutines was thus replaced with calls to `pthread_create`. For correctness, the invoked function `foo()` was wrapped in an `auto_pthread_wrapper(void*)` function that called `foo()` and then `pthread_exit(...)`: goroutines are not expected to return values, so the return value of the pthread is then discarded. The wrapper function passes a pointer to a struct containing all arguments to the inner function, from the outer one. Note that closures, which capture values by reference, are not properly supported (see [Future Work](#future-work)).

Go’s runtime null-checking was removed. Among other runtime sanity checks, Go checks for null pointers before accessing them. This generates comparisons of pointers to `0` in generated C code (see [llvm-cbe](#llvm-cbe)) which the HLS tools can not understand.
### llvm-cbe
The LLVM project has [a C backend](https://github.com/JuliaComputing/llvm-cbe) (`llvm-cbe`) that generates C from LLVM IR. The C code itself is a more-or-less one-to-one mapping of LLVM IR statements to C, with little effort spent to generate human-readable code. The C backend [was deprecated](https://github.com/llvm-mirror/llvm/commit/a443e5b1f1013612950fc3c9ebfafca60a1c20df) in 2012 because C (especially ISO C) is [strictly less expressive](http://lists.llvm.org/pipermail/llvm-dev/2016-M ofay/099663.html) than LLVM IR and because of a lack of community interest in support. It was resurrected by the Julia project for its utility in spite of these limitations. Likewise for this project, the C backend is sufficiently expressive for generating synthesisable code: the greater limitation is what language constructs the HLS tools can understand. Moreover, several minor modifications were made to the backed so that it present acceptable-looking C to the HLS tools.

* Generated C must now `#include <pthread.h>`, but must not `#include <APInt-C.h>`, a custom header used in the Julia project.

* Where usually type (e.g. struct) names are generated by mangling their type and their LLVM name (e.g. `l_unnamed_1`), an exception was created for `FIFO` types to preserve the `FIFO` name. The declaration and definition of the `FIFO` type are also omitted wherever found. Together with the modifications to llgo, this means that generated C code references and uses the external library “`FIFO`” as would a programmer writing C from scratch.

* Labelled blocks (e.g. the target of a goto statement) are wrapped in curly braces.

* A main function was added to wrap the Go main function, since its name gets mangled through the LLVM pass.

* If targeting LegUp, the header file “`legup/streaming.h`” is included. On the other hand, “`hls_stream_wrapper.h`” is needed for Vivado HLS flow.
### Go static analysis
Go’s applications typically use many channels for communication between processes. If we synthesize each Go process and perform system integration, we need to know which processes are connected through which channel, the size and the datatype of each channel, etc., and thus the backend can make a decision to install that channel in FPGA fabric or not. For example, suppose process P1 writes to channel c, and process P2 reads from channel c. If we synthesize P1 and P2 to hardware, channel c should be installed as  a FIFO in FPGA, otherwise the communication of P1 and P2 would need to involve sending data and receiving data from the host.  As `llgo` is purely a source-to-source transformation tool, we use godoc’s analysis package which has pointer analysis capability to analyze the channel operations in a Go program [https://golang.org/lib/godoc/analysis/help.html] (though these steps could be integrated). We made minor modification to the original analysis code (which supports a web-based interface) to emit data in a format that is easily parsed by our backend script to do proper module instantiations.
### System integration
We verify that our flow produces correct RTL and works on a real FPGA by doing system integration. Our target device is Zedboard System-on-Chip. This is a platform which has an ARM CPU tightly coupled with an FPGA fabric (ZC7020). Expanding the work to modern FPGA such as Amazon F1 instance is possible and will be left for future work.

For this demonstration of system integration, we use Vivado HLS to generate RTL, but technically LegUp HLS can also be used. Once we get the generated C code from `llvm-cbe`, Vivado HLS is invoked to synthesize the processes that we want to put on the FPGA. For now, we require users to manually specify the processes for synthesis in a configuration file. In the future, we plan to automate this procedure by developing a novel algorithm for partitioning processes across CPU and FPGA to achieve optimal execution time (see [Future Work](#future-work)). Along with the information of channel operations, our backend script hooks up the generated RTL modules from Vivado HLS with FIFOs. To enable easy communication between host and FPGA, we use Xillybus IP core. It is a high-performant streaming IP that orchestrates the data flow from the ARM to the application logic in the FPGA and vice versa. However, it only supports streaming interface, thus random access or memory-mapped communication is not viable.

Once the modules are connected properly, we create a Vivado project to run Synthesis, Place and Route, and finally generate bitstream to configure the FPGA. We use Xillinux, a Linux distribution that comes along with the Xillybus IP core to boot the board and run the application.

## Installation
### Prerequisites
`llvm`, `llvm`, `clang` and `llvm-cbe` compile on an Ubuntu 16.04 machine with the following packages installed: `build-essential` `ninja-build` `cmake`

We [had problems](https://groups.google.com/forum/#!topic/llgo-dev/D921fYrojUI) compiling on a 17.10 machine.
### llgo`
We use `llvm`, `llgo` and `clang` at HEAD (as of 12/11/2017).

```
export TOP=$(pwd)
git clone https://git.llvm.org/git/llvm.git/ llvm
cd ${TOP}/llvm/tools
git clone https://git.llvm.org/git/clang.git/
git clone https://git.llvm.org/git/llgo.git/
cd ${TOP}
mkdir llvm-build
cd llvm-build
cmake -GNinja ${TOP}/llvm
ninja
# Remember the directory we're in as the directory into which we built LLVM at HEAD (for llgo)
export LLGO=${TOP}/llvm-build/bin/llgo
```
### llvm-cbe
We create a separate instance of llvm, pegged at the 3.7.0 release, and use clang from the same release. We then add in the llvm-cbe project from Julia. 

```
export TOP=$(pwd)
wget http://releases.llvm.org/3.7.0/cfe-3.7.0.src.tar.xz
git clone git@github.com:ucb-hls/llvm.git llvm-37
export LLVM_37=${TOP}/llvm-37
cd ${LLVM_37}
git checkout release_37
cd tools
tar -xvf ${TOP}/cfe-3.7.0.src.tar.xz
mv cfe-3.7.0.src clang
cd ../projects
git clone git@github.com:ucb-hls/llvm-cbe.git
cd ${TOP}
mkdir llvm-37-build
cd !$
cmake -GNinja $LLVM_37}
ninja
export LLVM_CBE=${TOP}/llvm-37-build/bin/llvm-cbe
```
### Godoc static analysis
```
Be sure to set the GOPATH environment variable first
go get golang.org/x/tools/cmd/godoc
cd $GOPATH/src/golang.org/x/tools/godoc/analysis
git apply /path/to/csp-hls/backend/godoc_analysis.patch 
```

### LegUp HLS
Download the tool for trial at: https://www.legupcomputing.com/
Follow the instructions for installation and a quick start tutorial: https://www.legupcomputing.com/docs/legup-5.1-docs/gettingstarted.html#

### Vivado HLS
Download the tool at: https://www.xilinx.com/support/download.html
Documentation: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug902-vivado-high-level-synthesis.pdf
### Xillybus
Download Xillinux bootable image file and sample design at: http://xillybus.com/download
Follow the instructions for how to boot Linux and run sample applications: http://xillybus.com/downloads/doc/xillybus_getting_started_zynq.pdf
## Usage
Run `llgo`: `${LLGO} -S -emit-llvm source.go`
This will generate `source.s`.
Run `llvm-cbe`: `${LLVM_CBE} source.s`
This will generate `source.s.cbe.c`.
Run HLS tool 
LegUp: 
Create a new project and specify the top-level as “main” or the name of the function you would like to synthesize to hardware
Add the source.s.cbe.c to the project
Run synthesis 
To verify the generated hardware, a verilog test bench can be added to the project. 
Vivado HLS: launch different synthesis runs for each process which is mapped to hardware
System integration
            As an example, go to `csp-hls/backend/`, then run: `go run main.go ../example/example1/example1` (Make sure to set `$GOPATH` environment variable)
            This will generate `chan.txt` which contains information of channel operations in `example1.go`
            Edit the file `hls_config.json` to specify the functions to synthesize, target timing constraint, and target device.
            Run: `python hardware_gen.py chan.txt hls_config.json`
            This will generate `xillydemo.v` which is the top-level module for the hardware design. The module instantiates the process modules, FIFOs, and their wirings.
## Results
It works! Except...
### Limitations / Difficulties

* Array support is incomplete. There is an `llvm-cbe` bug in passing arrays as arguments, so feeding in large data sets is hard.
* Closures which capture channels by reference do not work - the channels must be passed as explicit arguments so that they are copied to the function stack (preserving FIFO*s as FIFO*s, not FIFO**s). Invoking function by function pointer,  which is used in the mechanism for the calling the closures, is also not supported by the HLS tools. 
* The channel ‘select’ operation is not supported.
* There is no library support, so we cannot use math functions.
* Our tool flow is still hard to use and very finicky. We have to maintain an instance of LLVM at HEAD and at release 3.7.0, as well as the various HLS backends.
### Examples / Benchmarks
We write several simple Go benchmarks to test our flow. The benchmarks leverage channels to stream data from one task to another task, as Go’s channel is the focal point in our work. Benchmark `box_filter` implements blur 3x3 filters. `conv2d` performs convolution on a 2D matrix with a filter size of 3x3. We also create a synthetic benchmark which chains three `conv2d` function in a pipeline. The code of our benchmarks [can be found](../../examples/great_success) in our Github repository.

The following table lists the execution times of several benchmarks:

Benchmark | Size (matrix size, filter size) | CPU only (seconds) | CPU-FPGA (seconds) | Speedup
---- | ---- | ---- | ---- | ----
`box_filter` | 4096x4096, 3x3 | 30 | 62 | 0.48 
`conv2d_1` | 4096x4096, 3x3 | 58.94 | 90.6 | 0.65
`conv2d_2` (3 tasks) | 1024x1024, 3x3 |7.56 | 3.86 | 1.96

We were not able to achieve speedup on `box_filter` or `conv2d_1`. We speculate that it is because the amount of computation of those benchmarks is small in comparison with the overhead of data transfer from the host to the FPGA. Those are tiny benchmarks which consist of two streaming tasks. Benchmark `conv2d_2` achieves a speedup of 1.96 as it involves a pipeline of three convolutional tasks. Thus, the data circulates in the FPGA longer before being sent back to the host. To benefit from the computational model that our tool flow supports, we think that the right applications would entail a long pipeline of tasks, or parallel pipelines of tasks to achieve higher degree of concurrency, such as image processing pipeline. Due to timing constraint, we could not port any image processing pipeline examples to test on our flow, but this could be an interesting study for future work.
Concept examples

A [fixed-size sort][sort_128/sort_128] is implemented using channels and repeated application of divide/merge processes. The algorithm implements a merge sort on a fixed input vector, demonstrating how hardware could be synthesised to support fixed applications, such as in video processing, where the size of input video frames is known to be bounded at compile time. The code is extremely verbose, explicitly expressing every operation at every level of the merge sort, to avoid using arrays. There is still a bug in the generated C [link to issue, https://github.com/hqjenny/csp-hls/issues/18] that prevents this synthesising. Ideally such an algorithm would be expressed with array of channels to generate the divide/conquer steps, as shown in [a more readable version][sort_sanely/sort.go].
Discussion 
We have demonstrated a working end-to-end toolchain for synthesising a subset of Go to hardware in both LegUp and Vivado HLS environments. In particular, we show that CSP-style algorithms built with Go’s channels and goroutines map can be straightforwardly mapped to hardware. First, we modified our Go compiler to generate LLVM IR to use types and functions available in the LegUp environment. Second, we modified the LLVM C backend to generate satisfactory C from that IR for the HLS tool chain. With a further wrapper library and scripting, we enabled the generated program to be synthesised to a Vivado FPGA/SoC development board. We verified the toolchain by synthesising a few examples; our preliminary benchmarks confirm that, where the independent processes perform sufficiently complex operations, there is a significant performance advantage to running the code in FPGAs.

The most difficult part of this project was understanding the requirements at each of the component boundaries. What subset of valid C does the HLS suite support? How different are Vivado’s expectations? What form of the LLVM IR does the C backend understand? What are the assumptions behind the design decisions made in the Go compiler, and how far can we stretch them to mutate types and the IR? With more effort spent to reverse engineer (or collaborate with the community around) each software component, we expect that a more tightly integrated, and much more robust toolchain can be produced.

Though our support for Go features is incomplete, it is sufficiently cohesive to demonstrate how programs written with Go’s CSP-style concurrency model naturally fit hardware acceleration. The semantics of our Go programs (from the view of the programmer) are carried through to the hardware unchanged; the intermediate forms simply have to get out of the way. That said, a founding observation of this work was that usability is one of the key barriers to the widespread adoption of FPGAs. Writing concurrent programs in Go actually _felt_ simple, and having them synthesised in hardware _felt_ very satisfying. Our toolchain on the other hand, as a prototype, is finicky, and needs to be automatic and more robust. As will be discussed in Future Work, we now have a good understanding of the work needed to achieve this.


## Future Work
### Feature completeness, bug scrub
**Make the flow automatic.** Wrap all steps in a management script (including installation of relevant parts).

**Fix bug in passing array arguments.** A [problem with llvm-cbe][https://github.com/hqjenny/csp-hls/issues/18] prevents array arguments from being passed correctly. We have thus avoided using arrays. We have to make sure that struct arguments passed in LLVM “byref”

**Fix Go runtime functions to use new object types.** To support general hardware/software partitioning within the same program, types like “chan” will have to have both a software and a hardware implementation, mapped as needed by the compiler. Software channels must be supported by the existing Go runtime while hardware channels are mapped to the FIFO structures. Any implicit use of runtime functions that don’t make sense for hardware types (garbage collection, hashes) must be removed.

What is more, having modified the fundamental types of a Go structs, arrays, and so on, builtin Go functions should be modified to use them correctly. As a concrete example, the number of elements in a struct is now [stored as element 1][https://github.com/ucb-hls/llgo/blob/4ea958816fea3701ec202169ce96d5521d236bb7/irgen/typemap.go#L407], not at fixed position 2, since the field types are heterogeneous and the end slot is in an unknown position.

**Complete Go channel features.** Go supports ‘select’ operations on channels:

```
select {
case msg1 := <-c1:
    fmt.Println("received", msg1)
case msg2 := <-c2:
    fmt.Println("received", msg2)
}
```

Here, the first channel with data available will be read from, and the remaining cases skipped. This relies on checking whether the channel has any data available to prevent blocking on it, functionality that is not exposed to the programmer directly. The FIFO queue structures synthesised in hardware provide a ready signal to implement such a test. The Go compiler also treats this use of channels as explicitly different, mapping it to a distinct runtime call. We can replace this call as we have done for regular (blocking) reads and writes, but with the (for example) LegUp library function `fifo_read_nb`.

Go also supports channel closure. You can check if a channel is closed with this form of channel read:

```
c := make(chan int)
close(c)
value, ok := <-c
```
In this code, `ok` will return false (https://tour.golang.org/concurrency/4) if there are no more values and the channel is closed. We can support this in hardware by pairing a boolean value with each generated FIFO to keep track of its closure state, and by creating a wrapper function for reads that matches the semantics of this read and test (combining the previous non-blocking read call).

Implementing channel `close` should then enable the `range` expression on a channel, which reads until the channel is closed:

```
c := make(chan int)
go func() { range x := c }()
```

**Support closures.** Closures that capture variables in their parent’s scope do so by reference, in practise by storing pointers to all variables in a struct of arguments. This allows a programmer to conveniently write:


```
c := make(chan int)
go func() { c <- 2 }()
```

HLS tools struggle to analyse the usage of the captured ‘c’ channel, because the inner function is passed a pointer to it, or effectively FIFO**. Passes by value would pass the FIFO*, so we have to avoid using closures with automatic capture. The following is thus synthesizable:


```
c := make(chan int)
go func(ic chan int) { ic <- 2 }(c)
```

Assuming a suitable hardware/software partition, we can allow Go code running with the regular Go runtime to support all of its features unchanged. This includes closures, which capture variables by reference, but which need careful handling before HLS can work on the memory indirection they introduce. Closures in code targeted to hardware should be treated differently. For primitive types, one level of indirection is not a problem, but for our introduced “FIFO*” type it is: passing a FIFO** where a FIFO* suffices confuses HLS tools. But the FIFO** is always used as a FIFO* since the outer memory pointer is not modifiable in Go’s syntax, so we can just remove one level of indirection when generating the arguments. This shouldn’t be a problem for other types, but in the worst case we can warn the programmer that their desired semantics are not synthesisable.

**Support channel/process sharing.** In a typical Go program, a channel will be explicitly closed (by using close() function) when it is not being used any more. Using godoc’s static analysis, we can analyze the liveness of each channel in a program. If there is two hardware channels which have non-overlapping livenesses and they also have the same size and datatype, it would be more beneficial to bind them to save resource of the FPGA. In hardware, this would entail using a multiplexer to multiplex the operations on the channel. Likewise, a hardware process can also be shared if it is invoked in non-overlapping callers’ execution.

**Support worker pools.**  Worker pool is a popular feature of Go. It allows the user to specify N worker to run on M tasks concurrently. These workers will receive work on the jobs channel and send the corresponding results back to the result channel. In general, this construct helps to amortizing the costs of spinning up new available worker processes. Supporting this feature will ensure that our tool flow is compatible to a rich set of Go code.

**Support external methods (e.g. in libraries).** Not being able to use external library functions (for example, anything from the math library) is a serious impediment to productivity. We can start by importing, converting, and inlining functions referenced in other libraries into the single source file being generated. The next step would be to implement recursive generation of C source for all referenced library functions. Go’s frontend already loads imports in other packages so IR generation should be straightforward; the C backend, however, will need to make sure definitions and declarations are split correctly.

**Implement a hardware deadlock detection mechanism.** Go performs runtime deadlock detection: if all goroutines are asleep, it generates a panic. It would be useful to detect this state in hardware too, but it will require modification of the generated queues. For every goroutine converted to a pthread and eventually synthesised as a separate process, it should be possible to insert a “sleep” signal, which is high when the process is waiting. Since the total number of processes are known upfront, we can generate an error state when all such signals are high.

**Produce more examples and gather more benchmarks.** Several candidate examples were not possible within the limits of Go we supported and bugs we found (or created). It would be very useful to understand what kinds of applications synthesise sensibly and which might need additional programmer hints. Good candidates are digital signal processing applications: discrete fourier transforms, sorts, clustering (k-means), image processing pipeline, and so on.
