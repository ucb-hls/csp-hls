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
struct l_unnamed_2;
struct l_struct_method;
struct l_struct_methodSlice;
struct l_struct_uncommonType;
struct l_struct_commonType;
struct l_struct_arrayType;
struct l_struct_structField;
struct l_struct_structFieldSlice;
struct l_struct_structType;
struct l_struct_imethod;
struct l_struct_imethodSlice;
struct l_struct_interfaceType;
struct l_struct_sliceType;
struct l_struct_ptrType;
struct l_struct_chanType;
struct l_unnamed_1;
struct l_unnamed_3;
struct l_unnamed_4;
struct l_unnamed_5;
typedef void l_fptr_1(void);

/* Types Definitions */
struct l_struct_funcVal {
  l_fptr_1* field0;
};
struct l_unnamed_2 {
  uint8_t* field0;
  uint64_t field1;
};
struct l_struct_method {
  struct l_unnamed_2* field0;
  struct l_unnamed_2* field1;
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
  struct l_unnamed_2* field0;
  struct l_unnamed_2* field1;
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
  struct l_unnamed_2* field8;
  struct l_struct_uncommonType* field9;
  struct l_struct_commonType* field10;
};
struct l_struct_arrayType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
  struct l_struct_commonType* field2;
  uint64_t field3;
};
struct l_struct_structField {
  struct l_unnamed_2* field0;
  struct l_unnamed_2* field1;
  struct l_struct_commonType* field2;
  struct l_unnamed_2* field3;
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
struct l_struct_imethod {
  struct l_unnamed_2* field0;
  struct l_unnamed_2* field1;
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
struct l_struct_chanType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
  uint64_t field2;
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_4_uint8_t_KC_ {
  uint8_t* array[4];
};
struct l_array_9_uint8_t_KC_ {
  uint8_t* array[9];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_8_uint8_t_KC_ {
  uint8_t* array[8];
};
struct l_array_2_struct_AC_l_struct_structField {
  struct l_struct_structField array[2];
};
struct l_array_11_uint8_t_KC_ {
  uint8_t* array[11];
};
struct l_array_3_struct_AC_l_struct_structField {
  struct l_struct_structField array[3];
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_5_uint8_t_KC_ {
  uint8_t* array[5];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_30_uint8_t {
  uint8_t array[30];
};
struct l_array_40_uint8_t {
  uint8_t array[40];
};
struct l_array_41_uint8_t {
  uint8_t array[41];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_unnamed_1 {
  uint8_t* field0;
  uint8_t* field1;
};
struct l_unnamed_3 {
  uint8_t* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_unnamed_4 {
  uint64_t field0;
  struct l_unnamed_1 field1;
};
struct l_array_1_struct_AC_l_unnamed_1 {
  struct l_unnamed_1 array[1];
};
struct l_unnamed_5 {
  uint8_t* field0;
  uint8_t* field1;
  uint8_t* field2;
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
uint8_t* fifo_malloc(uint8_t, uint64_t);
uint8_t* runtime_OC_newselect(uint8_t*, uint32_t);
__noreturn void __go_panic(uint8_t*, uint8_t*, uint8_t*);
uint64_t fifo_read(uint8_t*);
void runtime_OC_selectdefault(uint8_t*, uint8_t*, uint32_t);
uint64_t runtime_OC_selectgo(uint8_t*, uint8_t*);
void runtime_OC_selectrecv2(uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t);
void runtime_OC_selectsend(uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t);
void fifo_write(uint8_t*, uint64_t);
uint64_t __go_type_hash_empty_interface(uint8_t*, uint64_t);
uint8_t __go_type_equal_empty_interface(uint8_t*, uint8_t*, uint64_t);
uint64_t __go_type_hash_identity(uint8_t*, uint64_t);
uint8_t __go_type_equal_identity(uint8_t*, uint8_t*, uint64_t);
static void main_OC_consumer_1(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
static void main_OC_consumer_2(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
struct l_unnamed_4 fmt_OC_Println(uint8_t*, struct l_unnamed_3);
void main_OC__OC_import(uint8_t*);
void fmt_OC__OC_import(uint8_t*);
void time_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void tmp__116(uint8_t*);
static void main_OC_producer(uint8_t*, uint8_t*, uint8_t*);
static void tmp__117(uint8_t*);
static void tmp__118(uint8_t*);
void time_OC_Sleep(uint8_t*, uint64_t);
uint64_t __go_type_hash_AIe1e(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_hash_AIe1e_OC_1(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint64_t __go_type_hash_S0_CN3_intsre0_CN4_boolsree(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_equal_S0_CN3_intsre0_CN4_boolsree(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint64_t __go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
void __go_init_main(uint8_t*);


/* Global Variable Definitions and Initialization */
static struct l_array_31_uint8_t tmp__27 = { { 98u, 108u, 111u, 99u, 107u, 105u, 110u, 103u, 32, 115u, 101u, 108u, 101u, 99u, 116u, 32, 109u, 97u, 116u, 99u, 104u, 101u, 100u, 32, 110u, 111u, 32, 99u, 97u, 115u, 101u } };
struct l_struct_commonType __go_tdn_string __attribute__((common)) = { 24, 8, 8, UINT64_C(16), 100666096, (&__go_type_hash_string_descriptor), (&__go_type_equal_string_descriptor), ((uint8_t*)(&__go_tdn_string_EC_gc)), (&tmp__222), (&tmp__223), ((struct l_struct_commonType*)/*NULL*/0) };
struct l_struct_arrayType __go_td_AIe1e __attribute__((common)) = { { 17, 8, 8, UINT64_C(16), 30, (&__go_type_hash_AIe1e_descriptor), (&__go_type_hash_AIe1e_descriptor_OC_2), ((uint8_t*)(&__go_td_AIe1e_EC_gc)), (&tmp__224), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)), ((&__go_td_AIee.field0)), UINT64_C(1) };
static struct l_array_4_uint8_t tmp__66 = { { 113u, 117u, 105u, 116u } };
static struct l_array_31_uint8_t tmp__67 = { { 98u, 108u, 111u, 99u, 107u, 105u, 110u, 103u, 32, 115u, 101u, 108u, 101u, 99u, 116u, 32, 109u, 97u, 116u, 99u, 104u, 101u, 100u, 32, 110u, 111u, 32, 99u, 97u, 115u, 101u } };
uint8_t* main_OC__OC_import_EC_descriptor = ((uint8_t*)main_OC__OC_import);
static bool init_EC_guard;
uint8_t* main_OC_main_EC_descriptor = ((uint8_t*)main_OC_main);
struct l_struct_structType __go_td_S0_CN3_intsre0_CN4_boolsree __attribute__((common)) = { { 25, 8, 8, UINT64_C(16), 533856, (&__go_type_hash_S0_CN3_intsre0_CN4_boolsree_descriptor), (&__go_type_equal_S0_CN3_intsre0_CN4_boolsree_descriptor), ((uint8_t*)(&__go_td_S0_CN3_intsre0_CN4_boolsree_EC_gc)), (&tmp__225), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS0_CN3_intsre0_CN4_boolsree.field0)) }, { ((&tmp__226.array[((int32_t)0)])), UINT64_C(2), UINT64_C(2) } };
struct l_struct_structType __go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree __attribute__((common)) = { { 25, 8, 8, UINT64_C(24), 1184208, (&__go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor), (&__go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor), ((uint8_t*)(&__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_EC_gc)), (&tmp__227), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree.field0)) }, { ((&tmp__228.array[((int32_t)0)])), UINT64_C(3), UINT64_C(3) } };
struct l_struct_commonType __go_tdn_int __attribute__((common)) = { 130u, 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__229), (&tmp__230), ((struct l_struct_commonType*)/*NULL*/0) };
static struct l_array_13_uint8_t tmp__167 = { { 112u, 114u, 111u, 100u, 117u, 99u, 101u, 114u, 32, 113u, 117u, 105u, 116u } };
static struct l_array_17_uint8_t tmp__166 = { { 112u, 114u, 111u, 100u, 117u, 99u, 101u, 114u, 32, 112u, 114u, 111u, 100u, 117u, 99u, 101u, 100u } };
static struct l_array_31_uint8_t tmp__168 = { { 98u, 108u, 111u, 99u, 107u, 105u, 110u, 103u, 32, 115u, 101u, 108u, 101u, 99u, 116u, 32, 109u, 97u, 116u, 99u, 104u, 101u, 100u, 32, 110u, 111u, 32, 99u, 97u, 115u, 101u } };
struct l_struct_funcVal __go_type_hash_AIe1e_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_AIe1e) };
struct l_struct_funcVal __go_type_hash_AIe1e_descriptor_OC_2 __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_AIe1e_OC_1) };
static struct l_array_15_uint8_t tmp__231 = { { 91u, 49, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_2 tmp__224 = { ((&tmp__231.array[((int32_t)0)])), UINT64_C(15) };
struct l_struct_interfaceType __go_td_Ie __attribute__((common)) = { { 20, 8, 8, UINT64_C(16), 16, (&__go_type_hash_empty_interface_descriptor), (&__go_type_equal_empty_interface_descriptor), ((uint8_t*)(&__go_td_Ie_EC_gc)), (&tmp__232), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, { ((struct l_struct_imethod*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_struct_sliceType __go_td_AIee __attribute__((common)) = { { 23, 8, 8, UINT64_C(24), 30, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_AIee_EC_gc)), (&tmp__233), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)) };
struct l_array_9_uint8_t_KC_ __go_td_AIe1e_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(3)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(4)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_3_uint8_t tmp__234 = { { 105u, 110u, 116u } };
static struct l_unnamed_2 tmp__229 = { ((&tmp__234.array[((int32_t)0)])), UINT64_C(3) };
static struct l_array_3_uint8_t tmp__235 = { { 105u, 110u, 116u } };
static struct l_unnamed_2 tmp__236 = { ((&tmp__235.array[((int32_t)0)])), UINT64_C(3) };
static struct l_struct_uncommonType tmp__230 = { (&tmp__236), ((struct l_unnamed_2*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_int_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_6_uint8_t tmp__237 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_2 tmp__222 = { ((&tmp__237.array[((int32_t)0)])), UINT64_C(6) };
static struct l_array_6_uint8_t tmp__238 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_2 tmp__239 = { ((&tmp__238.array[((int32_t)0)])), UINT64_C(6) };
static struct l_struct_uncommonType tmp__223 = { (&tmp__239), ((struct l_unnamed_2*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_4_uint8_t_KC_ __go_tdn_string_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(7)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_S0_CN3_intsre0_CN4_boolsree_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_S0_CN3_intsre0_CN4_boolsree) };
struct l_struct_funcVal __go_type_equal_S0_CN3_intsre0_CN4_boolsree_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_equal_S0_CN3_intsre0_CN4_boolsree) };
static struct l_array_30_uint8_t tmp__240 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 32, 98u, 111u, 111u, 108u, 32, 125u } };
static struct l_unnamed_2 tmp__225 = { ((&tmp__240.array[((int32_t)0)])), UINT64_C(30) };
struct l_struct_ptrType __go_td_pS0_CN3_intsre0_CN4_boolsree __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 8541705, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS0_CN3_intsre0_CN4_boolsree_EC_gc)), (&tmp__241), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S0_CN3_intsre0_CN4_boolsree.field0)) };
struct l_struct_chanType __go_td_CN3_intsre __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), 1610653383u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN3_intsre_EC_gc)), (&tmp__242), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_int), UINT64_C(3) };
struct l_struct_chanType __go_td_CN4_boolsre __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), 2147535815u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN4_boolsre_EC_gc)), (&tmp__243), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_bool), UINT64_C(3) };
static struct l_array_2_struct_AC_l_struct_structField tmp__226 = { { { ((struct l_unnamed_2*)/*NULL*/0), ((struct l_unnamed_2*)/*NULL*/0), ((&__go_td_CN3_intsre.field0)), ((struct l_unnamed_2*)/*NULL*/0), UINT64_C(0) }, { ((struct l_unnamed_2*)/*NULL*/0), ((struct l_unnamed_2*)/*NULL*/0), ((&__go_td_CN4_boolsre.field0)), ((struct l_unnamed_2*)/*NULL*/0), UINT64_C(8) } } };
struct l_array_8_uint8_t_KC_ __go_td_S0_CN3_intsre0_CN4_boolsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((&__go_td_CN4_boolsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree) };
struct l_struct_funcVal __go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree) };
static struct l_array_40_uint8_t tmp__244 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 32, 98u, 111u, 111u, 108u, 32, 125u } };
static struct l_unnamed_2 tmp__227 = { ((&tmp__244.array[((int32_t)0)])), UINT64_C(40) };
struct l_struct_ptrType __go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 18947337, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree_EC_gc)), (&tmp__245), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree.field0)) };
static struct l_array_3_struct_AC_l_struct_structField tmp__228 = { { { ((struct l_unnamed_2*)/*NULL*/0), ((struct l_unnamed_2*)/*NULL*/0), ((&__go_td_CN3_intsre.field0)), ((struct l_unnamed_2*)/*NULL*/0), UINT64_C(0) }, { ((struct l_unnamed_2*)/*NULL*/0), ((struct l_unnamed_2*)/*NULL*/0), ((&__go_td_CN3_intsre.field0)), ((struct l_unnamed_2*)/*NULL*/0), UINT64_C(8) }, { ((struct l_unnamed_2*)/*NULL*/0), ((struct l_unnamed_2*)/*NULL*/0), ((&__go_td_CN4_boolsre.field0)), ((struct l_unnamed_2*)/*NULL*/0), UINT64_C(16) } } };
struct l_array_11_uint8_t_KC_ __go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(24)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)(uintptr_t)UINT64_C(16)), ((&__go_td_CN4_boolsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_31_uint8_t tmp__246 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 32, 98u, 111u, 111u, 108u, 32, 125u } };
static struct l_unnamed_2 tmp__241 = { ((&tmp__246.array[((int32_t)0)])), UINT64_C(31) };
struct l_array_5_uint8_t_KC_ __go_td_pS0_CN3_intsre0_CN4_boolsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S0_CN3_intsre0_CN4_boolsree_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_41_uint8_t tmp__247 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 32, 98u, 111u, 111u, 108u, 32, 125u } };
static struct l_unnamed_2 tmp__245 = { ((&tmp__247.array[((int32_t)0)])), UINT64_C(41) };
struct l_array_5_uint8_t_KC_ __go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_14_uint8_t tmp__248 = { { 91u, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_2 tmp__233 = { ((&tmp__248.array[((int32_t)0)])), UINT64_C(14) };
struct l_array_5_uint8_t_KC_ __go_td_AIee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(24)), ((uint8_t*)(uintptr_t)UINT64_C(10)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_Ie_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_9_uint8_t tmp__249 = { { 99u, 104u, 97u, 110u, 32, 98u, 111u, 111u, 108u } };
static struct l_unnamed_2 tmp__243 = { ((&tmp__249.array[((int32_t)0)])), UINT64_C(9) };
struct l_struct_commonType __go_tdn_bool __attribute__((common)) = { 129u, 1, 1, UINT64_C(1), 67110493, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_bool_EC_gc)), (&tmp__250), (&tmp__251), ((struct l_struct_commonType*)/*NULL*/0) };
struct l_array_5_uint8_t_KC_ __go_td_CN4_boolsre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN4_boolsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_8_uint8_t tmp__252 = { { 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u } };
static struct l_unnamed_2 tmp__242 = { ((&tmp__252.array[((int32_t)0)])), UINT64_C(8) };
struct l_array_5_uint8_t_KC_ __go_td_CN3_intsre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_12_uint8_t tmp__253 = { { 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_2 tmp__232 = { ((&tmp__253.array[((int32_t)0)])), UINT64_C(12) };
struct l_array_4_uint8_t_KC_ __go_td_Ie_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };
static struct l_array_4_uint8_t tmp__254 = { { 98u, 111u, 111u, 108u } };
static struct l_unnamed_2 tmp__250 = { ((&tmp__254.array[((int32_t)0)])), UINT64_C(4) };
static struct l_array_4_uint8_t tmp__255 = { { 98u, 111u, 111u, 108u } };
static struct l_unnamed_2 tmp__256 = { ((&tmp__255.array[((int32_t)0)])), UINT64_C(4) };
static struct l_struct_uncommonType tmp__251 = { (&tmp__256), ((struct l_unnamed_2*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_bool_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0) } };


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
static __forceinline struct l_unnamed_2 llvm_ctor_unnamed_2(uint8_t* x0, uint64_t x1) {
  struct l_unnamed_2 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_1 llvm_ctor_unnamed_1(uint8_t* x0, uint8_t* x1) {
  struct l_unnamed_1 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_3 llvm_ctor_unnamed_3(uint8_t* x0, uint64_t x1, uint64_t x2) {
  struct l_unnamed_3 r;
  r.field0 = x0;
  r.field1 = x1;
  r.field2 = x2;
  return r;
}


/* Function Bodies */

static void main_OC_consumer_1(uint8_t* llvm_cbe_tmp__1, uint8_t* llvm_cbe_tmp__2, uint8_t* llvm_cbe_tmp__3, uint8_t* llvm_cbe_tmp__4) {
  uint64_t llvm_cbe_tmp__5;    /* Address-exposed local */
  uint8_t llvm_cbe_tmp__6;    /* Address-exposed local */
  uint64_t* llvm_cbe_tmp__7;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__8;    /* Address-exposed local */
  uint64_t* llvm_cbe_tmp__9;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__10;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__11;
  uint8_t* llvm_cbe_tmp__12;
  uint64_t llvm_cbe_tmp__13;
  uint8_t llvm_cbe_tmp__14;
  uint8_t llvm_cbe_tmp__15;
  uint64_t llvm_cbe_tmp__16;
  uint8_t llvm_cbe_tmp__17;
  uint8_t* llvm_cbe_tmp__18;
  uint8_t* llvm_cbe_tmp__19;
  uint64_t llvm_cbe_tmp__20;
  uint8_t llvm_cbe_tmp__21;
  uint8_t* llvm_cbe_tmp__22;
  struct l_unnamed_2* llvm_cbe_tmp__23;
  struct l_unnamed_1 llvm_cbe_tmp__24;
  uint8_t* llvm_cbe_tmp__25;
  uint8_t* llvm_cbe_tmp__26;

  goto llvm_cbe__2e_1_2e_for_2e_body;

  do {     /* Syntactic loop '.1.for.body' to make GCC happy */
llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_tmp__11 = runtime_OC_newselect(/*UNDEF*/((uint8_t*)/*NULL*/0), 2);
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__11, llvm_cbe_tmp__4, ((uint8_t*)/*NULL*/0), (&llvm_cbe_tmp__6), 0);
  llvm_cbe_tmp__7 = (&llvm_cbe_tmp__5);
  llvm_cbe_tmp__12 = *(((uint8_t**)(&llvm_cbe_tmp__7)));
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__11, llvm_cbe_tmp__2, llvm_cbe_tmp__12, (&llvm_cbe_tmp__6), 1);
  llvm_cbe_tmp__13 = runtime_OC_selectgo(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__11);
  llvm_cbe_tmp__14 = llvm_cbe_tmp__6;
  llvm_cbe_tmp__15 = *((uint8_t*)/*NULL*/0);
  llvm_cbe_tmp__16 = llvm_cbe_tmp__5;
  llvm_cbe_tmp__17 = ((uint8_t)(bool)(((llvm_cbe_tmp__13 == UINT64_C(0))&1)));
  switch (llvm_cbe_tmp__13) {
  default:
    goto llvm_cbe__2e_4_2e_select_2e_next;
  case UINT64_C(0):
    goto llvm_cbe__2e_1_2e_for_2e_body;
  case UINT64_C(1):
    goto llvm_cbe__2e_3_2e_select_2e_body;
  }

llvm_cbe__2e_3_2e_select_2e_body:
  llvm_cbe_tmp__18 = runtime_OC_newselect(/*UNDEF*/((uint8_t*)/*NULL*/0), 2);
  llvm_cbe_tmp__8 = llvm_cbe_tmp__16;
  runtime_OC_selectdefault(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__18, -1);
  llvm_cbe_tmp__9 = (&llvm_cbe_tmp__8);
  llvm_cbe_tmp__19 = *(((uint8_t**)(&llvm_cbe_tmp__9)));
  runtime_OC_selectsend(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__18, llvm_cbe_tmp__3, llvm_cbe_tmp__19, 0);
  llvm_cbe_tmp__20 = runtime_OC_selectgo(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__18);
  llvm_cbe_tmp__21 = ((uint8_t)(bool)(((llvm_cbe_tmp__20 == UINT64_C(0))&1)));
  goto llvm_cbe__2e_1_2e_for_2e_body;

  } while (1); /* end of syntactic loop '.1.for.body' */
llvm_cbe__2e_4_2e_select_2e_next:
  llvm_cbe_tmp__22 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__23 = ((struct l_unnamed_2*)llvm_cbe_tmp__22);
  *llvm_cbe_tmp__23 = llvm_ctor_unnamed_2(((&tmp__27.array[((int32_t)0)])), UINT64_C(31));
  llvm_cbe_tmp__24 = llvm_ctor_unnamed_1(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__24.field1 = (((uint8_t*)llvm_cbe_tmp__23));
  llvm_cbe_tmp__10 = llvm_cbe_tmp__24;
  llvm_cbe_tmp__25 = *((&llvm_cbe_tmp__10.field0));
  llvm_cbe_tmp__26 = *((&llvm_cbe_tmp__10.field1));
  __go_panic(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__25, llvm_cbe_tmp__26);
  __builtin_unreachable();

}


static void main_OC_consumer_2(uint8_t* llvm_cbe_tmp__28, uint8_t* llvm_cbe_tmp__29, uint8_t* llvm_cbe_tmp__30, uint8_t* llvm_cbe_tmp__31) {
  uint64_t llvm_cbe_tmp__32;    /* Address-exposed local */
  uint8_t llvm_cbe_tmp__33;    /* Address-exposed local */
  uint64_t* llvm_cbe_tmp__34;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__35;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__36;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__37;    /* Address-exposed local */
  uint64_t* llvm_cbe_tmp__38;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__39;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__40;
  uint8_t* llvm_cbe_tmp__41;
  uint64_t llvm_cbe_tmp__42;
  uint8_t llvm_cbe_tmp__43;
  uint8_t llvm_cbe_tmp__44;
  uint64_t llvm_cbe_tmp__45;
  uint8_t llvm_cbe_tmp__46;
  uint8_t* llvm_cbe_tmp__47;
  uint8_t* llvm_cbe_tmp__48;
  uint8_t* llvm_cbe_tmp__49;
  struct l_unnamed_2* llvm_cbe_tmp__50;
  struct l_unnamed_1 llvm_cbe_tmp__51;
  struct l_unnamed_3 llvm_cbe_tmp__52;
  struct l_unnamed_3 llvm_cbe_tmp__53;
  struct l_unnamed_3 llvm_cbe_tmp__54;
  uint64_t llvm_cbe_tmp__55;
  struct l_unnamed_1 llvm_cbe_tmp__56;
  uint8_t* llvm_cbe_tmp__57;
  uint8_t* llvm_cbe_tmp__58;
  uint64_t llvm_cbe_tmp__59;
  uint8_t llvm_cbe_tmp__60;
  uint8_t* llvm_cbe_tmp__61;
  struct l_unnamed_2* llvm_cbe_tmp__62;
  struct l_unnamed_1 llvm_cbe_tmp__63;
  uint8_t* llvm_cbe_tmp__64;
  uint8_t* llvm_cbe_tmp__65;

  goto llvm_cbe__2e_1_2e_for_2e_body;

  do {     /* Syntactic loop '.1.for.body' to make GCC happy */
llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_tmp__40 = runtime_OC_newselect(/*UNDEF*/((uint8_t*)/*NULL*/0), 2);
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__40, llvm_cbe_tmp__31, ((uint8_t*)/*NULL*/0), (&llvm_cbe_tmp__33), 0);
  llvm_cbe_tmp__34 = (&llvm_cbe_tmp__32);
  llvm_cbe_tmp__41 = *(((uint8_t**)(&llvm_cbe_tmp__34)));
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__40, llvm_cbe_tmp__29, llvm_cbe_tmp__41, (&llvm_cbe_tmp__33), 1);
  llvm_cbe_tmp__42 = runtime_OC_selectgo(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__40);
  llvm_cbe_tmp__43 = llvm_cbe_tmp__33;
  llvm_cbe_tmp__44 = *((uint8_t*)/*NULL*/0);
  llvm_cbe_tmp__45 = llvm_cbe_tmp__32;
  llvm_cbe_tmp__46 = ((uint8_t)(bool)(((llvm_cbe_tmp__42 == UINT64_C(0))&1)));
  switch (llvm_cbe_tmp__42) {
  default:
    goto llvm_cbe__2e_5_2e_select_2e_next;
  case UINT64_C(0):
    goto llvm_cbe__2e_2_2e_select_2e_body;
  case UINT64_C(1):
    goto llvm_cbe__2e_4_2e_select_2e_body;
  }

llvm_cbe__2e_4_2e_select_2e_body:
  llvm_cbe_tmp__57 = runtime_OC_newselect(/*UNDEF*/((uint8_t*)/*NULL*/0), 2);
  llvm_cbe_tmp__37 = (llvm_mul_u64((llvm_mul_u64((llvm_mul_u64(UINT64_C(10), llvm_cbe_tmp__45)), llvm_cbe_tmp__45)), llvm_cbe_tmp__45));
  runtime_OC_selectdefault(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__57, -1);
  llvm_cbe_tmp__38 = (&llvm_cbe_tmp__37);
  llvm_cbe_tmp__58 = *(((uint8_t**)(&llvm_cbe_tmp__38)));
  runtime_OC_selectsend(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__57, llvm_cbe_tmp__30, llvm_cbe_tmp__58, 0);
  llvm_cbe_tmp__59 = runtime_OC_selectgo(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__57);
  llvm_cbe_tmp__60 = ((uint8_t)(bool)(((llvm_cbe_tmp__59 == UINT64_C(0))&1)));
  goto llvm_cbe__2e_1_2e_for_2e_body;

llvm_cbe__2e_2_2e_select_2e_body:
  llvm_cbe_tmp__47 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__48 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_1*)llvm_cbe_tmp__47)));
  llvm_cbe_tmp__49 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__50 = ((struct l_unnamed_2*)llvm_cbe_tmp__49);
  *llvm_cbe_tmp__50 = llvm_ctor_unnamed_2(((&tmp__66.array[((int32_t)0)])), UINT64_C(4));
  llvm_cbe_tmp__51 = llvm_ctor_unnamed_1(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__51.field1 = (((uint8_t*)llvm_cbe_tmp__50));
  *(((struct l_unnamed_1*)(((uint8_t*)((&(*(((struct l_unnamed_1*)llvm_cbe_tmp__48))))))))) = llvm_cbe_tmp__51;
  llvm_cbe_tmp__52 = llvm_ctor_unnamed_3(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__52.field0 = ((&(*llvm_cbe_tmp__48)));
  llvm_cbe_tmp__53 = llvm_cbe_tmp__52;
  llvm_cbe_tmp__53.field1 = UINT64_C(1);
  llvm_cbe_tmp__54 = llvm_cbe_tmp__53;
  llvm_cbe_tmp__54.field2 = UINT64_C(1);
  llvm_cbe_tmp__35 = llvm_cbe_tmp__54;
  llvm_cbe_tmp__36 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__35);
  llvm_cbe_tmp__55 = *((&llvm_cbe_tmp__36.field0));
  llvm_cbe_tmp__56 = *((&llvm_cbe_tmp__36.field1));
  goto llvm_cbe__2e_1_2e_for_2e_body;

  } while (1); /* end of syntactic loop '.1.for.body' */
llvm_cbe__2e_5_2e_select_2e_next:
  llvm_cbe_tmp__61 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__62 = ((struct l_unnamed_2*)llvm_cbe_tmp__61);
  *llvm_cbe_tmp__62 = llvm_ctor_unnamed_2(((&tmp__67.array[((int32_t)0)])), UINT64_C(31));
  llvm_cbe_tmp__63 = llvm_ctor_unnamed_1(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__63.field1 = (((uint8_t*)llvm_cbe_tmp__62));
  llvm_cbe_tmp__39 = llvm_cbe_tmp__63;
  llvm_cbe_tmp__64 = *((&llvm_cbe_tmp__39.field0));
  llvm_cbe_tmp__65 = *((&llvm_cbe_tmp__39.field1));
  __go_panic(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__64, llvm_cbe_tmp__65);
  __builtin_unreachable();

}


void main_OC__OC_import(uint8_t* llvm_cbe_tmp__68) {
  bool llvm_cbe_tmp__69;

  llvm_cbe_tmp__69 = ((init_EC_guard)&1);
  if (llvm_cbe_tmp__69) {
    goto llvm_cbe__2e_0_2e_entry;
  } else {
    goto llvm_cbe_tmp__70;
  }

llvm_cbe__2e_0_2e_entry:
  return;
llvm_cbe_tmp__70:
  init_EC_guard = ((1) & 1);
  fmt_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  time_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  goto llvm_cbe__2e_0_2e_entry;

}


void main_OC_main(uint8_t* llvm_cbe_tmp__71) {
  uint64_t llvm_cbe_tmp__72;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__73;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__74;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__75;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__76;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__77;    /* Address-exposed local */
  uint8_t llvm_cbe_tmp__78;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__79;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__80;
  uint8_t* llvm_cbe_tmp__81;
  uint8_t* llvm_cbe_tmp__82;
  uint8_t* llvm_cbe_tmp__83;
  struct l_unnamed_1* llvm_cbe_tmp__84;
  uint8_t* llvm_cbe_tmp__85;
  struct l_unnamed_5* llvm_cbe_tmp__86;
  uint8_t* llvm_cbe_tmp__87;
  struct l_unnamed_5* llvm_cbe_tmp__88;
  uint64_t llvm_cbe_tmp__89;
  uint64_t llvm_cbe_tmp__90;
  uint8_t* llvm_cbe_tmp__91;
  uint8_t* llvm_cbe_tmp__92;
  uint8_t* llvm_cbe_tmp__93;
  uint64_t* llvm_cbe_tmp__94;
  struct l_unnamed_1 llvm_cbe_tmp__95;
  struct l_unnamed_3 llvm_cbe_tmp__96;
  struct l_unnamed_3 llvm_cbe_tmp__97;
  struct l_unnamed_3 llvm_cbe_tmp__98;
  uint64_t llvm_cbe_tmp__99;
  struct l_unnamed_1 llvm_cbe_tmp__100;
  uint64_t llvm_cbe_tmp__101;
  uint64_t llvm_cbe_tmp__102;
  uint8_t* llvm_cbe_tmp__103;
  uint8_t* llvm_cbe_tmp__104;
  uint8_t* llvm_cbe_tmp__105;
  uint64_t* llvm_cbe_tmp__106;
  struct l_unnamed_1 llvm_cbe_tmp__107;
  struct l_unnamed_3 llvm_cbe_tmp__108;
  struct l_unnamed_3 llvm_cbe_tmp__109;
  struct l_unnamed_3 llvm_cbe_tmp__110;
  uint64_t llvm_cbe_tmp__111;
  struct l_unnamed_1 llvm_cbe_tmp__112;
  uint64_t llvm_cbe_tmp__113;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__114;
  uint64_t llvm_cbe_tmp__115;
  uint64_t llvm_cbe_i2;
  uint64_t llvm_cbe_i2__PHI_TEMPORARY;

  llvm_cbe_tmp__80 = fifo_malloc(8, UINT64_C(10));
  llvm_cbe_tmp__81 = fifo_malloc(8, UINT64_C(0));
  llvm_cbe_tmp__82 = fifo_malloc(8, UINT64_C(0));
  llvm_cbe_tmp__83 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsre0_CN4_boolsree.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__84 = ((struct l_unnamed_1*)llvm_cbe_tmp__83);
  *((&llvm_cbe_tmp__84->field0)) = llvm_cbe_tmp__81;
  *((&llvm_cbe_tmp__84->field1)) = llvm_cbe_tmp__80;
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__116), (((uint8_t*)llvm_cbe_tmp__84)));
  llvm_cbe_tmp__85 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree.field0.field0)), UINT64_C(24));
  llvm_cbe_tmp__86 = ((struct l_unnamed_5*)llvm_cbe_tmp__85);
  *((&llvm_cbe_tmp__86->field0)) = llvm_cbe_tmp__81;
  *((&llvm_cbe_tmp__86->field1)) = llvm_cbe_tmp__82;
  *((&llvm_cbe_tmp__86->field2)) = llvm_cbe_tmp__80;
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__117), (((uint8_t*)llvm_cbe_tmp__86)));
  llvm_cbe_tmp__87 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree.field0.field0)), UINT64_C(24));
  llvm_cbe_tmp__88 = ((struct l_unnamed_5*)llvm_cbe_tmp__87);
  *((&llvm_cbe_tmp__88->field0)) = llvm_cbe_tmp__81;
  *((&llvm_cbe_tmp__88->field1)) = llvm_cbe_tmp__82;
  *((&llvm_cbe_tmp__88->field2)) = llvm_cbe_tmp__80;
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__118), (((uint8_t*)llvm_cbe_tmp__88)));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(5)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    llvm_cbe_i2__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_tmp__89 = fifo_read(llvm_cbe_tmp__82);
  llvm_cbe_tmp__72 = llvm_cbe_tmp__89;
  llvm_cbe_tmp__90 = llvm_cbe_tmp__72;
  llvm_cbe_tmp__91 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__92 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_1*)llvm_cbe_tmp__91)));
  llvm_cbe_tmp__93 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_int.field0)), UINT64_C(8));
  llvm_cbe_tmp__94 = ((uint64_t*)llvm_cbe_tmp__93);
  *llvm_cbe_tmp__94 = llvm_cbe_tmp__90;
  llvm_cbe_tmp__95 = llvm_ctor_unnamed_1(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__95.field1 = (((uint8_t*)llvm_cbe_tmp__94));
  *(((struct l_unnamed_1*)(((uint8_t*)((&(*(((struct l_unnamed_1*)llvm_cbe_tmp__92))))))))) = llvm_cbe_tmp__95;
  llvm_cbe_tmp__96 = llvm_ctor_unnamed_3(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__96.field0 = ((&(*llvm_cbe_tmp__92)));
  llvm_cbe_tmp__97 = llvm_cbe_tmp__96;
  llvm_cbe_tmp__97.field1 = UINT64_C(1);
  llvm_cbe_tmp__98 = llvm_cbe_tmp__97;
  llvm_cbe_tmp__98.field2 = UINT64_C(1);
  llvm_cbe_tmp__73 = llvm_cbe_tmp__98;
  llvm_cbe_tmp__74 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__73);
  llvm_cbe_tmp__99 = *((&llvm_cbe_tmp__74.field0));
  llvm_cbe_tmp__100 = *((&llvm_cbe_tmp__74.field1));
  llvm_cbe_tmp__101 = fifo_read(llvm_cbe_tmp__82);
  llvm_cbe_tmp__75 = llvm_cbe_tmp__101;
  llvm_cbe_tmp__102 = llvm_cbe_tmp__75;
  llvm_cbe_tmp__103 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__104 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_1*)llvm_cbe_tmp__103)));
  llvm_cbe_tmp__105 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_int.field0)), UINT64_C(8));
  llvm_cbe_tmp__106 = ((uint64_t*)llvm_cbe_tmp__105);
  *llvm_cbe_tmp__106 = llvm_cbe_tmp__102;
  llvm_cbe_tmp__107 = llvm_ctor_unnamed_1(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__107.field1 = (((uint8_t*)llvm_cbe_tmp__106));
  *(((struct l_unnamed_1*)(((uint8_t*)((&(*(((struct l_unnamed_1*)llvm_cbe_tmp__104))))))))) = llvm_cbe_tmp__107;
  llvm_cbe_tmp__108 = llvm_ctor_unnamed_3(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__108.field0 = ((&(*llvm_cbe_tmp__104)));
  llvm_cbe_tmp__109 = llvm_cbe_tmp__108;
  llvm_cbe_tmp__109.field1 = UINT64_C(1);
  llvm_cbe_tmp__110 = llvm_cbe_tmp__109;
  llvm_cbe_tmp__110.field2 = UINT64_C(1);
  llvm_cbe_tmp__76 = llvm_cbe_tmp__110;
  llvm_cbe_tmp__77 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__76);
  llvm_cbe_tmp__111 = *((&llvm_cbe_tmp__77.field0));
  llvm_cbe_tmp__112 = *((&llvm_cbe_tmp__77.field1));
  llvm_cbe_tmp__113 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__113;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done:
  time_OC_Sleep(/*UNDEF*/((uint8_t*)/*NULL*/0), UINT64_C(1000000000));
  return;
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop:
  llvm_cbe_i2 = llvm_cbe_i2__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i2) < ((int64_t)UINT64_C(3)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

llvm_cbe__2e_4_2e_for_2e_body:
  llvm_cbe_tmp__78 = 1;
  llvm_cbe_tmp__79 = (&llvm_cbe_tmp__78);
  llvm_cbe_tmp__114 = *(((uint64_t*)(&llvm_cbe_tmp__79)));
  fifo_write(llvm_cbe_tmp__80, llvm_cbe_tmp__114);
  llvm_cbe_tmp__115 = llvm_add_u64(llvm_cbe_i2, UINT64_C(1));
  llvm_cbe_i2__PHI_TEMPORARY = llvm_cbe_tmp__115;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.6.for.loop' */
}


static void tmp__116(uint8_t* llvm_cbe_tmp__119) {
  struct l_unnamed_1* llvm_cbe_tmp__120;
  uint8_t* llvm_cbe_tmp__121;
  uint8_t* llvm_cbe_tmp__122;

  llvm_cbe_tmp__120 = ((struct l_unnamed_1*)llvm_cbe_tmp__119);
  llvm_cbe_tmp__121 = *((&llvm_cbe_tmp__120->field0));
  llvm_cbe_tmp__122 = *((&llvm_cbe_tmp__120->field1));
  main_OC_producer(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__121, llvm_cbe_tmp__122);
}


static void main_OC_producer(uint8_t* llvm_cbe_tmp__123, uint8_t* llvm_cbe_tmp__124, uint8_t* llvm_cbe_tmp__125) {
  uint64_t llvm_cbe_tmp__126;    /* Address-exposed local */
  uint8_t llvm_cbe_tmp__127;    /* Address-exposed local */
  uint64_t* llvm_cbe_tmp__128;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__129;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__130;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__131;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__132;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__133;    /* Address-exposed local */
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint8_t* llvm_cbe_tmp__134;
  uint8_t* llvm_cbe_tmp__135;
  uint64_t llvm_cbe_tmp__136;
  uint8_t llvm_cbe_tmp__137;
  uint8_t llvm_cbe_tmp__138;
  uint8_t llvm_cbe_tmp__139;
  uint64_t llvm_cbe_tmp__140;
  uint8_t* llvm_cbe_tmp__141;
  uint8_t* llvm_cbe_tmp__142;
  uint8_t* llvm_cbe_tmp__143;
  struct l_unnamed_2* llvm_cbe_tmp__144;
  struct l_unnamed_1 llvm_cbe_tmp__145;
  struct l_unnamed_3 llvm_cbe_tmp__146;
  struct l_unnamed_3 llvm_cbe_tmp__147;
  struct l_unnamed_3 llvm_cbe_tmp__148;
  uint64_t llvm_cbe_tmp__149;
  struct l_unnamed_1 llvm_cbe_tmp__150;
  uint8_t* llvm_cbe_tmp__151;
  uint8_t* llvm_cbe_tmp__152;
  uint8_t* llvm_cbe_tmp__153;
  struct l_unnamed_2* llvm_cbe_tmp__154;
  struct l_unnamed_1 llvm_cbe_tmp__155;
  struct l_unnamed_3 llvm_cbe_tmp__156;
  struct l_unnamed_3 llvm_cbe_tmp__157;
  struct l_unnamed_3 llvm_cbe_tmp__158;
  uint64_t llvm_cbe_tmp__159;
  struct l_unnamed_1 llvm_cbe_tmp__160;
  uint8_t* llvm_cbe_tmp__161;
  struct l_unnamed_2* llvm_cbe_tmp__162;
  struct l_unnamed_1 llvm_cbe_tmp__163;
  uint8_t* llvm_cbe_tmp__164;
  uint8_t* llvm_cbe_tmp__165;

  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(1);   /* for PHI node */
  goto llvm_cbe__2e_1_2e_for_2e_body;

  do {     /* Syntactic loop '.1.for.body' to make GCC happy */
llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_tmp__134 = runtime_OC_newselect(/*UNDEF*/((uint8_t*)/*NULL*/0), 2);
  llvm_cbe_tmp__126 = llvm_cbe_i;
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__134, llvm_cbe_tmp__125, ((uint8_t*)/*NULL*/0), (&llvm_cbe_tmp__127), 0);
  llvm_cbe_tmp__128 = (&llvm_cbe_tmp__126);
  llvm_cbe_tmp__135 = *(((uint8_t**)(&llvm_cbe_tmp__128)));
  runtime_OC_selectsend(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__134, llvm_cbe_tmp__124, llvm_cbe_tmp__135, 1);
  llvm_cbe_tmp__136 = runtime_OC_selectgo(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__134);
  llvm_cbe_tmp__137 = llvm_cbe_tmp__127;
  llvm_cbe_tmp__138 = *((uint8_t*)/*NULL*/0);
  llvm_cbe_tmp__139 = ((uint8_t)(bool)(((llvm_cbe_tmp__136 == UINT64_C(0))&1)));
  switch (llvm_cbe_tmp__136) {
  default:
    goto llvm_cbe__2e_6_2e_select_2e_next;
  case UINT64_C(0):
    goto llvm_cbe__2e_3_2e_select_2e_body;
  case UINT64_C(1):
    goto llvm_cbe__2e_5_2e_select_2e_body;
  }

llvm_cbe__2e_5_2e_select_2e_body:
  llvm_cbe_tmp__151 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__152 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_1*)llvm_cbe_tmp__151)));
  llvm_cbe_tmp__153 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__154 = ((struct l_unnamed_2*)llvm_cbe_tmp__153);
  *llvm_cbe_tmp__154 = llvm_ctor_unnamed_2(((&tmp__166.array[((int32_t)0)])), UINT64_C(17));
  llvm_cbe_tmp__155 = llvm_ctor_unnamed_1(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__155.field1 = (((uint8_t*)llvm_cbe_tmp__154));
  *(((struct l_unnamed_1*)(((uint8_t*)((&(*(((struct l_unnamed_1*)llvm_cbe_tmp__152))))))))) = llvm_cbe_tmp__155;
  llvm_cbe_tmp__156 = llvm_ctor_unnamed_3(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__156.field0 = ((&(*llvm_cbe_tmp__152)));
  llvm_cbe_tmp__157 = llvm_cbe_tmp__156;
  llvm_cbe_tmp__157.field1 = UINT64_C(1);
  llvm_cbe_tmp__158 = llvm_cbe_tmp__157;
  llvm_cbe_tmp__158.field2 = UINT64_C(1);
  llvm_cbe_tmp__131 = llvm_cbe_tmp__158;
  llvm_cbe_tmp__132 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__131);
  llvm_cbe_tmp__159 = *((&llvm_cbe_tmp__132.field0));
  llvm_cbe_tmp__160 = *((&llvm_cbe_tmp__132.field1));
  goto llvm_cbe__2e_2_2e_select_2e_done;

llvm_cbe__2e_3_2e_select_2e_body:
  llvm_cbe_tmp__141 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__142 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_1*)llvm_cbe_tmp__141)));
  llvm_cbe_tmp__143 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__144 = ((struct l_unnamed_2*)llvm_cbe_tmp__143);
  *llvm_cbe_tmp__144 = llvm_ctor_unnamed_2(((&tmp__167.array[((int32_t)0)])), UINT64_C(13));
  llvm_cbe_tmp__145 = llvm_ctor_unnamed_1(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__145.field1 = (((uint8_t*)llvm_cbe_tmp__144));
  *(((struct l_unnamed_1*)(((uint8_t*)((&(*(((struct l_unnamed_1*)llvm_cbe_tmp__142))))))))) = llvm_cbe_tmp__145;
  llvm_cbe_tmp__146 = llvm_ctor_unnamed_3(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__146.field0 = ((&(*llvm_cbe_tmp__142)));
  llvm_cbe_tmp__147 = llvm_cbe_tmp__146;
  llvm_cbe_tmp__147.field1 = UINT64_C(1);
  llvm_cbe_tmp__148 = llvm_cbe_tmp__147;
  llvm_cbe_tmp__148.field2 = UINT64_C(1);
  llvm_cbe_tmp__129 = llvm_cbe_tmp__148;
  llvm_cbe_tmp__130 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__129);
  llvm_cbe_tmp__149 = *((&llvm_cbe_tmp__130.field0));
  llvm_cbe_tmp__150 = *((&llvm_cbe_tmp__130.field1));
  goto llvm_cbe__2e_2_2e_select_2e_done;

llvm_cbe__2e_2_2e_select_2e_done:
  llvm_cbe_tmp__140 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__140;   /* for PHI node */
  goto llvm_cbe__2e_1_2e_for_2e_body;

  } while (1); /* end of syntactic loop '.1.for.body' */
llvm_cbe__2e_6_2e_select_2e_next:
  llvm_cbe_tmp__161 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__162 = ((struct l_unnamed_2*)llvm_cbe_tmp__161);
  *llvm_cbe_tmp__162 = llvm_ctor_unnamed_2(((&tmp__168.array[((int32_t)0)])), UINT64_C(31));
  llvm_cbe_tmp__163 = llvm_ctor_unnamed_1(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__163.field1 = (((uint8_t*)llvm_cbe_tmp__162));
  llvm_cbe_tmp__133 = llvm_cbe_tmp__163;
  llvm_cbe_tmp__164 = *((&llvm_cbe_tmp__133.field0));
  llvm_cbe_tmp__165 = *((&llvm_cbe_tmp__133.field1));
  __go_panic(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__164, llvm_cbe_tmp__165);
  __builtin_unreachable();

}


static void tmp__117(uint8_t* llvm_cbe_tmp__169) {
  struct l_unnamed_5* llvm_cbe_tmp__170;
  uint8_t* llvm_cbe_tmp__171;
  uint8_t* llvm_cbe_tmp__172;
  uint8_t* llvm_cbe_tmp__173;

  llvm_cbe_tmp__170 = ((struct l_unnamed_5*)llvm_cbe_tmp__169);
  llvm_cbe_tmp__171 = *((&llvm_cbe_tmp__170->field0));
  llvm_cbe_tmp__172 = *((&llvm_cbe_tmp__170->field1));
  llvm_cbe_tmp__173 = *((&llvm_cbe_tmp__170->field2));
  main_OC_consumer_1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__171, llvm_cbe_tmp__172, llvm_cbe_tmp__173);
}


static void tmp__118(uint8_t* llvm_cbe_tmp__174) {
  struct l_unnamed_5* llvm_cbe_tmp__175;
  uint8_t* llvm_cbe_tmp__176;
  uint8_t* llvm_cbe_tmp__177;
  uint8_t* llvm_cbe_tmp__178;

  llvm_cbe_tmp__175 = ((struct l_unnamed_5*)llvm_cbe_tmp__174);
  llvm_cbe_tmp__176 = *((&llvm_cbe_tmp__175->field0));
  llvm_cbe_tmp__177 = *((&llvm_cbe_tmp__175->field1));
  llvm_cbe_tmp__178 = *((&llvm_cbe_tmp__175->field2));
  main_OC_consumer_2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__176, llvm_cbe_tmp__177, llvm_cbe_tmp__178);
}


uint64_t __go_type_hash_AIe1e(uint8_t* llvm_cbe_tmp__179, uint64_t llvm_cbe_tmp__180) {
  struct l_unnamed_1* llvm_cbe_tmp__181;
  uint64_t llvm_cbe_tmp__182;
  uint64_t llvm_cbe_tmp__182__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__183;
  uint64_t llvm_cbe_tmp__183__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__184;
  uint64_t llvm_cbe_tmp__185;
  uint64_t llvm_cbe_tmp__186;

  llvm_cbe_tmp__181 = ((struct l_unnamed_1*)llvm_cbe_tmp__179);
  llvm_cbe_tmp__182__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_tmp__183__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__182 = llvm_cbe_tmp__182__PHI_TEMPORARY;
  llvm_cbe_tmp__183 = llvm_cbe_tmp__183__PHI_TEMPORARY;
  llvm_cbe_tmp__184 = __go_type_hash_empty_interface((((uint8_t*)((&llvm_cbe_tmp__181[((int64_t)llvm_cbe_tmp__182)])))), UINT64_C(16));
  llvm_cbe_tmp__185 = llvm_add_u64((llvm_mul_u64(llvm_cbe_tmp__183, UINT64_C(33))), llvm_cbe_tmp__184);
  llvm_cbe_tmp__186 = llvm_add_u64(llvm_cbe_tmp__182, UINT64_C(1));
  if ((((llvm_cbe_tmp__186 == UINT64_C(1))&1))) {
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__182__PHI_TEMPORARY = llvm_cbe_tmp__186;   /* for PHI node */
    llvm_cbe_tmp__183__PHI_TEMPORARY = llvm_cbe_tmp__185;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  return llvm_cbe_tmp__185;
}


uint8_t __go_type_hash_AIe1e_OC_1(uint8_t* llvm_cbe_tmp__187, uint8_t* llvm_cbe_tmp__188, uint64_t llvm_cbe_tmp__189) {
  struct l_unnamed_1* llvm_cbe_tmp__190;
  struct l_unnamed_1* llvm_cbe_tmp__191;
  uint64_t llvm_cbe_tmp__192;
  uint64_t llvm_cbe_tmp__192__PHI_TEMPORARY;
  uint8_t llvm_cbe_tmp__193;
  uint8_t llvm_cbe_merge;
  uint8_t llvm_cbe_merge__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__194;

  llvm_cbe_tmp__190 = ((struct l_unnamed_1*)llvm_cbe_tmp__187);
  llvm_cbe_tmp__191 = ((struct l_unnamed_1*)llvm_cbe_tmp__188);
  llvm_cbe_tmp__192__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__192 = llvm_cbe_tmp__192__PHI_TEMPORARY;
  llvm_cbe_tmp__193 = __go_type_equal_empty_interface((((uint8_t*)((&llvm_cbe_tmp__190[((int64_t)llvm_cbe_tmp__192)])))), (((uint8_t*)((&llvm_cbe_tmp__191[((int64_t)llvm_cbe_tmp__192)])))), UINT64_C(16));
  if ((((llvm_cbe_tmp__193 == ((uint8_t)0))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 0;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_cont:
  llvm_cbe_tmp__194 = llvm_add_u64(llvm_cbe_tmp__192, UINT64_C(1));
  if ((((llvm_cbe_tmp__194 == UINT64_C(1))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 1;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__192__PHI_TEMPORARY = llvm_cbe_tmp__194;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  llvm_cbe_merge = llvm_cbe_merge__PHI_TEMPORARY;
  return llvm_cbe_merge;
}


uint64_t __go_type_hash_S0_CN3_intsre0_CN4_boolsree(uint8_t* llvm_cbe_tmp__195, uint64_t llvm_cbe_tmp__196) {
  struct l_unnamed_1* llvm_cbe_tmp__197;
  uint64_t llvm_cbe_tmp__198;
  uint64_t llvm_cbe_tmp__199;

  llvm_cbe_tmp__197 = ((struct l_unnamed_1*)llvm_cbe_tmp__195);
  llvm_cbe_tmp__198 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__197->field0)))), UINT64_C(8));
  llvm_cbe_tmp__199 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__197->field1)))), UINT64_C(8));
  return (llvm_add_u64((llvm_mul_u64((llvm_add_u64(UINT64_C(0), llvm_cbe_tmp__198)), UINT64_C(33))), llvm_cbe_tmp__199));
}


uint8_t __go_type_equal_S0_CN3_intsre0_CN4_boolsree(uint8_t* llvm_cbe_tmp__200, uint8_t* llvm_cbe_tmp__201, uint64_t llvm_cbe_tmp__202) {
  struct l_unnamed_1* llvm_cbe_tmp__203;
  struct l_unnamed_1* llvm_cbe_tmp__204;
  uint8_t llvm_cbe_tmp__205;
  uint8_t llvm_cbe_tmp__206;

  llvm_cbe_tmp__203 = ((struct l_unnamed_1*)llvm_cbe_tmp__200);
  llvm_cbe_tmp__204 = ((struct l_unnamed_1*)llvm_cbe_tmp__201);
  llvm_cbe_tmp__205 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__203->field0)))), (((uint8_t*)((&llvm_cbe_tmp__204->field0)))), UINT64_C(8));
  if ((((llvm_cbe_tmp__205 == ((uint8_t)0))&1))) {
    goto llvm_cbe_retzero;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_retzero:
  return 0;
llvm_cbe_cont:
  llvm_cbe_tmp__206 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__203->field1)))), (((uint8_t*)((&llvm_cbe_tmp__204->field1)))), UINT64_C(8));
  return (llvm_select_u8((((llvm_cbe_tmp__206 == ((uint8_t)0))&1)), 0, 1));
}


uint64_t __go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree(uint8_t* llvm_cbe_tmp__207, uint64_t llvm_cbe_tmp__208) {
  struct l_unnamed_5* llvm_cbe_tmp__209;
  uint64_t llvm_cbe_tmp__210;
  uint64_t llvm_cbe_tmp__211;
  uint64_t llvm_cbe_tmp__212;

  llvm_cbe_tmp__209 = ((struct l_unnamed_5*)llvm_cbe_tmp__207);
  llvm_cbe_tmp__210 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__209->field0)))), UINT64_C(8));
  llvm_cbe_tmp__211 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__209->field1)))), UINT64_C(8));
  llvm_cbe_tmp__212 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__209->field2)))), UINT64_C(8));
  return (llvm_add_u64((llvm_mul_u64((llvm_add_u64((llvm_mul_u64((llvm_add_u64(UINT64_C(0), llvm_cbe_tmp__210)), UINT64_C(33))), llvm_cbe_tmp__211)), UINT64_C(33))), llvm_cbe_tmp__212));
}


uint8_t __go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree(uint8_t* llvm_cbe_tmp__213, uint8_t* llvm_cbe_tmp__214, uint64_t llvm_cbe_tmp__215) {
  struct l_unnamed_5* llvm_cbe_tmp__216;
  struct l_unnamed_5* llvm_cbe_tmp__217;
  uint8_t llvm_cbe_tmp__218;
  uint8_t llvm_cbe_tmp__219;
  uint8_t llvm_cbe_tmp__220;

  llvm_cbe_tmp__216 = ((struct l_unnamed_5*)llvm_cbe_tmp__213);
  llvm_cbe_tmp__217 = ((struct l_unnamed_5*)llvm_cbe_tmp__214);
  llvm_cbe_tmp__218 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__216->field0)))), (((uint8_t*)((&llvm_cbe_tmp__217->field0)))), UINT64_C(8));
  if ((((llvm_cbe_tmp__218 == ((uint8_t)0))&1))) {
    goto llvm_cbe_retzero;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_retzero:
  return 0;
llvm_cbe_cont:
  llvm_cbe_tmp__219 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__216->field1)))), (((uint8_t*)((&llvm_cbe_tmp__217->field1)))), UINT64_C(8));
  if ((((llvm_cbe_tmp__219 == ((uint8_t)0))&1))) {
    goto llvm_cbe_retzero;
  } else {
    goto llvm_cbe_cont1;
  }

llvm_cbe_cont1:
  llvm_cbe_tmp__220 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__216->field2)))), (((uint8_t*)((&llvm_cbe_tmp__217->field2)))), UINT64_C(8));
  return (llvm_select_u8((((llvm_cbe_tmp__220 == ((uint8_t)0))&1)), 0, 1));
}


void __go_init_main(uint8_t* llvm_cbe_tmp__221) {
  main_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
}

