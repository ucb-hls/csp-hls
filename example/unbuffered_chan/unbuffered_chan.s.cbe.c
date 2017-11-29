/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#include <stdint.h>
#include <math.h>
#include <APInt-C.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef _MSC_VER
#define __UNALIGNED_LOAD__(type, align, op) *((type __unaligned*)op)
#else
#define __UNALIGNED_LOAD__(type, align, op) ((struct { type data __attribute__((packed, aligned(align))); }*)op)->data
#endif

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
#endif

#ifdef _MSC_VER
#define __builtin_unreachable() __assume(0)
#define __noreturn __declspec(noreturn)
#else
#define __noreturn __attribute__((noreturn))
#define __forceinline __attribute__((always_inline))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#else
#define LLVM_NAN(NanStr)   ((double)NAN)           /* Double */
#define LLVM_NANF(NanStr)  ((float)NAN))           /* Float */
#define LLVM_INF           ((double)INFINITY)      /* Double */
#define LLVM_INFF          ((float)INFINITY)       /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__ "__attribute__((constructor)) not supported on this compiler"
#define __ATTRIBUTE_DTOR__ "__attribute__((destructor)) not supported on this compiler"
#endif

#if !defined(__GNUC__) || __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if defined(__GNUC__) && defined(__LP64__) /* 128-bit integer types */
typedef int __attribute__((mode(TI))) int128_t;
typedef unsigned __attribute__((mode(TI))) uint128_t;
#define UINT128_C(hi, lo) (((uint128_t)(hi) << 64) | (uint128_t)(lo))
static __forceinline uint128_t llvm_ctor_u128(uint64_t hi, uint64_t lo) { return UINT128_C(hi, lo); }
static __forceinline bool llvm_icmp_eq_u128(uint128_t l, uint128_t r) { return l == r; }
static __forceinline bool llvm_icmp_ne_u128(uint128_t l, uint128_t r) { return l != r; }
static __forceinline bool llvm_icmp_ule_u128(uint128_t l, uint128_t r) { return l <= r; }
static __forceinline bool llvm_icmp_sle_i128(int128_t l, int128_t r) { return l <= r; }
static __forceinline bool llvm_icmp_uge_u128(uint128_t l, uint128_t r) { return l >= r; }
static __forceinline bool llvm_icmp_sge_i128(int128_t l, int128_t r) { return l >= r; }
static __forceinline bool llvm_icmp_ult_u128(uint128_t l, uint128_t r) { return l < r; }
static __forceinline bool llvm_icmp_slt_i128(int128_t l, int128_t r) { return l < r; }
static __forceinline bool llvm_icmp_ugt_u128(uint128_t l, uint128_t r) { return l > r; }
static __forceinline bool llvm_icmp_sgt_i128(int128_t l, int128_t r) { return l > r; }
#else /* manual 128-bit types */
typedef struct { uint64_t lo; uint64_t hi; } uint128_t;
typedef uint128_t int128_t;
#define UINT128_C(hi, lo) {(lo), (hi)}
static __forceinline uint128_t llvm_ctor_u128(uint64_t hi, uint64_t lo) { uint128_t r; r.lo = lo; r.hi = hi; return r; }
static __forceinline bool llvm_icmp_eq_u128(uint128_t l, uint128_t r) { return l.hi == r.hi && l.lo == r.lo; }
static __forceinline bool llvm_icmp_ne_u128(uint128_t l, uint128_t r) { return l.hi != r.hi || l.lo != r.lo; }
static __forceinline bool llvm_icmp_ule_u128(uint128_t l, uint128_t r) { return l.hi < r.hi ? 1 : (l.hi == r.hi ? l.lo <= l.lo : 0); }
static __forceinline bool llvm_icmp_sle_i128(int128_t l, int128_t r) { return (int64_t)l.hi < (int64_t)r.hi ? 1 : (l.hi == r.hi ? (int64_t)l.lo <= (int64_t)l.lo : 0); }
static __forceinline bool llvm_icmp_uge_u128(uint128_t l, uint128_t r) { return l.hi > r.hi ? 1 : (l.hi == r.hi ? l.lo >= l.hi : 0); }
static __forceinline bool llvm_icmp_sge_i128(int128_t l, int128_t r) { return (int64_t)l.hi > (int64_t)r.hi ? 1 : (l.hi == r.hi ? (int64_t)l.lo >= (int64_t)l.lo : 0); }
static __forceinline bool llvm_icmp_ult_u128(uint128_t l, uint128_t r) { return l.hi < r.hi ? 1 : (l.hi == r.hi ? l.lo < l.hi : 0); }
static __forceinline bool llvm_icmp_slt_i128(int128_t l, int128_t r) { return (int64_t)l.hi < (int64_t)r.hi ? 1 : (l.hi == r.hi ? (int64_t)l.lo < (int64_t)l.lo : 0); }
static __forceinline bool llvm_icmp_ugt_u128(uint128_t l, uint128_t r) { return l.hi > r.hi ? 1 : (l.hi == r.hi ? l.lo > l.hi : 0); }
static __forceinline bool llvm_icmp_sgt_i128(int128_t l, int128_t r) { return (int64_t)l.hi > (int64_t)r.hi ? 1 : (l.hi == r.hi ? (int64_t)l.lo > (int64_t)l.lo : 0); }
#define __emulate_i128
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif



/* Support for floating point constants */
typedef uint64_t ConstantDoubleTy;
typedef uint32_t ConstantFloatTy;
typedef struct { uint64_t f1; uint16_t f2; uint16_t pad[3]; } ConstantFP80Ty;
typedef struct { uint64_t f1; uint64_t f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  uint32_t Int32;
  uint64_t Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* Types Declarations */
struct l_struct_funcVal;
struct l_unnamed_4;
struct l_struct_method;
struct l_struct_methodSlice;
struct l_struct_uncommonType;
struct l_struct_commonType;
struct l_struct_chanType;
struct l_struct_structField;
struct l_struct_structFieldSlice;
struct l_struct_structType;
struct l_struct_arrayType;
struct l_struct_imethod;
struct l_struct_imethodSlice;
struct l_struct_interfaceType;
struct l_struct_sliceType;
struct l_struct_ptrType;
struct l_unnamed_1;
struct l_unnamed_5;
struct l_unnamed_2;
struct l_unnamed_3;
typedef void l_fptr_1(void);

/* Types Definitions */
struct l_struct_funcVal {
  l_fptr_1* field0;
};
struct l_unnamed_4 {
  uint8_t* field0;
  uint64_t field1;
};
struct l_struct_method {
  struct l_unnamed_4* field0;
  struct l_unnamed_4* field1;
  struct l_struct_commonType* field2;
  struct l_struct_commonType* field3;
  uint8_t* field4;
};
struct l_struct_methodSlice {
  struct l_struct_method* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_struct_uncommonType {
  struct l_unnamed_4* field0;
  struct l_unnamed_4* field1;
  struct l_struct_methodSlice field2;
};
struct l_struct_commonType {
  uint8_t field0;
  uint8_t field1;
  uint8_t field2;
  uint64_t field3;
  uint32_t field4;
  struct l_struct_funcVal* field5;
  struct l_struct_funcVal* field6;
  uint8_t* field7;
  struct l_unnamed_4* field8;
  struct l_struct_uncommonType* field9;
  struct l_struct_commonType* field10;
};
struct l_struct_chanType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
  uint64_t field2;
};
struct l_struct_structField {
  struct l_unnamed_4* field0;
  struct l_unnamed_4* field1;
  struct l_struct_commonType* field2;
  struct l_unnamed_4* field3;
  uint64_t field4;
};
struct l_struct_structFieldSlice {
  struct l_struct_structField* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_struct_structType {
  struct l_struct_commonType field0;
  struct l_struct_structFieldSlice field1;
};
struct l_struct_arrayType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
  struct l_struct_commonType* field2;
  uint64_t field3;
};
struct l_struct_imethod {
  struct l_unnamed_4* field0;
  struct l_unnamed_4* field1;
  struct l_struct_commonType* field2;
};
struct l_struct_imethodSlice {
  struct l_struct_imethod* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_struct_interfaceType {
  struct l_struct_commonType field0;
  struct l_struct_imethodSlice field1;
};
struct l_struct_sliceType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
};
struct l_struct_ptrType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
};
struct l_array_5_uint8_t_KC_ {
  uint8_t* array[5];
};
struct l_array_1_struct_AC_l_struct_structField {
  struct l_struct_structField array[1];
};
struct l_array_9_uint8_t_KC_ {
  uint8_t* array[9];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_4_uint8_t_KC_ {
  uint8_t* array[4];
};
struct l_array_36_uint8_t {
  uint8_t array[36];
};
struct l_array_29_uint8_t {
  uint8_t array[29];
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_34_uint8_t {
  uint8_t array[34];
};
struct l_array_32_uint8_t {
  uint8_t array[32];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_unnamed_1 {
  uint8_t* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_unnamed_5 {
  uint8_t* field0;
  uint8_t* field1;
};
struct l_unnamed_2 {
  uint64_t field0;
  struct l_unnamed_5 field1;
};
struct l_unnamed_3 {
  uint8_t* field0;
};
struct l_array_1_struct_AC_l_unnamed_5 {
  struct l_unnamed_5 array[1];
};
struct l_array_2_struct_AC_l_unnamed_5 {
  struct l_unnamed_5 array[2];
};

/* Function definitions */


/* External Global Variable Declarations */
extern struct l_struct_funcVal __go_type_hash_empty_interface_descriptor;
extern struct l_struct_funcVal __go_type_equal_empty_interface_descriptor;
extern struct l_struct_funcVal __go_type_hash_string_descriptor;
extern struct l_struct_funcVal __go_type_equal_string_descriptor;
extern struct l_struct_funcVal __go_type_hash_identity_descriptor;
extern struct l_struct_funcVal __go_type_equal_identity_descriptor;
extern struct l_struct_funcVal __go_type_hash_error_descriptor;
extern struct l_struct_funcVal __go_type_equal_error_descriptor;

/* Function Declarations */
void __go_go(uint8_t*, uint8_t*, uint8_t*);
uint8_t* __go_new(uint8_t*, uint8_t*, uint64_t);
uint8_t* __go_new_channel(uint8_t*, uint8_t*, uint64_t);
void __go_receive(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
void __go_send_big(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
uint64_t __go_type_hash_empty_interface(uint8_t*, uint64_t);
uint8_t __go_type_equal_empty_interface(uint8_t*, uint8_t*, uint64_t);
uint64_t __go_type_hash_identity(uint8_t*, uint64_t);
uint8_t __go_type_equal_identity(uint8_t*, uint8_t*, uint64_t);
void main_OC__OC_import(uint8_t*);
void fmt_OC__OC_import(uint8_t*);
void time_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void tmp__49(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_1(uint8_t*, uint8_t*);
struct l_unnamed_2 fmt_OC_Println(uint8_t*, struct l_unnamed_1);
void time_OC_Sleep(uint8_t*, uint64_t);
uint64_t __go_type_hash_AIe1e(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_hash_AIe1e_OC_1(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint64_t __go_type_hash_AIe2e(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_hash_AIe2e_OC_3(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint64_t __go_type_hash_S0_CN3_intsree(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_equal_S0_CN3_intsree(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
void __go_init_main(uint8_t*);


/* Global Variable Definitions and Initialization */
uint8_t* main_OC__OC_import_EC_descriptor = ((uint8_t*)main_OC__OC_import);
static bool init_EC_guard;
uint8_t* main_OC_main_EC_descriptor = ((uint8_t*)main_OC_main);
struct l_struct_chanType __go_td_CN3_intsre __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), 1610653383u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN3_intsre_EC_gc)), (&tmp__124), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_int), UINT64_C(3) };
struct l_struct_structType __go_td_S0_CN3_intsree __attribute__((common)) = { { 25, 8, 8, UINT64_C(8), 2147646248u, (&__go_type_hash_S0_CN3_intsree_descriptor), (&__go_type_equal_S0_CN3_intsree_descriptor), ((uint8_t*)(&__go_td_S0_CN3_intsree_EC_gc)), (&tmp__125), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS0_CN3_intsree.field0)) }, { ((&tmp__126.array[((int32_t)0)])), UINT64_C(1), UINT64_C(1) } };
struct l_struct_arrayType __go_td_AIe1e __attribute__((common)) = { { 17, 8, 8, UINT64_C(16), 30, (&__go_type_hash_AIe1e_descriptor), (&__go_type_hash_AIe1e_descriptor_OC_2), ((uint8_t*)(&__go_td_AIe1e_EC_gc)), (&tmp__127), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)), ((&__go_td_AIee.field0)), UINT64_C(1) };
static struct l_array_31_uint8_t tmp__50 = { { 77u, 97u, 105u, 110u, 32, 103u, 111u, 114u, 111u, 117u, 116u, 105u, 110u, 101u, 32, 115u, 108u, 101u, 101u, 112u, 115u, 32, 50, 32, 115u, 101u, 99u, 111u, 110u, 100u, 115u } };
struct l_struct_commonType __go_tdn_string __attribute__((common)) = { 24, 8, 8, UINT64_C(16), 100666096, (&__go_type_hash_string_descriptor), (&__go_type_equal_string_descriptor), ((uint8_t*)(&__go_tdn_string_EC_gc)), (&tmp__128), (&tmp__129), ((struct l_struct_commonType*)/*NULL*/0) };
static struct l_array_36_uint8_t tmp__51 = { { 77u, 97u, 105u, 110u, 32, 103u, 111u, 114u, 111u, 117u, 116u, 105u, 110u, 101u, 32, 98u, 101u, 103u, 105u, 110u, 115u, 32, 114u, 101u, 99u, 101u, 105u, 118u, 105u, 110u, 103u, 32, 100u, 97u, 116u, 97u } };
struct l_struct_arrayType __go_td_AIe2e __attribute__((common)) = { { 17, 8, 8, UINT64_C(32), 30, (&__go_type_hash_AIe2e_descriptor), (&__go_type_hash_AIe2e_descriptor_OC_4), ((uint8_t*)(&__go_td_AIe2e_EC_gc)), (&tmp__130), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)), ((&__go_td_AIee.field0)), UINT64_C(2) };
static struct l_array_29_uint8_t tmp__52 = { { 77u, 97u, 105u, 110u, 32, 103u, 111u, 114u, 111u, 117u, 116u, 105u, 110u, 101u, 32, 114u, 101u, 99u, 101u, 105u, 118u, 101u, 100u, 32, 100u, 97u, 116u, 97u, 58 } };
struct l_struct_commonType __go_tdn_int __attribute__((common)) = { 130u, 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__131), (&tmp__132), ((struct l_struct_commonType*)/*NULL*/0) };
static struct l_array_34_uint8_t tmp__82 = { { 70u, 117u, 110u, 99u, 32, 103u, 111u, 114u, 111u, 117u, 116u, 105u, 110u, 101u, 32, 98u, 101u, 103u, 105u, 110u, 115u, 32, 115u, 101u, 110u, 100u, 105u, 110u, 103u, 32, 100u, 97u, 116u, 97u } };
static struct l_array_32_uint8_t tmp__83 = { { 70u, 117u, 110u, 99u, 32, 103u, 111u, 114u, 111u, 117u, 116u, 105u, 110u, 101u, 32, 101u, 110u, 100u, 115u, 32, 115u, 101u, 110u, 100u, 105u, 110u, 103u, 32, 100u, 97u, 116u, 97u } };
struct l_struct_funcVal __go_type_hash_AIe1e_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_AIe1e) };
struct l_struct_funcVal __go_type_hash_AIe1e_descriptor_OC_2 __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_AIe1e_OC_1) };
static struct l_array_15_uint8_t tmp__133 = { { 91u, 49, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_4 tmp__127 = { ((&tmp__133.array[((int32_t)0)])), UINT64_C(15) };
struct l_struct_interfaceType __go_td_Ie __attribute__((common)) = { { 20, 8, 8, UINT64_C(16), 16, (&__go_type_hash_empty_interface_descriptor), (&__go_type_equal_empty_interface_descriptor), ((uint8_t*)(&__go_td_Ie_EC_gc)), (&tmp__134), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, { ((struct l_struct_imethod*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_struct_sliceType __go_td_AIee __attribute__((common)) = { { 23, 8, 8, UINT64_C(24), 30, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_AIee_EC_gc)), (&tmp__135), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)) };
struct l_array_9_uint8_t_KC_ __go_td_AIe1e_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(3)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(4)), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_AIe2e_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_AIe2e) };
struct l_struct_funcVal __go_type_hash_AIe2e_descriptor_OC_4 __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_AIe2e_OC_3) };
static struct l_array_15_uint8_t tmp__136 = { { 91u, 50, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_4 tmp__130 = { ((&tmp__136.array[((int32_t)0)])), UINT64_C(15) };
struct l_array_9_uint8_t_KC_ __go_td_AIe2e_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(32)), ((uint8_t*)(uintptr_t)UINT64_C(3)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(2)), ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(4)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_8_uint8_t tmp__137 = { { 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u } };
static struct l_unnamed_4 tmp__124 = { ((&tmp__137.array[((int32_t)0)])), UINT64_C(8) };
struct l_array_5_uint8_t_KC_ __go_td_CN3_intsre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_3_uint8_t tmp__138 = { { 105u, 110u, 116u } };
static struct l_unnamed_4 tmp__131 = { ((&tmp__138.array[((int32_t)0)])), UINT64_C(3) };
static struct l_array_3_uint8_t tmp__139 = { { 105u, 110u, 116u } };
static struct l_unnamed_4 tmp__140 = { ((&tmp__139.array[((int32_t)0)])), UINT64_C(3) };
static struct l_struct_uncommonType tmp__132 = { (&tmp__140), ((struct l_unnamed_4*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_int_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_6_uint8_t tmp__141 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_4 tmp__128 = { ((&tmp__141.array[((int32_t)0)])), UINT64_C(6) };
static struct l_array_6_uint8_t tmp__142 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_4 tmp__143 = { ((&tmp__142.array[((int32_t)0)])), UINT64_C(6) };
static struct l_struct_uncommonType tmp__129 = { (&tmp__143), ((struct l_unnamed_4*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_4_uint8_t_KC_ __go_tdn_string_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(7)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_S0_CN3_intsree_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_S0_CN3_intsree) };
struct l_struct_funcVal __go_type_equal_S0_CN3_intsree_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_equal_S0_CN3_intsree) };
static struct l_array_19_uint8_t tmp__144 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 32, 125u } };
static struct l_unnamed_4 tmp__125 = { ((&tmp__144.array[((int32_t)0)])), UINT64_C(19) };
struct l_struct_ptrType __go_td_pS0_CN3_intsree __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 2601609, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS0_CN3_intsree_EC_gc)), (&tmp__145), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S0_CN3_intsree.field0)) };
static struct l_array_1_struct_AC_l_struct_structField tmp__126 = { { { ((struct l_unnamed_4*)/*NULL*/0), ((struct l_unnamed_4*)/*NULL*/0), ((&__go_td_CN3_intsre.field0)), ((struct l_unnamed_4*)/*NULL*/0), UINT64_C(0) } } };
struct l_array_5_uint8_t_KC_ __go_td_S0_CN3_intsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_20_uint8_t tmp__146 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 32, 125u } };
static struct l_unnamed_4 tmp__145 = { ((&tmp__146.array[((int32_t)0)])), UINT64_C(20) };
struct l_array_5_uint8_t_KC_ __go_td_pS0_CN3_intsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S0_CN3_intsree_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_14_uint8_t tmp__147 = { { 91u, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_4 tmp__135 = { ((&tmp__147.array[((int32_t)0)])), UINT64_C(14) };
struct l_array_5_uint8_t_KC_ __go_td_AIee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(24)), ((uint8_t*)(uintptr_t)UINT64_C(10)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_Ie_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_12_uint8_t tmp__148 = { { 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_4 tmp__134 = { ((&tmp__148.array[((int32_t)0)])), UINT64_C(12) };
struct l_array_4_uint8_t_KC_ __go_td_Ie_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static __forceinline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static __forceinline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static __forceinline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static __forceinline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static __forceinline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static __forceinline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static __forceinline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static __forceinline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static __forceinline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static __forceinline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static __forceinline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static __forceinline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static __forceinline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }
static __forceinline int llvm_fcmp_0(double X, double Y) { return 0; }
static __forceinline int llvm_fcmp_1(double X, double Y) { return 1; }
static __forceinline uint8_t llvm_select_u8(bool condition, uint8_t iftrue, uint8_t ifnot) {
  uint8_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline struct l_unnamed_4 llvm_ctor_unnamed_4(uint8_t* x0, uint64_t x1) {
  struct l_unnamed_4 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_1 llvm_ctor_unnamed_1(uint8_t* x0, uint64_t x1, uint64_t x2) {
  struct l_unnamed_1 r;
  r.field0 = x0;
  r.field1 = x1;
  r.field2 = x2;
  return r;
}
static __forceinline struct l_unnamed_5 llvm_ctor_unnamed_5(uint8_t* x0, uint8_t* x1) {
  struct l_unnamed_5 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}


/* Function Bodies */

void main_OC__OC_import(uint8_t* llvm_cbe_tmp__1) {
  bool llvm_cbe_tmp__2;

  llvm_cbe_tmp__2 = ((init_EC_guard)&1);
  if (llvm_cbe_tmp__2) {
    goto llvm_cbe__2e_0_2e_entry;
  } else {
    goto llvm_cbe_tmp__3;
  }

llvm_cbe__2e_0_2e_entry:
  return;
llvm_cbe_tmp__3:
  init_EC_guard = ((1) & 1);
  fmt_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  time_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  goto llvm_cbe__2e_0_2e_entry;

}


void main_OC_main(uint8_t* llvm_cbe_tmp__4) {
  struct l_unnamed_1 llvm_cbe_tmp__5;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__6;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__7;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__8;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__9;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__10;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__11;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__12;
  uint8_t* llvm_cbe_tmp__13;
  struct l_unnamed_3* llvm_cbe_tmp__14;
  uint8_t* llvm_cbe_tmp__15;
  uint8_t* llvm_cbe_tmp__16;
  uint8_t* llvm_cbe_tmp__17;
  struct l_unnamed_4* llvm_cbe_tmp__18;
  struct l_unnamed_5 llvm_cbe_tmp__19;
  struct l_unnamed_1 llvm_cbe_tmp__20;
  struct l_unnamed_1 llvm_cbe_tmp__21;
  struct l_unnamed_1 llvm_cbe_tmp__22;
  uint64_t llvm_cbe_tmp__23;
  struct l_unnamed_5 llvm_cbe_tmp__24;
  uint8_t* llvm_cbe_tmp__25;
  uint8_t* llvm_cbe_tmp__26;
  uint8_t* llvm_cbe_tmp__27;
  struct l_unnamed_4* llvm_cbe_tmp__28;
  struct l_unnamed_5 llvm_cbe_tmp__29;
  struct l_unnamed_1 llvm_cbe_tmp__30;
  struct l_unnamed_1 llvm_cbe_tmp__31;
  struct l_unnamed_1 llvm_cbe_tmp__32;
  uint64_t llvm_cbe_tmp__33;
  struct l_unnamed_5 llvm_cbe_tmp__34;
  uint64_t llvm_cbe_tmp__35;
  uint8_t* llvm_cbe_tmp__36;
  uint8_t* llvm_cbe_tmp__37;
  uint8_t* llvm_cbe_tmp__38;
  struct l_unnamed_4* llvm_cbe_tmp__39;
  struct l_unnamed_5 llvm_cbe_tmp__40;
  uint8_t* llvm_cbe_tmp__41;
  uint64_t* llvm_cbe_tmp__42;
  struct l_unnamed_5 llvm_cbe_tmp__43;
  struct l_unnamed_1 llvm_cbe_tmp__44;
  struct l_unnamed_1 llvm_cbe_tmp__45;
  struct l_unnamed_1 llvm_cbe_tmp__46;
  uint64_t llvm_cbe_tmp__47;
  struct l_unnamed_5 llvm_cbe_tmp__48;

  llvm_cbe_tmp__12 = __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), UINT64_C(0));
  llvm_cbe_tmp__13 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsree.field0.field0)), UINT64_C(8));
  llvm_cbe_tmp__14 = ((struct l_unnamed_3*)llvm_cbe_tmp__13);
  *((&llvm_cbe_tmp__14->field0)) = llvm_cbe_tmp__12;
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__49), (((uint8_t*)llvm_cbe_tmp__14)));
  llvm_cbe_tmp__15 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__16 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_5*)llvm_cbe_tmp__15)));
  llvm_cbe_tmp__17 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__18 = ((struct l_unnamed_4*)llvm_cbe_tmp__17);
  *llvm_cbe_tmp__18 = llvm_ctor_unnamed_4(((&tmp__50.array[((int32_t)0)])), UINT64_C(31));
  llvm_cbe_tmp__19 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__19.field1 = (((uint8_t*)llvm_cbe_tmp__18));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__16))))))))) = llvm_cbe_tmp__19;
  llvm_cbe_tmp__20 = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__20.field0 = ((&(*llvm_cbe_tmp__16)));
  llvm_cbe_tmp__21 = llvm_cbe_tmp__20;
  llvm_cbe_tmp__21.field1 = UINT64_C(1);
  llvm_cbe_tmp__22 = llvm_cbe_tmp__21;
  llvm_cbe_tmp__22.field2 = UINT64_C(1);
  llvm_cbe_tmp__5 = llvm_cbe_tmp__22;
  llvm_cbe_tmp__6 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__5);
  llvm_cbe_tmp__23 = *((&llvm_cbe_tmp__6.field0));
  llvm_cbe_tmp__24 = *((&llvm_cbe_tmp__6.field1));
  time_OC_Sleep(/*UNDEF*/((uint8_t*)/*NULL*/0), UINT64_C(2000000000));
  llvm_cbe_tmp__25 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__26 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_5*)llvm_cbe_tmp__25)));
  llvm_cbe_tmp__27 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__28 = ((struct l_unnamed_4*)llvm_cbe_tmp__27);
  *llvm_cbe_tmp__28 = llvm_ctor_unnamed_4(((&tmp__51.array[((int32_t)0)])), UINT64_C(36));
  llvm_cbe_tmp__29 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__29.field1 = (((uint8_t*)llvm_cbe_tmp__28));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__26))))))))) = llvm_cbe_tmp__29;
  llvm_cbe_tmp__30 = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__30.field0 = ((&(*llvm_cbe_tmp__26)));
  llvm_cbe_tmp__31 = llvm_cbe_tmp__30;
  llvm_cbe_tmp__31.field1 = UINT64_C(1);
  llvm_cbe_tmp__32 = llvm_cbe_tmp__31;
  llvm_cbe_tmp__32.field2 = UINT64_C(1);
  llvm_cbe_tmp__7 = llvm_cbe_tmp__32;
  llvm_cbe_tmp__8 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__7);
  llvm_cbe_tmp__33 = *((&llvm_cbe_tmp__8.field0));
  llvm_cbe_tmp__34 = *((&llvm_cbe_tmp__8.field1));
  __go_receive(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__12, (((uint8_t*)(&llvm_cbe_tmp__9))));
  llvm_cbe_tmp__35 = llvm_cbe_tmp__9;
  llvm_cbe_tmp__36 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe2e.field0.field0)), UINT64_C(32));
  llvm_cbe_tmp__37 = ((uint8_t*)(((struct l_array_2_struct_AC_l_unnamed_5*)llvm_cbe_tmp__36)));
  llvm_cbe_tmp__38 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__39 = ((struct l_unnamed_4*)llvm_cbe_tmp__38);
  *llvm_cbe_tmp__39 = llvm_ctor_unnamed_4(((&tmp__52.array[((int32_t)0)])), UINT64_C(29));
  llvm_cbe_tmp__40 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__40.field1 = (((uint8_t*)llvm_cbe_tmp__39));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__37))))))))) = llvm_cbe_tmp__40;
  llvm_cbe_tmp__41 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_int.field0)), UINT64_C(8));
  llvm_cbe_tmp__42 = ((uint64_t*)llvm_cbe_tmp__41);
  *llvm_cbe_tmp__42 = llvm_cbe_tmp__35;
  llvm_cbe_tmp__43 = llvm_ctor_unnamed_5(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__43.field1 = (((uint8_t*)llvm_cbe_tmp__42));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(((struct l_unnamed_5*)llvm_cbe_tmp__37))[((int64_t)UINT64_C(1))])))))) = llvm_cbe_tmp__43;
  llvm_cbe_tmp__44 = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__44.field0 = ((&(*llvm_cbe_tmp__37)));
  llvm_cbe_tmp__45 = llvm_cbe_tmp__44;
  llvm_cbe_tmp__45.field1 = UINT64_C(2);
  llvm_cbe_tmp__46 = llvm_cbe_tmp__45;
  llvm_cbe_tmp__46.field2 = UINT64_C(2);
  llvm_cbe_tmp__10 = llvm_cbe_tmp__46;
  llvm_cbe_tmp__11 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__10);
  llvm_cbe_tmp__47 = *((&llvm_cbe_tmp__11.field0));
  llvm_cbe_tmp__48 = *((&llvm_cbe_tmp__11.field1));
  time_OC_Sleep(/*UNDEF*/((uint8_t*)/*NULL*/0), UINT64_C(1000000000));
}


static void tmp__49(uint8_t* llvm_cbe_tmp__53) {
  uint8_t* llvm_cbe_tmp__54;

  llvm_cbe_tmp__54 = *((&(((struct l_unnamed_3*)llvm_cbe_tmp__53))->field0));
  main_OC_main_KD_main_OC_main_EC_1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__54);
}


static void main_OC_main_KD_main_OC_main_EC_1(uint8_t* llvm_cbe_tmp__55, uint8_t* llvm_cbe_tmp__56) {
  struct l_unnamed_1 llvm_cbe_tmp__57;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__58;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__59;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__60;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__61;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__62;
  uint8_t* llvm_cbe_tmp__63;
  uint8_t* llvm_cbe_tmp__64;
  struct l_unnamed_4* llvm_cbe_tmp__65;
  struct l_unnamed_5 llvm_cbe_tmp__66;
  struct l_unnamed_1 llvm_cbe_tmp__67;
  struct l_unnamed_1 llvm_cbe_tmp__68;
  struct l_unnamed_1 llvm_cbe_tmp__69;
  uint64_t llvm_cbe_tmp__70;
  struct l_unnamed_5 llvm_cbe_tmp__71;
  uint8_t* llvm_cbe_tmp__72;
  uint8_t* llvm_cbe_tmp__73;
  uint8_t* llvm_cbe_tmp__74;
  struct l_unnamed_4* llvm_cbe_tmp__75;
  struct l_unnamed_5 llvm_cbe_tmp__76;
  struct l_unnamed_1 llvm_cbe_tmp__77;
  struct l_unnamed_1 llvm_cbe_tmp__78;
  struct l_unnamed_1 llvm_cbe_tmp__79;
  uint64_t llvm_cbe_tmp__80;
  struct l_unnamed_5 llvm_cbe_tmp__81;

  llvm_cbe_tmp__62 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__63 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_5*)llvm_cbe_tmp__62)));
  llvm_cbe_tmp__64 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__65 = ((struct l_unnamed_4*)llvm_cbe_tmp__64);
  *llvm_cbe_tmp__65 = llvm_ctor_unnamed_4(((&tmp__82.array[((int32_t)0)])), UINT64_C(34));
  llvm_cbe_tmp__66 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__66.field1 = (((uint8_t*)llvm_cbe_tmp__65));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__63))))))))) = llvm_cbe_tmp__66;
  llvm_cbe_tmp__67 = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__67.field0 = ((&(*llvm_cbe_tmp__63)));
  llvm_cbe_tmp__68 = llvm_cbe_tmp__67;
  llvm_cbe_tmp__68.field1 = UINT64_C(1);
  llvm_cbe_tmp__69 = llvm_cbe_tmp__68;
  llvm_cbe_tmp__69.field2 = UINT64_C(1);
  llvm_cbe_tmp__57 = llvm_cbe_tmp__69;
  llvm_cbe_tmp__58 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__57);
  llvm_cbe_tmp__70 = *((&llvm_cbe_tmp__58.field0));
  llvm_cbe_tmp__71 = *((&llvm_cbe_tmp__58.field1));
  llvm_cbe_tmp__59 = UINT64_C(1);
  __go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__56, (((uint8_t*)(&llvm_cbe_tmp__59))));
  llvm_cbe_tmp__72 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__73 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_5*)llvm_cbe_tmp__72)));
  llvm_cbe_tmp__74 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__75 = ((struct l_unnamed_4*)llvm_cbe_tmp__74);
  *llvm_cbe_tmp__75 = llvm_ctor_unnamed_4(((&tmp__83.array[((int32_t)0)])), UINT64_C(32));
  llvm_cbe_tmp__76 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__76.field1 = (((uint8_t*)llvm_cbe_tmp__75));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__73))))))))) = llvm_cbe_tmp__76;
  llvm_cbe_tmp__77 = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__77.field0 = ((&(*llvm_cbe_tmp__73)));
  llvm_cbe_tmp__78 = llvm_cbe_tmp__77;
  llvm_cbe_tmp__78.field1 = UINT64_C(1);
  llvm_cbe_tmp__79 = llvm_cbe_tmp__78;
  llvm_cbe_tmp__79.field2 = UINT64_C(1);
  llvm_cbe_tmp__60 = llvm_cbe_tmp__79;
  llvm_cbe_tmp__61 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__60);
  llvm_cbe_tmp__80 = *((&llvm_cbe_tmp__61.field0));
  llvm_cbe_tmp__81 = *((&llvm_cbe_tmp__61.field1));
}


uint64_t __go_type_hash_AIe1e(uint8_t* llvm_cbe_tmp__84, uint64_t llvm_cbe_tmp__85) {
  struct l_unnamed_5* llvm_cbe_tmp__86;
  uint64_t llvm_cbe_tmp__87;
  uint64_t llvm_cbe_tmp__87__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__88;
  uint64_t llvm_cbe_tmp__88__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__89;
  uint64_t llvm_cbe_tmp__90;
  uint64_t llvm_cbe_tmp__91;

  llvm_cbe_tmp__86 = ((struct l_unnamed_5*)llvm_cbe_tmp__84);
  llvm_cbe_tmp__87__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_tmp__88__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__87 = llvm_cbe_tmp__87__PHI_TEMPORARY;
  llvm_cbe_tmp__88 = llvm_cbe_tmp__88__PHI_TEMPORARY;
  llvm_cbe_tmp__89 = __go_type_hash_empty_interface((((uint8_t*)((&llvm_cbe_tmp__86[((int64_t)llvm_cbe_tmp__87)])))), UINT64_C(16));
  llvm_cbe_tmp__90 = llvm_add_u64((llvm_mul_u64(llvm_cbe_tmp__88, UINT64_C(33))), llvm_cbe_tmp__89);
  llvm_cbe_tmp__91 = llvm_add_u64(llvm_cbe_tmp__87, UINT64_C(1));
  if ((((llvm_cbe_tmp__91 == UINT64_C(1))&1))) {
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__87__PHI_TEMPORARY = llvm_cbe_tmp__91;   /* for PHI node */
    llvm_cbe_tmp__88__PHI_TEMPORARY = llvm_cbe_tmp__90;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  return llvm_cbe_tmp__90;
}


uint8_t __go_type_hash_AIe1e_OC_1(uint8_t* llvm_cbe_tmp__92, uint8_t* llvm_cbe_tmp__93, uint64_t llvm_cbe_tmp__94) {
  struct l_unnamed_5* llvm_cbe_tmp__95;
  struct l_unnamed_5* llvm_cbe_tmp__96;
  uint64_t llvm_cbe_tmp__97;
  uint64_t llvm_cbe_tmp__97__PHI_TEMPORARY;
  uint8_t llvm_cbe_tmp__98;
  uint8_t llvm_cbe_merge;
  uint8_t llvm_cbe_merge__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__99;

  llvm_cbe_tmp__95 = ((struct l_unnamed_5*)llvm_cbe_tmp__92);
  llvm_cbe_tmp__96 = ((struct l_unnamed_5*)llvm_cbe_tmp__93);
  llvm_cbe_tmp__97__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__97 = llvm_cbe_tmp__97__PHI_TEMPORARY;
  llvm_cbe_tmp__98 = __go_type_equal_empty_interface((((uint8_t*)((&llvm_cbe_tmp__95[((int64_t)llvm_cbe_tmp__97)])))), (((uint8_t*)((&llvm_cbe_tmp__96[((int64_t)llvm_cbe_tmp__97)])))), UINT64_C(16));
  if ((((llvm_cbe_tmp__98 == ((uint8_t)0))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 0;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_cont:
  llvm_cbe_tmp__99 = llvm_add_u64(llvm_cbe_tmp__97, UINT64_C(1));
  if ((((llvm_cbe_tmp__99 == UINT64_C(1))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 1;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__97__PHI_TEMPORARY = llvm_cbe_tmp__99;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  llvm_cbe_merge = llvm_cbe_merge__PHI_TEMPORARY;
  return llvm_cbe_merge;
}


uint64_t __go_type_hash_AIe2e(uint8_t* llvm_cbe_tmp__100, uint64_t llvm_cbe_tmp__101) {
  struct l_unnamed_5* llvm_cbe_tmp__102;
  uint64_t llvm_cbe_tmp__103;
  uint64_t llvm_cbe_tmp__103__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__104;
  uint64_t llvm_cbe_tmp__104__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__105;
  uint64_t llvm_cbe_tmp__106;
  uint64_t llvm_cbe_tmp__107;

  llvm_cbe_tmp__102 = ((struct l_unnamed_5*)llvm_cbe_tmp__100);
  llvm_cbe_tmp__103__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_tmp__104__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__103 = llvm_cbe_tmp__103__PHI_TEMPORARY;
  llvm_cbe_tmp__104 = llvm_cbe_tmp__104__PHI_TEMPORARY;
  llvm_cbe_tmp__105 = __go_type_hash_empty_interface((((uint8_t*)((&llvm_cbe_tmp__102[((int64_t)llvm_cbe_tmp__103)])))), UINT64_C(16));
  llvm_cbe_tmp__106 = llvm_add_u64((llvm_mul_u64(llvm_cbe_tmp__104, UINT64_C(33))), llvm_cbe_tmp__105);
  llvm_cbe_tmp__107 = llvm_add_u64(llvm_cbe_tmp__103, UINT64_C(1));
  if ((((llvm_cbe_tmp__107 == UINT64_C(2))&1))) {
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__103__PHI_TEMPORARY = llvm_cbe_tmp__107;   /* for PHI node */
    llvm_cbe_tmp__104__PHI_TEMPORARY = llvm_cbe_tmp__106;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  return llvm_cbe_tmp__106;
}


uint8_t __go_type_hash_AIe2e_OC_3(uint8_t* llvm_cbe_tmp__108, uint8_t* llvm_cbe_tmp__109, uint64_t llvm_cbe_tmp__110) {
  struct l_unnamed_5* llvm_cbe_tmp__111;
  struct l_unnamed_5* llvm_cbe_tmp__112;
  uint64_t llvm_cbe_tmp__113;
  uint64_t llvm_cbe_tmp__113__PHI_TEMPORARY;
  uint8_t llvm_cbe_tmp__114;
  uint8_t llvm_cbe_merge;
  uint8_t llvm_cbe_merge__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__115;

  llvm_cbe_tmp__111 = ((struct l_unnamed_5*)llvm_cbe_tmp__108);
  llvm_cbe_tmp__112 = ((struct l_unnamed_5*)llvm_cbe_tmp__109);
  llvm_cbe_tmp__113__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__113 = llvm_cbe_tmp__113__PHI_TEMPORARY;
  llvm_cbe_tmp__114 = __go_type_equal_empty_interface((((uint8_t*)((&llvm_cbe_tmp__111[((int64_t)llvm_cbe_tmp__113)])))), (((uint8_t*)((&llvm_cbe_tmp__112[((int64_t)llvm_cbe_tmp__113)])))), UINT64_C(16));
  if ((((llvm_cbe_tmp__114 == ((uint8_t)0))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 0;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_cont:
  llvm_cbe_tmp__115 = llvm_add_u64(llvm_cbe_tmp__113, UINT64_C(1));
  if ((((llvm_cbe_tmp__115 == UINT64_C(2))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 1;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__113__PHI_TEMPORARY = llvm_cbe_tmp__115;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  llvm_cbe_merge = llvm_cbe_merge__PHI_TEMPORARY;
  return llvm_cbe_merge;
}


uint64_t __go_type_hash_S0_CN3_intsree(uint8_t* llvm_cbe_tmp__116, uint64_t llvm_cbe_tmp__117) {
  uint64_t llvm_cbe_tmp__118;

  llvm_cbe_tmp__118 = __go_type_hash_identity((((uint8_t*)((&(((struct l_unnamed_3*)llvm_cbe_tmp__116))->field0)))), UINT64_C(8));
  return (llvm_add_u64(UINT64_C(0), llvm_cbe_tmp__118));
}


uint8_t __go_type_equal_S0_CN3_intsree(uint8_t* llvm_cbe_tmp__119, uint8_t* llvm_cbe_tmp__120, uint64_t llvm_cbe_tmp__121) {
  uint8_t llvm_cbe_tmp__122;

  llvm_cbe_tmp__122 = __go_type_equal_identity((((uint8_t*)((&(((struct l_unnamed_3*)llvm_cbe_tmp__119))->field0)))), (((uint8_t*)((&(((struct l_unnamed_3*)llvm_cbe_tmp__120))->field0)))), UINT64_C(8));
  return (llvm_select_u8((((llvm_cbe_tmp__122 == ((uint8_t)0))&1)), 0, 1));
}


void __go_init_main(uint8_t* llvm_cbe_tmp__123) {
  main_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
}

