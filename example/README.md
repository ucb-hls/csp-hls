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

They seem related to garbage collection, but this works when we compile LLVM ourselves, so what are they being linked against? How do we make sure they're declared?

### Go Runtime APIs
APIs: 
[https://github.com/llvm-mirror/llgo/blob/ff92724c045e4856191d137bdda914e1b5de8950/irgen/runtime.go](https://github.com/llvm-mirror/llgo/blob/ff92724c045e4856191d137bdda914e1b5de8950/irgen/runtime.go)

Implementation:
[https://github.com/llvm-mirror/llgo/blob/de4db9f8144f40014e8b32d263a91478e6f1a21f/third_party/gofrontend/libgo/runtime/chan.goc#L1](https://github.com/llvm-mirror/llgo/blob/de4db9f8144f40014e8b32d263a91478e6f1a21f/third_party/gofrontend/libgo/runtime/chan.goc#L1)


Examples: Type `make`  under the corresponding folders
1. Unbuferred Channel (additional go_new function)
 __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), UINT64_C(0));
 __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsree.field0.field0)), UINT64_C(8));

2. Bufferd Channel
	See most examples

3._Close Channel
	go_builtin_close
4. Range Channel 
  llvm_cbe_tmp__11 = runtime_OC_chanrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), llvm_cbe_tmp__10, (((uint8_t*)(&llvm_cbe_tmp__7))));
#	in a loop

5. Select
uint8_t* runtime_OC_newselect(uint8_t*, uint32_t);
uint64_t runtime_OC_selectgo(uint8_t*, uint8_t*);
void runtime_OC_selectrecv2(uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t);

6. Worker Pool
its own function main_OC_worker



