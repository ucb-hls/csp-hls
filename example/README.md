# Build notes

## llgo

This works at HEAD. Configure with cmake and build with ninja (`ninja-build` package on ubuntu).

On an Amazon (...) EC2 instance it works fine, but in my home virtual machine I get errors about compiling with -fPIC even though cmake claims to enable PIC.

Build steps:
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
export LLVM_HEAD_BUILD=${TOP}/llvm-build
```

Use:
1. `${LLVM_HEAD_BUILD}/bin/llgo -S -emit-llvm <go_source_file_name>.go`
2. Remove the 2nd line in the file, `source_filename = "main"` (or equivalent)
3. Remember where the emitted file is - it'll be called `<go_source_file_name>.s`


## llvm-cbe

Source: [Julia's CBE revival](https://github.com/JuliaComputing/llvm-cbe)

The CppBackend resurrected by Julia works with LLVM release 3.7.0 (and clang 3.7.0/3.7.1) but not with HEAD.

Download release 3.7.0 tarballs for [LLVM](http://releases.llvm.org/3.7.0/llvm-3.7.0.src.tar.xz) and [clang](http://releases.llvm.org/3.7.0/cfe-3.7.0.src.tar.xz) [here](http://releases.llvm.org/download.html#3.7.0).

Steps:
1. Build LLVM with clang in it as above but create the source tree using the prepackaged release 3.7.0 tarballs, and
2. also add `llvm-cbe` to the projects directory before building. Call the root of this version of the source tree `LLVM_37_SRC` and
```
cd ${LLVM_37_SRC}/projects
git clone https://github.com/JuliaComputing/llvm-cbe.git llvm-cbe
mkdir ${TOP}/llvm-37-build
cd ${TOP}/llvm-37-build
cmake -GNinja ${LLVM_37_SRC}
ninja
export LLVM_37_BUILD=${TOP}/llvm-37-build
```

Observed differences between release 3.7.0 builds and HEAD buils:

* clang 3.7 and whatever's currently at head generate the line `source_filename = "main.c"` (for example on an input source file `main.c`) which cause llvm-cbe to spew the error: `error: expected top-level entity`

Work log:

* The llvm-cbe-generated C files seem have an `#include <APInt-C.h>` that we don't have. We could get it or, in cases where nothing from that header are actually used, we can just delete the line. See this issue: https://github.com/JuliaComputing/llvm-cbe/issues/1

Use:
1. `${LLVM_37_BUILD}/bin/llvm-cbe <go_source_file_name>.s`
2. This will generate `<go_source_file_name>.s.cbe.s`. Edit this and remote the `#include <APInt-C.h>` - or find the file and add it to the include path, seeing note above.

### Compilation weirdness

I ran into this problem when compiling on a new 32-core AWS instance:

```
ubuntu@ip-172-31-28-222:~/llvm-37-build$ ninja
[277/2419] Building CXX object projects/llvm-cbe/lib/Target/CBackend/CMakeFiles/LLVMCBackendCodeGen.dir/CBackend.cpp.o
FAILED: /usr/bin/c++   -DGTEST_HAS_RTTI=0 -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -Iprojects/llvm-cbe/lib/Target/CBackend -I/home/ubuntu/llvm-37/projects/llvm-cbe/lib/Target/CBackend -Iinclude -I/home/ubuntu/llvm-37/include -fPIC -fvisibility-inlines-hidden -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcast-qual -Wno-missing-field-initializers -pedantic -Wno-long-long -Wno-maybe-uninitialized -Wnon-virtual-dtor -Wno-comment -std=c++11 -ffunction-sections -fdata-sections   -fno-exceptions -fno-rtti -MMD -MT projects/llvm-cbe/lib/Target/CBackend/CMakeFiles/LLVMCBackendCodeGen.dir/CBackend.cpp.o -MF projects/llvm-cbe/lib/Target/CBackend/CMakeFiles/LLVMCBackendCodeGen.dir/CBackend.cpp.o.d -o projects/llvm-cbe/lib/Target/CBackend/CMakeFiles/LLVMCBackendCodeGen.dir/CBackend.cpp.o -c /home/ubuntu/llvm-37/projects/llvm-cbe/lib/Target/CBackend/CBackend.cpp
In file included from /home/ubuntu/llvm-37/include/llvm/CodeGen/IntrinsicLowering.h:19:0,
                 from /home/ubuntu/llvm-37/projects/llvm-cbe/lib/Target/CBackend/CBackend.h:7,
                 from /home/ubuntu/llvm-37/projects/llvm-cbe/lib/Target/CBackend/CBackend.cpp:15:
/home/ubuntu/llvm-37/include/llvm/IR/Intrinsics.h:40:34: fatal error: llvm/IR/Intrinsics.gen: No such file or directory
compilation terminated.
[277/2419] Building CXX object utils/unittest/CMakeFiles/gtest.dir/googletest/src/gtest-all.cc.o
ninja: build stopped: subcommand failed.
```

But limiting ninja to use 12 jobs fixed it:
```
ubuntu@ip-172-31-28-222:~/llvm-37-build$ ninja -j 12
[2419/2419] Creating executable symlink bin/clang
```

I assume this is because some dependency isn't correctly computed.

### Outstanding problems

`gcc -w <go_source_file_name>.s.cbe.c` will dump errors because the following symbols are undefined:

```
three.s.cbe.c:303:101: error: ‘__go_type_hash_AIe1e_descriptor’ undeclared here (not in a function)
 struct l_struct_arrayType __go_td_AIe1e __attribute__((common)) = { { 17, 8, 8, UINT64_C(16), 30, (&__go_type_hash_AIe1e_descriptor), (&__go_type_hash_AIe1e
                                                                                                     ^
three.s.cbe.c:303:137: error: ‘__go_type_hash_AIe1e_descriptor_OC_2’ undeclared here (not in a function)
 struct l_struct_arrayType __go_td_AIe1e __attribute__((common)) = { { 17, 8, 8, UINT64_C(16), 30, (&__go_type_hash_AIe1e_descriptor), (&__go_type_hash_AIe1e
                                                                                                                                         ^
three.s.cbe.c:303:189: error: ‘__go_td_AIe1e_EC_gc’ undeclared here (not in a function)
 ttribute__((common)) = { { 17, 8, 8, UINT64_C(16), 30, (&__go_type_hash_AIe1e_descriptor), (&__go_type_hash_AIe1e_descriptor_OC_2), ((uint8_t*)(&__go_td_AIe
                                                                                                                                                  ^
three.s.cbe.c:303:214: error: ‘tmp__39’ undeclared here (not in a function)
 { 17, 8, 8, UINT64_C(16), 30, (&__go_type_hash_AIe1e_descriptor), (&__go_type_hash_AIe1e_descriptor_OC_2), ((uint8_t*)(&__go_td_AIe1e_EC_gc)), (&tmp__39), (
                                                                                                                                                  ^
three.s.cbe.c:303:315: error: ‘__go_td_Ie’ undeclared here (not in a function)
 C_2), ((uint8_t*)(&__go_td_AIe1e_EC_gc)), (&tmp__39), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.
                                                                                                                                                  ^
three.s.cbe.c:303:339: error: ‘__go_td_AIee’ undeclared here (not in a function)
 td_AIe1e_EC_gc)), (&tmp__39), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)), ((&__go_td_AIe
                                                                                                                                                  ^
three.s.cbe.c:304:196: error: ‘__go_tdn_int_EC_gc’ undeclared here (not in a function)
 e__((common)) = { 130u, 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_in
                                                                                                                                                  ^
three.s.cbe.c:304:220: error: ‘tmp__40’ undeclared here (not in a function)
 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__40), (
                                                                                                                                                  ^
three.s.cbe.c:304:232: error: ‘tmp__41’ undeclared here (not in a function)
 _C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__40), (&tmp__41), (
                                                                                                                                                  ^
three.s.cbe.c:309:206: error: ‘__go_td_Ie_EC_gc’ undeclared here (not in a function)
 on)) = { { 20, 8, 8, UINT64_C(16), 16, (&__go_type_hash_empty_interface_descriptor), (&__go_type_equal_empty_interface_descriptor), ((uint8_t*)(&__go_td_Ie_
                                                                                                                                                  ^
three.s.cbe.c:309:228: error: ‘tmp__43’ undeclared here (not in a function)
 INT64_C(16), 16, (&__go_type_hash_empty_interface_descriptor), (&__go_type_equal_empty_interface_descriptor), ((uint8_t*)(&__go_td_Ie_EC_gc)), (&tmp__43), (
                                                                                                                                                  ^
three.s.cbe.c:310:184: error: ‘__go_td_AIee_EC_gc’ undeclared here (not in a function)
  __attribute__((common)) = { { 23, 8, 8, UINT64_C(24), 30, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_AIe
                                                                                                                                                  ^
three.s.cbe.c:310:208: error: ‘tmp__44’ undeclared here (not in a function)
  = { { 23, 8, 8, UINT64_C(24), 30, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_AIee_EC_gc)), (&tmp__44), (
```

These functions are defined by the Go libraries, e.g. llgo/third_party/gotools. We don't care about fully linking against them so we can ignore them.

### Go Runtime APIs
APIs: 
[https://github.com/llvm-mirror/llgo/blob/ff92724c045e4856191d137bdda914e1b5de8950/irgen/runtime.go](https://github.com/llvm-mirror/llgo/blob/ff92724c045e4856191d137bdda914e1b5de8950/irgen/runtime.go)

Implementation:
[https://github.com/llvm-mirror/llgo/blob/de4db9f8144f40014e8b32d263a91478e6f1a21f/third_party/gofrontend/libgo/runtime/chan.goc#L1](https://github.com/llvm-mirror/llgo/blob/de4db9f8144f40014e8b32d263a91478e6f1a21f/third_party/gofrontend/libgo/runtime/chan.goc#L1)

Go SSA Viewer:
https://golang-ssaview.herokuapp.com/

Go AST Viewer: 
http://goast.yuroyoro.net/

Examples: Type `make`  under the corresponding folders
1. Unbuferred Channel (additional go_new function)
 __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), UINT64_C(0));
 __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsree.field0.field0)), UINT64_C(8));

2. Bufferd Channel
	See most examples

3. Close Channel
	go_builtin_close
4. Range Channel 
  llvm_cbe_tmp__11 = runtime_OC_chanrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), llvm_cbe_tmp__10, (((uint8_t*)(&llvm_cbe_tmp__7)))); // in a loop

5. Select
uint8_t* runtime_OC_newselect(uint8_t*, uint32_t);
uint64_t runtime_OC_selectgo(uint8_t*, uint8_t*);
void runtime_OC_selectrecv2(uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t);

6. Worker Pool
its own function main_OC_worker



More go examples:
[https://github.com/avelino/awesome-go#benchmarks](https://github.com/avelino/awesome-go#benchmarks)


### Go Debuggging
In llgo, add: 
fr.module.Module.Dump()
fn.Dump()

### Go static analysis
godoc provides static analysis package which allows us to find information regarding channel connections in a Go benchmark. This would be helpful for the backend as to hook up Go processes and channels properly in hardware. More detail:

https://golang.org/lib/godoc/analysis/help.html

Installation:
Be sure to set the GOPATH envar first
go get golang.org/x/tools/cmd/godoc
The package can be found at $GOPATH/src/golang.org/x/tools/godoc/analysis
git apply $(PWD)/../go_static_analysis/godoc_analysis.patch $GOPATH/src/golang.org/x/tools/godoc/analysis

Example:
cd $(PWD)/../go_static_analysis
go run main.go /path/to/example/example1/example1 (path to Go code for analysis, make sure to omit ".go")
It will generate an output file chan.txt:

10:int main.main {[{{received ?s=102:104#L7} main.process1} {{sent ?s=399:401#L24} main.main}]}                               
10:int main.main {[{{received ?s=215:217#L14} main.process2} {{sent ?s=117:119#L8} main.process1}]}
10:int main.main {[{{sent ?s=230:232#L15} main.process2} {{received ?s=507:509#L30} main.main}]}

The first column is channel_size:channel_type. The second column is the function which a channel is made. The third one is the processes operating on this channel (send/receive).
