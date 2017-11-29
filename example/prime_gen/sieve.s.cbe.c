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
struct l_unnamed_1;
struct l_struct_method;
struct l_struct_methodSlice;
struct l_struct_uncommonType;
struct l_struct_commonType;
struct l_struct_chanType;
struct l_struct_structField;
struct l_struct_structFieldSlice;
struct l_struct_structType;
struct l_struct_ptrType;
struct l_unnamed_2;
struct l_unnamed_3;
typedef void l_fptr_1(void);

/* Types Definitions */
struct l_struct_funcVal {
  l_fptr_1* field0;
};
struct l_unnamed_1 {
  uint8_t* field0;
  uint64_t field1;
};
struct l_struct_method {
  struct l_unnamed_1* field0;
  struct l_unnamed_1* field1;
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
  struct l_unnamed_1* field0;
  struct l_unnamed_1* field1;
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
  struct l_unnamed_1* field8;
  struct l_struct_uncommonType* field9;
  struct l_struct_commonType* field10;
};
struct l_struct_chanType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
  uint64_t field2;
};
struct l_struct_structField {
  struct l_unnamed_1* field0;
  struct l_unnamed_1* field1;
  struct l_struct_commonType* field2;
  struct l_unnamed_1* field3;
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
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_8_uint8_t_KC_ {
  uint8_t* array[8];
};
struct l_array_3_struct_AC_l_struct_structField {
  struct l_struct_structField array[3];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_38_uint8_t {
  uint8_t array[38];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_39_uint8_t {
  uint8_t array[39];
};
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_unnamed_2 {
  uint8_t* field0;
};
struct l_unnamed_3 {
  uint8_t* field0;
  uint8_t* field1;
  uint64_t field2;
};

/* Function definitions */


/* External Global Variable Declarations */
extern struct l_struct_funcVal __go_type_hash_identity_descriptor;
extern struct l_struct_funcVal __go_type_equal_identity_descriptor;

/* Function Declarations */
void __go_go(uint8_t*, uint8_t*, uint8_t*);
uint8_t* __go_new(uint8_t*, uint8_t*, uint64_t);
uint8_t* __go_new_channel(uint8_t*, uint8_t*, uint64_t);
void __go_print_int64(uint8_t*, uint64_t);
void __go_print_string(uint8_t*, uint8_t*, uint64_t);
void __go_receive(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
void __go_send_big(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
uint64_t __go_type_hash_identity(uint8_t*, uint64_t);
uint8_t __go_type_equal_identity(uint8_t*, uint8_t*, uint64_t);
void main_OC_Filter(uint8_t*, uint8_t*, uint8_t*, uint64_t);
void main_OC_Generate(uint8_t*, uint8_t*);
void main_OC_Sieve(uint8_t*);
static void tmp__23(uint8_t*);
static void tmp__25(uint8_t*);
void main_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
uint64_t __go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint64_t __go_type_hash_S0_CN3_intsee(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_equal_S0_CN3_intsee(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
void __go_init_main(uint8_t*);


/* Global Variable Definitions and Initialization */
uint8_t* main_OC_Filter_EC_descriptor = ((uint8_t*)main_OC_Filter);
struct l_struct_chanType __go_td_CN3_intre __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), 1610653375u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN3_intre_EC_gc)), (&tmp__59), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_int), UINT64_C(1) };
struct l_struct_chanType __go_td_CN3_intse __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), 1610653367u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN3_intse_EC_gc)), (&tmp__60), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_int), UINT64_C(2) };
uint8_t* main_OC_Generate_EC_descriptor = ((uint8_t*)main_OC_Generate);
uint8_t* main_OC_Sieve_EC_descriptor = ((uint8_t*)main_OC_Sieve);
struct l_struct_chanType __go_td_CN3_intsre __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), 1610653383u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN3_intsre_EC_gc)), (&tmp__61), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_int), UINT64_C(3) };
struct l_struct_structType __go_td_S0_CN3_intsee __attribute__((common)) = { { 25, 8, 8, UINT64_C(8), 2147646184u, (&__go_type_hash_S0_CN3_intsee_descriptor), (&__go_type_equal_S0_CN3_intsee_descriptor), ((uint8_t*)(&__go_td_S0_CN3_intsee_EC_gc)), (&tmp__62), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS0_CN3_intsee.field0)) }, { ((&tmp__63.array[((int32_t)0)])), UINT64_C(1), UINT64_C(1) } };
static struct l_array_1_uint8_t tmp__24 = { { 10 } };
struct l_struct_structType __go_td_S0_CN3_intre0_CN3_intse0_N3_inte __attribute__((common)) = { { 25, 8, 8, UINT64_C(24), 202306952, (&__go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor), (&__go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor), ((uint8_t*)(&__go_td_S0_CN3_intre0_CN3_intse0_N3_inte_EC_gc)), (&tmp__64), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS0_CN3_intre0_CN3_intse0_N3_inte.field0)) }, { ((&tmp__65.array[((int32_t)0)])), UINT64_C(3), UINT64_C(3) } };
uint8_t* main_OC__OC_import_EC_descriptor = ((uint8_t*)main_OC__OC_import);
static bool init_EC_guard;
uint8_t* main_OC_main_EC_descriptor = ((uint8_t*)main_OC_main);
static struct l_array_10_uint8_t tmp__66 = { { 60, 45, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u } };
static struct l_unnamed_1 tmp__59 = { ((&tmp__66.array[((int32_t)0)])), UINT64_C(10) };
struct l_struct_commonType __go_tdn_int __attribute__((common)) = { 130u, 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__67), (&tmp__68), ((struct l_struct_commonType*)/*NULL*/0) };
struct l_array_5_uint8_t_KC_ __go_td_CN3_intre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_8_uint8_t tmp__69 = { { 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u } };
static struct l_unnamed_1 tmp__61 = { ((&tmp__69.array[((int32_t)0)])), UINT64_C(8) };
struct l_array_5_uint8_t_KC_ __go_td_CN3_intsre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_10_uint8_t tmp__70 = { { 99u, 104u, 97u, 110u, 60, 45, 32, 105u, 110u, 116u } };
static struct l_unnamed_1 tmp__60 = { ((&tmp__70.array[((int32_t)0)])), UINT64_C(10) };
struct l_array_5_uint8_t_KC_ __go_td_CN3_intse_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intse.field0.field0)), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte) };
struct l_struct_funcVal __go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte) };
static struct l_array_38_uint8_t tmp__71 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 60, 45, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 60, 45, 32, 105u, 110u, 116u, 59, 32, 105u, 110u, 116u, 32, 125u } };
static struct l_unnamed_1 tmp__64 = { ((&tmp__71.array[((int32_t)0)])), UINT64_C(38) };
struct l_struct_ptrType __go_td_pS0_CN3_intre0_CN3_intse0_N3_inte __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), -1058056055, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS0_CN3_intre0_CN3_intse0_N3_inte_EC_gc)), (&tmp__72), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S0_CN3_intre0_CN3_intse0_N3_inte.field0)) };
static struct l_array_3_struct_AC_l_struct_structField tmp__65 = { { { ((struct l_unnamed_1*)/*NULL*/0), ((struct l_unnamed_1*)/*NULL*/0), ((&__go_td_CN3_intre.field0)), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(0) }, { ((struct l_unnamed_1*)/*NULL*/0), ((struct l_unnamed_1*)/*NULL*/0), ((&__go_td_CN3_intse.field0)), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(8) }, { ((struct l_unnamed_1*)/*NULL*/0), ((struct l_unnamed_1*)/*NULL*/0), (&__go_tdn_int), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(16) } } };
struct l_array_8_uint8_t_KC_ __go_td_S0_CN3_intre0_CN3_intse0_N3_inte_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(24)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intre.field0.field0)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((&__go_td_CN3_intse.field0.field0)), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_S0_CN3_intsee_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_S0_CN3_intsee) };
struct l_struct_funcVal __go_type_equal_S0_CN3_intsee_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_equal_S0_CN3_intsee) };
static struct l_array_21_uint8_t tmp__73 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 60, 45, 32, 105u, 110u, 116u, 32, 125u } };
static struct l_unnamed_1 tmp__62 = { ((&tmp__73.array[((int32_t)0)])), UINT64_C(21) };
struct l_struct_ptrType __go_td_pS0_CN3_intsee __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 2600585, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS0_CN3_intsee_EC_gc)), (&tmp__74), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S0_CN3_intsee.field0)) };
static struct l_array_1_struct_AC_l_struct_structField tmp__63 = { { { ((struct l_unnamed_1*)/*NULL*/0), ((struct l_unnamed_1*)/*NULL*/0), ((&__go_td_CN3_intse.field0)), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(0) } } };
struct l_array_5_uint8_t_KC_ __go_td_S0_CN3_intsee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intse.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_39_uint8_t tmp__75 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 60, 45, 99u, 104u, 97u, 110u, 32, 105u, 110u, 116u, 59, 32, 99u, 104u, 97u, 110u, 60, 45, 32, 105u, 110u, 116u, 59, 32, 105u, 110u, 116u, 32, 125u } };
static struct l_unnamed_1 tmp__72 = { ((&tmp__75.array[((int32_t)0)])), UINT64_C(39) };
struct l_array_5_uint8_t_KC_ __go_td_pS0_CN3_intre0_CN3_intse0_N3_inte_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S0_CN3_intre0_CN3_intse0_N3_inte_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_22_uint8_t tmp__76 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 99u, 104u, 97u, 110u, 60, 45, 32, 105u, 110u, 116u, 32, 125u } };
static struct l_unnamed_1 tmp__74 = { ((&tmp__76.array[((int32_t)0)])), UINT64_C(22) };
struct l_array_5_uint8_t_KC_ __go_td_pS0_CN3_intsee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S0_CN3_intsee_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_3_uint8_t tmp__77 = { { 105u, 110u, 116u } };
static struct l_unnamed_1 tmp__67 = { ((&tmp__77.array[((int32_t)0)])), UINT64_C(3) };
static struct l_array_3_uint8_t tmp__78 = { { 105u, 110u, 116u } };
static struct l_unnamed_1 tmp__79 = { ((&tmp__78.array[((int32_t)0)])), UINT64_C(3) };
static struct l_struct_uncommonType tmp__68 = { (&tmp__79), ((struct l_unnamed_1*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_int_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0) } };


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
static __forceinline uint64_t llvm_srem_u64(int64_t a, int64_t b) {
  uint64_t r = a % b;
  return r;
}
static __forceinline uint8_t llvm_xor_u8(uint8_t a, uint8_t b) {
  uint8_t r = a ^ b;
  return r;
}
static __forceinline struct l_unnamed_1 llvm_ctor_unnamed_1(uint8_t* x0, uint64_t x1) {
  struct l_unnamed_1 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}


/* Function Bodies */

void main_OC_Filter(uint8_t* llvm_cbe_tmp__1, uint8_t* llvm_cbe_tmp__2, uint8_t* llvm_cbe_tmp__3, uint64_t llvm_cbe_tmp__4) {
  uint64_t llvm_cbe_tmp__5;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__6;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__7;

  goto llvm_cbe__2e_1_2e_for_2e_body;

  do {     /* Syntactic loop '.1.for.body' to make GCC happy */
llvm_cbe__2e_1_2e_for_2e_body:
  __go_receive(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intre.field0.field0)), llvm_cbe_tmp__2, (((uint8_t*)(&llvm_cbe_tmp__5))));
  llvm_cbe_tmp__7 = llvm_cbe_tmp__5;
  if ((((((bool)(llvm_xor_u8((((uint8_t)(bool)((((llvm_srem_u64(llvm_cbe_tmp__7, llvm_cbe_tmp__4)) == UINT64_C(0))&1)))), 1))&1u))&1))) {
    goto llvm_cbe__2e_2_2e_if_2e_then;
  } else {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  }

llvm_cbe__2e_2_2e_if_2e_then:
  llvm_cbe_tmp__6 = llvm_cbe_tmp__7;
  __go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intse.field0.field0)), llvm_cbe_tmp__3, (((uint8_t*)(&llvm_cbe_tmp__6))));
  goto llvm_cbe__2e_1_2e_for_2e_body;

  } while (1); /* end of syntactic loop '.1.for.body' */
}


void main_OC_Generate(uint8_t* llvm_cbe_tmp__8, uint8_t* llvm_cbe_tmp__9) {
  uint64_t llvm_cbe_tmp__10;    /* Address-exposed local */
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(2);   /* for PHI node */
  goto llvm_cbe__2e_1_2e_for_2e_body;

  do {     /* Syntactic loop '.1.for.body' to make GCC happy */
llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_tmp__10 = llvm_cbe_i;
  __go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intse.field0.field0)), llvm_cbe_tmp__9, (((uint8_t*)(&llvm_cbe_tmp__10))));
  llvm_cbe_i__PHI_TEMPORARY = (llvm_add_u64(llvm_cbe_i, UINT64_C(1)));   /* for PHI node */
  goto llvm_cbe__2e_1_2e_for_2e_body;

  } while (1); /* end of syntactic loop '.1.for.body' */
}


void main_OC_Sieve(uint8_t* llvm_cbe_tmp__11) {
  uint64_t llvm_cbe_tmp__12;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__13;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__14;
  uint8_t* llvm_cbe_tmp__15;
  uint8_t* llvm_cbe_tmp__16;
  struct l_unnamed_2* llvm_cbe_tmp__17;
  uint8_t* llvm_cbe_ch;
  uint8_t* llvm_cbe_ch__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__18;
  uint8_t* llvm_cbe_tmp__19;
  uint64_t llvm_cbe_tmp__20;
  uint8_t* llvm_cbe_tmp__21;
  struct l_unnamed_3* llvm_cbe_tmp__22;

  llvm_cbe_tmp__14 = __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), UINT64_C(0));
  llvm_cbe_tmp__15 = __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), UINT64_C(0));
  llvm_cbe_tmp__16 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intsee.field0.field0)), UINT64_C(8));
  llvm_cbe_tmp__17 = ((struct l_unnamed_2*)llvm_cbe_tmp__16);
  *((&llvm_cbe_tmp__17->field0)) = llvm_cbe_tmp__14;
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__23), (((uint8_t*)llvm_cbe_tmp__17)));
  llvm_cbe_ch__PHI_TEMPORARY = llvm_cbe_tmp__14;   /* for PHI node */
  goto llvm_cbe__2e_1_2e_for_2e_body;

  do {     /* Syntactic loop '.1.for.body' to make GCC happy */
llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_ch = llvm_cbe_ch__PHI_TEMPORARY;
  __go_receive(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_ch, (((uint8_t*)(&llvm_cbe_tmp__12))));
  llvm_cbe_tmp__18 = llvm_cbe_tmp__12;
  __go_print_int64(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__18);
  llvm_cbe_tmp__13 = llvm_ctor_unnamed_1(((&tmp__24.array[((int32_t)0)])), UINT64_C(1));
  llvm_cbe_tmp__19 = *((&llvm_cbe_tmp__13.field0));
  llvm_cbe_tmp__20 = *((&llvm_cbe_tmp__13.field1));
  __go_print_string(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__19, llvm_cbe_tmp__20);
  llvm_cbe_tmp__21 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_CN3_intre0_CN3_intse0_N3_inte.field0.field0)), UINT64_C(24));
  llvm_cbe_tmp__22 = ((struct l_unnamed_3*)llvm_cbe_tmp__21);
  *((&llvm_cbe_tmp__22->field0)) = llvm_cbe_ch;
  *((&llvm_cbe_tmp__22->field1)) = llvm_cbe_tmp__15;
  *((&llvm_cbe_tmp__22->field2)) = llvm_cbe_tmp__18;
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__25), (((uint8_t*)llvm_cbe_tmp__22)));
  llvm_cbe_ch__PHI_TEMPORARY = llvm_cbe_tmp__15;   /* for PHI node */
  goto llvm_cbe__2e_1_2e_for_2e_body;

  } while (1); /* end of syntactic loop '.1.for.body' */
}


static void tmp__23(uint8_t* llvm_cbe_tmp__26) {
  uint8_t* llvm_cbe_tmp__27;

  llvm_cbe_tmp__27 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__26))->field0));
  main_OC_Generate(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__27);
}


static void tmp__25(uint8_t* llvm_cbe_tmp__28) {
  struct l_unnamed_3* llvm_cbe_tmp__29;
  uint8_t* llvm_cbe_tmp__30;
  uint8_t* llvm_cbe_tmp__31;
  uint64_t llvm_cbe_tmp__32;

  llvm_cbe_tmp__29 = ((struct l_unnamed_3*)llvm_cbe_tmp__28);
  llvm_cbe_tmp__30 = *((&llvm_cbe_tmp__29->field0));
  llvm_cbe_tmp__31 = *((&llvm_cbe_tmp__29->field1));
  llvm_cbe_tmp__32 = *((&llvm_cbe_tmp__29->field2));
  main_OC_Filter(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__30, llvm_cbe_tmp__31, llvm_cbe_tmp__32);
}


void main_OC__OC_import(uint8_t* llvm_cbe_tmp__33) {
  bool llvm_cbe_tmp__34;

  llvm_cbe_tmp__34 = ((init_EC_guard)&1);
  if (llvm_cbe_tmp__34) {
    goto llvm_cbe__2e_0_2e_entry;
  } else {
    goto llvm_cbe_tmp__35;
  }

llvm_cbe__2e_0_2e_entry:
  return;
llvm_cbe_tmp__35:
  init_EC_guard = ((1) & 1);
  goto llvm_cbe__2e_0_2e_entry;

}


void main_OC_main(uint8_t* llvm_cbe_tmp__36) {
  main_OC_Sieve(/*UNDEF*/((uint8_t*)/*NULL*/0));
}


uint64_t __go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte(uint8_t* llvm_cbe_tmp__37, uint64_t llvm_cbe_tmp__38) {
  struct l_unnamed_3* llvm_cbe_tmp__39;
  uint64_t llvm_cbe_tmp__40;
  uint64_t llvm_cbe_tmp__41;
  uint64_t llvm_cbe_tmp__42;

  llvm_cbe_tmp__39 = ((struct l_unnamed_3*)llvm_cbe_tmp__37);
  llvm_cbe_tmp__40 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__39->field0)))), UINT64_C(8));
  llvm_cbe_tmp__41 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__39->field1)))), UINT64_C(8));
  llvm_cbe_tmp__42 = __go_type_hash_identity((((uint8_t*)((&llvm_cbe_tmp__39->field2)))), UINT64_C(8));
  return (llvm_add_u64((llvm_mul_u64((llvm_add_u64((llvm_mul_u64((llvm_add_u64(UINT64_C(0), llvm_cbe_tmp__40)), UINT64_C(33))), llvm_cbe_tmp__41)), UINT64_C(33))), llvm_cbe_tmp__42));
}


uint8_t __go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte(uint8_t* llvm_cbe_tmp__43, uint8_t* llvm_cbe_tmp__44, uint64_t llvm_cbe_tmp__45) {
  struct l_unnamed_3* llvm_cbe_tmp__46;
  struct l_unnamed_3* llvm_cbe_tmp__47;
  uint8_t llvm_cbe_tmp__48;
  uint8_t llvm_cbe_tmp__49;
  uint8_t llvm_cbe_tmp__50;

  llvm_cbe_tmp__46 = ((struct l_unnamed_3*)llvm_cbe_tmp__43);
  llvm_cbe_tmp__47 = ((struct l_unnamed_3*)llvm_cbe_tmp__44);
  llvm_cbe_tmp__48 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__46->field0)))), (((uint8_t*)((&llvm_cbe_tmp__47->field0)))), UINT64_C(8));
  if ((((llvm_cbe_tmp__48 == ((uint8_t)0))&1))) {
    goto llvm_cbe_retzero;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_retzero:
  return 0;
llvm_cbe_cont:
  llvm_cbe_tmp__49 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__46->field1)))), (((uint8_t*)((&llvm_cbe_tmp__47->field1)))), UINT64_C(8));
  if ((((llvm_cbe_tmp__49 == ((uint8_t)0))&1))) {
    goto llvm_cbe_retzero;
  } else {
    goto llvm_cbe_cont1;
  }

llvm_cbe_cont1:
  llvm_cbe_tmp__50 = __go_type_equal_identity((((uint8_t*)((&llvm_cbe_tmp__46->field2)))), (((uint8_t*)((&llvm_cbe_tmp__47->field2)))), UINT64_C(8));
  return (llvm_select_u8((((llvm_cbe_tmp__50 == ((uint8_t)0))&1)), 0, 1));
}


uint64_t __go_type_hash_S0_CN3_intsee(uint8_t* llvm_cbe_tmp__51, uint64_t llvm_cbe_tmp__52) {
  uint64_t llvm_cbe_tmp__53;

  llvm_cbe_tmp__53 = __go_type_hash_identity((((uint8_t*)((&(((struct l_unnamed_2*)llvm_cbe_tmp__51))->field0)))), UINT64_C(8));
  return (llvm_add_u64(UINT64_C(0), llvm_cbe_tmp__53));
}


uint8_t __go_type_equal_S0_CN3_intsee(uint8_t* llvm_cbe_tmp__54, uint8_t* llvm_cbe_tmp__55, uint64_t llvm_cbe_tmp__56) {
  uint8_t llvm_cbe_tmp__57;

  llvm_cbe_tmp__57 = __go_type_equal_identity((((uint8_t*)((&(((struct l_unnamed_2*)llvm_cbe_tmp__54))->field0)))), (((uint8_t*)((&(((struct l_unnamed_2*)llvm_cbe_tmp__55))->field0)))), UINT64_C(8));
  return (llvm_select_u8((((llvm_cbe_tmp__57 == ((uint8_t)0))&1)), 0, 1));
}


void __go_init_main(uint8_t* llvm_cbe_tmp__58) {
  main_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
}

