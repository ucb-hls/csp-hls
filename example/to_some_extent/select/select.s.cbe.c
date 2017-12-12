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
struct l_struct_arrayType;
struct l_struct_imethod;
struct l_struct_imethodSlice;
struct l_struct_interfaceType;
struct l_struct_sliceType;
struct l_struct_ptrType;
struct l_struct_typeSlice;
struct l_struct_funcType;
struct l_unnamed_2;
struct l_unnamed_4;
struct l_unnamed_3;
struct l_unnamed_5;
typedef void l_fptr_2(void);

/* Types Definitions */
struct l_struct_funcVal {
  l_fptr_2* field0;
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
struct l_struct_arrayType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
  struct l_struct_commonType* field2;
  uint64_t field3;
};
struct l_struct_imethod {
  struct l_unnamed_1* field0;
  struct l_unnamed_1* field1;
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
struct l_struct_typeSlice {
  struct l_struct_commonType** field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_struct_funcType {
  struct l_struct_commonType field0;
  uint8_t field1;
  struct l_struct_typeSlice field2;
  struct l_struct_typeSlice field3;
};
struct l_array_5_uint8_t_KC_ {
  uint8_t* array[5];
};
struct l_array_7_uint8_t_KC_ {
  uint8_t* array[7];
};
struct l_array_2_struct_AC_l_struct_structField {
  struct l_struct_structField array[2];
};
struct l_array_4_uint8_t_KC_ {
  uint8_t* array[4];
};
struct l_array_1_struct_AC_l_struct_structField {
  struct l_struct_structField array[1];
};
struct l_array_9_uint8_t_KC_ {
  uint8_t* array[9];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_35_uint8_t {
  uint8_t array[35];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_36_uint8_t {
  uint8_t array[36];
};
struct l_array_18_uint8_t {
  uint8_t array[18];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_unnamed_2 {
  uint8_t* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_unnamed_4 {
  uint8_t* field0;
  uint8_t* field1;
};
struct l_unnamed_3 {
  uint64_t field0;
  struct l_unnamed_4 field1;
};
struct l_unnamed_5 {
  uint8_t* field0;
};
struct l_array_2_struct_AC_l_unnamed_4 {
  struct l_unnamed_4 array[2];
};

/* Function definitions */


typedef void l_fptr_1(uint8_t*);

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
uint8_t* runtime_OC_newselect(uint8_t*, uint32_t);
__noreturn void __go_panic(uint8_t*, uint8_t*, uint8_t*);
__noreturn void __go_runtime_error(uint8_t*, uint32_t);
uint64_t runtime_OC_selectgo(uint8_t*, uint8_t*);
void runtime_OC_selectrecv2(uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t);
void __go_send_big(uint8_t*, uint8_t*, uint8_t*, uint8_t*);
uint64_t __go_type_hash_empty_interface(uint8_t*, uint64_t);
uint8_t __go_type_equal_empty_interface(uint8_t*, uint8_t*, uint64_t);
void main_OC__OC_import(uint8_t*);
void time_OC__OC_import(uint8_t*);
void fmt_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_1(uint8_t*);
static void tmp__71(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_2(uint8_t*);
static void tmp__72(uint8_t*);
struct l_unnamed_3 fmt_OC_Println(uint8_t*, struct l_unnamed_2);
void time_OC_Sleep(uint8_t*, uint64_t);
uint64_t __go_type_hash_AIe2e(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_hash_AIe2e_OC_1(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
void __go_init_main(uint8_t*);


/* Global Variable Definitions and Initialization */
uint8_t* main_OC__OC_import_EC_descriptor = ((uint8_t*)main_OC__OC_import);
static bool init_EC_guard;
uint8_t* main_OC_main_EC_descriptor = ((uint8_t*)main_OC_main);
struct l_struct_chanType __go_td_CN6_stringsre __attribute__((common)) = { { 18, 8, 8, UINT64_C(8), -1073652185, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_CN6_stringsre_EC_gc)), (&tmp__113), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, (&__go_tdn_string), UINT64_C(3) };
struct l_struct_structType __go_td_S1__Fe1__pCN6_stringsree __attribute__((common)) = { { 25, 8, 8, UINT64_C(16), 5737008, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_S1__Fe1__pCN6_stringsree_EC_gc)), (&tmp__114), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS1__Fe1__pCN6_stringsree.field0)) }, { ((&tmp__115.array[((int32_t)0)])), UINT64_C(2), UINT64_C(2) } };
struct l_struct_structType __go_td_S0_Fee __attribute__((common)) = { { 25, 8, 8, UINT64_C(8), 44, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_S0_Fee_EC_gc)), (&tmp__116), ((struct l_struct_uncommonType*)/*NULL*/0), ((&__go_td_pS0_Fee.field0)) }, { ((&tmp__117.array[((int32_t)0)])), UINT64_C(1), UINT64_C(1) } };
struct l_struct_arrayType __go_td_AIe2e __attribute__((common)) = { { 17, 8, 8, UINT64_C(32), 30, (&__go_type_hash_AIe2e_descriptor), (&__go_type_hash_AIe2e_descriptor_OC_2), ((uint8_t*)(&__go_td_AIe2e_EC_gc)), (&tmp__118), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)), ((&__go_td_AIee.field0)), UINT64_C(2) };
static struct l_array_8_uint8_t tmp__74 = { { 114u, 101u, 99u, 101u, 105u, 118u, 101u, 100u } };
struct l_struct_commonType __go_tdn_string __attribute__((common)) = { 24, 8, 8, UINT64_C(16), 100666096, (&__go_type_hash_string_descriptor), (&__go_type_equal_string_descriptor), ((uint8_t*)(&__go_tdn_string_EC_gc)), (&tmp__119), (&tmp__120), ((struct l_struct_commonType*)/*NULL*/0) };
static struct l_array_8_uint8_t tmp__73 = { { 114u, 101u, 99u, 101u, 105u, 118u, 101u, 100u } };
static struct l_array_31_uint8_t tmp__75 = { { 98u, 108u, 111u, 99u, 107u, 105u, 110u, 103u, 32, 115u, 101u, 108u, 101u, 99u, 116u, 32, 109u, 97u, 116u, 99u, 104u, 101u, 100u, 32, 110u, 111u, 32, 99u, 97u, 115u, 101u } };
static struct l_array_3_uint8_t tmp__82 = { { 111u, 110u, 101u } };
static struct l_array_3_uint8_t tmp__92 = { { 116u, 119u, 111u } };
struct l_struct_funcVal __go_type_hash_AIe2e_descriptor __attribute__((common)) = { ((l_fptr_2*)__go_type_hash_AIe2e) };
struct l_struct_funcVal __go_type_hash_AIe2e_descriptor_OC_2 __attribute__((common)) = { ((l_fptr_2*)__go_type_hash_AIe2e_OC_1) };
static struct l_array_15_uint8_t tmp__121 = { { 91u, 50, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_1 tmp__118 = { ((&tmp__121.array[((int32_t)0)])), UINT64_C(15) };
struct l_struct_interfaceType __go_td_Ie __attribute__((common)) = { { 20, 8, 8, UINT64_C(16), 16, (&__go_type_hash_empty_interface_descriptor), (&__go_type_equal_empty_interface_descriptor), ((uint8_t*)(&__go_td_Ie_EC_gc)), (&tmp__122), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, { ((struct l_struct_imethod*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_struct_sliceType __go_td_AIee __attribute__((common)) = { { 23, 8, 8, UINT64_C(24), 30, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_AIee_EC_gc)), (&tmp__123), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_Ie.field0)) };
struct l_array_9_uint8_t_KC_ __go_td_AIe2e_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(32)), ((uint8_t*)(uintptr_t)UINT64_C(3)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(2)), ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(4)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_11_uint8_t tmp__124 = { { 99u, 104u, 97u, 110u, 32, 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_1 tmp__113 = { ((&tmp__124.array[((int32_t)0)])), UINT64_C(11) };
struct l_array_5_uint8_t_KC_ __go_td_CN6_stringsre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(6)), ((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_6_uint8_t tmp__125 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_1 tmp__119 = { ((&tmp__125.array[((int32_t)0)])), UINT64_C(6) };
static struct l_array_6_uint8_t tmp__126 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_1 tmp__127 = { ((&tmp__126.array[((int32_t)0)])), UINT64_C(6) };
static struct l_struct_uncommonType tmp__120 = { (&tmp__127), ((struct l_unnamed_1*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_4_uint8_t_KC_ __go_tdn_string_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(7)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };
static struct l_array_35_uint8_t tmp__128 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 95u, 32, 102u, 117u, 110u, 99u, 40, 41, 59, 32, 95u, 32, 42, 99u, 104u, 97u, 110u, 32, 115u, 116u, 114u, 105u, 110u, 103u, 32, 125u } };
static struct l_unnamed_1 tmp__114 = { ((&tmp__128.array[((int32_t)0)])), UINT64_C(35) };
struct l_struct_ptrType __go_td_pS1__Fe1__pCN6_stringsree __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 91792137, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS1__Fe1__pCN6_stringsree_EC_gc)), (&tmp__129), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S1__Fe1__pCN6_stringsree.field0)) };
static struct l_array_1_uint8_t tmp__130 = { { 95u } };
static struct l_unnamed_1 tmp__131 = { ((&tmp__130.array[((int32_t)0)])), UINT64_C(1) };
struct l_struct_funcType __go_td_Fe __attribute__((common)) = { { 19, 8, 8, UINT64_C(8), 8, (&__go_type_hash_error_descriptor), (&__go_type_equal_error_descriptor), ((uint8_t*)(&__go_td_Fe_EC_gc)), (&tmp__132), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, 0, { ((struct l_struct_commonType**)/*NULL*/0), UINT64_C(0), UINT64_C(0) }, { ((struct l_struct_commonType**)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
static struct l_array_1_uint8_t tmp__133 = { { 95u } };
static struct l_unnamed_1 tmp__134 = { ((&tmp__133.array[((int32_t)0)])), UINT64_C(1) };
struct l_struct_ptrType __go_td_pCN6_stringsre __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 1434233, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pCN6_stringsre_EC_gc)), (&tmp__135), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_CN6_stringsre.field0)) };
static struct l_array_2_struct_AC_l_struct_structField tmp__115 = { { { (&tmp__131), ((struct l_unnamed_1*)/*NULL*/0), ((&__go_td_Fe.field0)), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(0) }, { (&tmp__134), ((struct l_unnamed_1*)/*NULL*/0), ((&__go_td_pCN6_stringsre.field0)), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(8) } } };
struct l_array_7_uint8_t_KC_ __go_td_S1__Fe1__pCN6_stringsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(2)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(&__go_td_CN6_stringsre_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_17_uint8_t tmp__136 = { { 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 102u, 117u, 110u, 99u, 40, 41, 32, 125u } };
static struct l_unnamed_1 tmp__116 = { ((&tmp__136.array[((int32_t)0)])), UINT64_C(17) };
struct l_struct_ptrType __go_td_pS0_Fee __attribute__((common)) = { { 54, 8, 8, UINT64_C(8), 713, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pS0_Fee_EC_gc)), (&tmp__137), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_td_S0_Fee.field0)) };
static struct l_array_1_struct_AC_l_struct_structField tmp__117 = { { { ((struct l_unnamed_1*)/*NULL*/0), ((struct l_unnamed_1*)/*NULL*/0), ((&__go_td_Fe.field0)), ((struct l_unnamed_1*)/*NULL*/0), UINT64_C(0) } } };
struct l_array_4_uint8_t_KC_ __go_td_S0_Fee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(2)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };
static struct l_array_12_uint8_t tmp__138 = { { 42, 99u, 104u, 97u, 110u, 32, 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_1 tmp__135 = { ((&tmp__138.array[((int32_t)0)])), UINT64_C(12) };
struct l_array_5_uint8_t_KC_ __go_td_pCN6_stringsre_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_CN6_stringsre_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_36_uint8_t tmp__139 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 95u, 32, 102u, 117u, 110u, 99u, 40, 41, 59, 32, 95u, 32, 42, 99u, 104u, 97u, 110u, 32, 115u, 116u, 114u, 105u, 110u, 103u, 32, 125u } };
static struct l_unnamed_1 tmp__129 = { ((&tmp__139.array[((int32_t)0)])), UINT64_C(36) };
struct l_array_5_uint8_t_KC_ __go_td_pS1__Fe1__pCN6_stringsree_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S1__Fe1__pCN6_stringsree_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_18_uint8_t tmp__140 = { { 42, 115u, 116u, 114u, 117u, 99u, 116u, 32, 123u, 32, 102u, 117u, 110u, 99u, 40, 41, 32, 125u } };
static struct l_unnamed_1 tmp__137 = { ((&tmp__140.array[((int32_t)0)])), UINT64_C(18) };
struct l_array_5_uint8_t_KC_ __go_td_pS0_Fee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_S0_Fee_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_14_uint8_t tmp__141 = { { 91u, 93u, 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_1 tmp__123 = { ((&tmp__141.array[((int32_t)0)])), UINT64_C(14) };
struct l_array_5_uint8_t_KC_ __go_td_AIee_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(24)), ((uint8_t*)(uintptr_t)UINT64_C(10)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_td_Ie_EC_gc)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_6_uint8_t tmp__142 = { { 102u, 117u, 110u, 99u, 40, 41 } };
static struct l_unnamed_1 tmp__132 = { ((&tmp__142.array[((int32_t)0)])), UINT64_C(6) };
struct l_array_4_uint8_t_KC_ __go_td_Fe_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(2)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };
static struct l_array_12_uint8_t tmp__143 = { { 105u, 110u, 116u, 101u, 114u, 102u, 97u, 99u, 101u, 32, 123u, 125u } };
static struct l_unnamed_1 tmp__122 = { ((&tmp__143.array[((int32_t)0)])), UINT64_C(12) };
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
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline struct l_unnamed_1 llvm_ctor_unnamed_1(uint8_t* x0, uint64_t x1) {
  struct l_unnamed_1 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_2 llvm_ctor_unnamed_2(uint8_t* x0, uint64_t x1, uint64_t x2) {
  struct l_unnamed_2 r;
  r.field0 = x0;
  r.field1 = x1;
  r.field2 = x2;
  return r;
}
static __forceinline struct l_unnamed_4 llvm_ctor_unnamed_4(uint8_t* x0, uint8_t* x1) {
  struct l_unnamed_4 r;
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
  time_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  fmt_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  goto llvm_cbe__2e_0_2e_entry;

}


void main_OC_main(uint8_t* llvm_cbe_tmp__4) {
  struct l_unnamed_1 llvm_cbe_tmp__5;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__6;    /* Address-exposed local */
  uint8_t llvm_cbe_tmp__7;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_tmp__8;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_tmp__9;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__10;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__11;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__12;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__13;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__14;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__15;
  uint8_t* llvm_cbe_tmp__16;
  uint8_t* llvm_cbe_tmp__17;
  uint8_t* llvm_cbe_tmp__18;
  uint8_t* llvm_cbe_tmp__19;
  uint8_t* llvm_cbe_tmp__20;
  uint8_t* llvm_cbe_tmp__21;
  struct l_unnamed_4* llvm_cbe_tmp__22;
  uint8_t* llvm_cbe_tmp__23;
  struct l_unnamed_5* llvm_cbe_tmp__24;
  uint8_t* llvm_cbe_tmp__25;
  struct l_unnamed_4* llvm_cbe_tmp__26;
  uint8_t* llvm_cbe_tmp__27;
  struct l_unnamed_5* llvm_cbe_tmp__28;
  uint8_t* llvm_cbe_tmp__29;
  uint8_t* llvm_cbe_tmp__30;
  uint8_t* llvm_cbe_tmp__31;
  uint8_t* llvm_cbe_tmp__32;
  uint8_t* llvm_cbe_tmp__33;
  uint64_t llvm_cbe_tmp__34;
  uint8_t llvm_cbe_tmp__35;
  struct l_unnamed_1 llvm_cbe_tmp__36;
  struct l_unnamed_1 llvm_cbe_tmp__37;
  uint8_t llvm_cbe_tmp__38;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_msg1;
  struct l_unnamed_1 llvm_cbe_msg1__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_msg2;
  struct l_unnamed_1 llvm_cbe_msg2__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_msg11;
  struct l_unnamed_1 llvm_cbe_msg11__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_msg22;
  struct l_unnamed_1 llvm_cbe_msg22__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__39;
  uint8_t* llvm_cbe_tmp__40;
  uint8_t* llvm_cbe_tmp__41;
  uint8_t* llvm_cbe_tmp__42;
  struct l_unnamed_1* llvm_cbe_tmp__43;
  struct l_unnamed_4 llvm_cbe_tmp__44;
  uint8_t* llvm_cbe_tmp__45;
  struct l_unnamed_1* llvm_cbe_tmp__46;
  struct l_unnamed_4 llvm_cbe_tmp__47;
  struct l_unnamed_2 llvm_cbe_tmp__48;
  struct l_unnamed_2 llvm_cbe_tmp__49;
  struct l_unnamed_2 llvm_cbe_tmp__50;
  uint64_t llvm_cbe_tmp__51;
  struct l_unnamed_4 llvm_cbe_tmp__52;
  uint8_t* llvm_cbe_tmp__53;
  uint8_t* llvm_cbe_tmp__54;
  uint8_t* llvm_cbe_tmp__55;
  struct l_unnamed_1* llvm_cbe_tmp__56;
  struct l_unnamed_4 llvm_cbe_tmp__57;
  uint8_t* llvm_cbe_tmp__58;
  struct l_unnamed_1* llvm_cbe_tmp__59;
  struct l_unnamed_4 llvm_cbe_tmp__60;
  struct l_unnamed_2 llvm_cbe_tmp__61;
  struct l_unnamed_2 llvm_cbe_tmp__62;
  struct l_unnamed_2 llvm_cbe_tmp__63;
  uint64_t llvm_cbe_tmp__64;
  struct l_unnamed_4 llvm_cbe_tmp__65;
  uint8_t* llvm_cbe_tmp__66;
  struct l_unnamed_1* llvm_cbe_tmp__67;
  struct l_unnamed_4 llvm_cbe_tmp__68;
  uint8_t* llvm_cbe_tmp__69;
  uint8_t* llvm_cbe_tmp__70;

  llvm_cbe_tmp__15 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), UINT64_C(8));
  llvm_cbe_tmp__16 = ((uint8_t*)(((uint8_t**)llvm_cbe_tmp__15)));
  llvm_cbe_tmp__17 = __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), UINT64_C(0));
  *(((uint8_t**)llvm_cbe_tmp__16)) = llvm_cbe_tmp__17;
  llvm_cbe_tmp__18 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), UINT64_C(8));
  llvm_cbe_tmp__19 = ((uint8_t*)(((uint8_t**)llvm_cbe_tmp__18)));
  llvm_cbe_tmp__20 = __go_new_channel(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), UINT64_C(0));
  *(((uint8_t**)llvm_cbe_tmp__19)) = llvm_cbe_tmp__20;
  llvm_cbe_tmp__21 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S1__Fe1__pCN6_stringsree.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__22 = ((struct l_unnamed_4*)llvm_cbe_tmp__21);
  *((&llvm_cbe_tmp__22->field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_1);
  *((&llvm_cbe_tmp__22->field1)) = llvm_cbe_tmp__16;
  llvm_cbe_tmp__23 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_Fee.field0.field0)), UINT64_C(8));
  llvm_cbe_tmp__24 = ((struct l_unnamed_5*)llvm_cbe_tmp__23);
  *((&llvm_cbe_tmp__24->field0)) = (((uint8_t*)llvm_cbe_tmp__22));
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__71), (((uint8_t*)llvm_cbe_tmp__24)));
  llvm_cbe_tmp__25 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S1__Fe1__pCN6_stringsree.field0.field0)), UINT64_C(16));
  llvm_cbe_tmp__26 = ((struct l_unnamed_4*)llvm_cbe_tmp__25);
  *((&llvm_cbe_tmp__26->field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_2);
  *((&llvm_cbe_tmp__26->field1)) = llvm_cbe_tmp__19;
  llvm_cbe_tmp__27 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_Fee.field0.field0)), UINT64_C(8));
  llvm_cbe_tmp__28 = ((struct l_unnamed_5*)llvm_cbe_tmp__27);
  *((&llvm_cbe_tmp__28->field0)) = (((uint8_t*)llvm_cbe_tmp__26));
  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__72), (((uint8_t*)llvm_cbe_tmp__28)));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_msg1__PHI_TEMPORARY = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0));   /* for PHI node */
  llvm_cbe_msg2__PHI_TEMPORARY = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0));   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done:
  return;
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_msg1 = llvm_cbe_msg1__PHI_TEMPORARY;
  llvm_cbe_msg2 = llvm_cbe_msg2__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(2)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_tmp__29 = *(((uint8_t**)llvm_cbe_tmp__16));
  llvm_cbe_tmp__30 = *(((uint8_t**)llvm_cbe_tmp__19));
  llvm_cbe_tmp__31 = runtime_OC_newselect(/*UNDEF*/((uint8_t*)/*NULL*/0), 2);
  llvm_cbe_tmp__8 = (&llvm_cbe_tmp__5);
  llvm_cbe_tmp__32 = *(((uint8_t**)(&llvm_cbe_tmp__8)));
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__31, llvm_cbe_tmp__29, llvm_cbe_tmp__32, (&llvm_cbe_tmp__7), 0);
  llvm_cbe_tmp__9 = (&llvm_cbe_tmp__6);
  llvm_cbe_tmp__33 = *(((uint8_t**)(&llvm_cbe_tmp__9)));
  runtime_OC_selectrecv2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__31, llvm_cbe_tmp__30, llvm_cbe_tmp__33, (&llvm_cbe_tmp__7), 1);
  llvm_cbe_tmp__34 = runtime_OC_selectgo(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__31);
  llvm_cbe_tmp__35 = llvm_cbe_tmp__7;
  llvm_cbe_tmp__36 = llvm_cbe_tmp__5;
  llvm_cbe_tmp__37 = llvm_cbe_tmp__6;
  llvm_cbe_tmp__38 = ((uint8_t)(bool)(((llvm_cbe_tmp__34 == UINT64_C(0))&1)));
  switch (llvm_cbe_tmp__34) {
  default:
    goto llvm_cbe__2e_8_2e_select_2e_next;
  case UINT64_C(0):
    goto llvm_cbe__2e_5_2e_select_2e_body;
  case UINT64_C(1):
    goto llvm_cbe__2e_7_2e_select_2e_body;
  }

llvm_cbe__2e_7_2e_select_2e_body:
  llvm_cbe_tmp__53 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe2e.field0.field0)), UINT64_C(32));
  llvm_cbe_tmp__54 = ((uint8_t*)(((struct l_array_2_struct_AC_l_unnamed_4*)llvm_cbe_tmp__53)));
  llvm_cbe_tmp__55 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__56 = ((struct l_unnamed_1*)llvm_cbe_tmp__55);
  *llvm_cbe_tmp__56 = llvm_ctor_unnamed_1(((&tmp__73.array[((int32_t)0)])), UINT64_C(8));
  llvm_cbe_tmp__57 = llvm_ctor_unnamed_4(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__57.field1 = (((uint8_t*)llvm_cbe_tmp__56));
  *(((struct l_unnamed_4*)(((uint8_t*)((&(*(((struct l_unnamed_4*)llvm_cbe_tmp__54))))))))) = llvm_cbe_tmp__57;
  llvm_cbe_tmp__58 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__59 = ((struct l_unnamed_1*)llvm_cbe_tmp__58);
  *llvm_cbe_tmp__59 = llvm_cbe_tmp__37;
  llvm_cbe_tmp__60 = llvm_ctor_unnamed_4(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__60.field1 = (((uint8_t*)llvm_cbe_tmp__59));
  *(((struct l_unnamed_4*)(((uint8_t*)((&(((struct l_unnamed_4*)llvm_cbe_tmp__54))[((int64_t)UINT64_C(1))])))))) = llvm_cbe_tmp__60;
  llvm_cbe_tmp__61 = llvm_ctor_unnamed_2(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__61.field0 = ((&(*llvm_cbe_tmp__54)));
  llvm_cbe_tmp__62 = llvm_cbe_tmp__61;
  llvm_cbe_tmp__62.field1 = UINT64_C(2);
  llvm_cbe_tmp__63 = llvm_cbe_tmp__62;
  llvm_cbe_tmp__63.field2 = UINT64_C(2);
  llvm_cbe_tmp__12 = llvm_cbe_tmp__63;
  llvm_cbe_tmp__13 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__12);
  llvm_cbe_tmp__64 = *((&llvm_cbe_tmp__13.field0));
  llvm_cbe_tmp__65 = *((&llvm_cbe_tmp__13.field1));
  llvm_cbe_msg11__PHI_TEMPORARY = llvm_cbe_msg1;   /* for PHI node */
  llvm_cbe_msg22__PHI_TEMPORARY = llvm_cbe_tmp__37;   /* for PHI node */
  goto llvm_cbe__2e_4_2e_select_2e_done;

llvm_cbe__2e_5_2e_select_2e_body:
  llvm_cbe_tmp__40 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe2e.field0.field0)), UINT64_C(32));
  llvm_cbe_tmp__41 = ((uint8_t*)(((struct l_array_2_struct_AC_l_unnamed_4*)llvm_cbe_tmp__40)));
  llvm_cbe_tmp__42 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__43 = ((struct l_unnamed_1*)llvm_cbe_tmp__42);
  *llvm_cbe_tmp__43 = llvm_ctor_unnamed_1(((&tmp__74.array[((int32_t)0)])), UINT64_C(8));
  llvm_cbe_tmp__44 = llvm_ctor_unnamed_4(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__44.field1 = (((uint8_t*)llvm_cbe_tmp__43));
  *(((struct l_unnamed_4*)(((uint8_t*)((&(*(((struct l_unnamed_4*)llvm_cbe_tmp__41))))))))) = llvm_cbe_tmp__44;
  llvm_cbe_tmp__45 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__46 = ((struct l_unnamed_1*)llvm_cbe_tmp__45);
  *llvm_cbe_tmp__46 = llvm_cbe_tmp__36;
  llvm_cbe_tmp__47 = llvm_ctor_unnamed_4(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__47.field1 = (((uint8_t*)llvm_cbe_tmp__46));
  *(((struct l_unnamed_4*)(((uint8_t*)((&(((struct l_unnamed_4*)llvm_cbe_tmp__41))[((int64_t)UINT64_C(1))])))))) = llvm_cbe_tmp__47;
  llvm_cbe_tmp__48 = llvm_ctor_unnamed_2(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__48.field0 = ((&(*llvm_cbe_tmp__41)));
  llvm_cbe_tmp__49 = llvm_cbe_tmp__48;
  llvm_cbe_tmp__49.field1 = UINT64_C(2);
  llvm_cbe_tmp__50 = llvm_cbe_tmp__49;
  llvm_cbe_tmp__50.field2 = UINT64_C(2);
  llvm_cbe_tmp__10 = llvm_cbe_tmp__50;
  llvm_cbe_tmp__11 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__10);
  llvm_cbe_tmp__51 = *((&llvm_cbe_tmp__11.field0));
  llvm_cbe_tmp__52 = *((&llvm_cbe_tmp__11.field1));
  llvm_cbe_msg11__PHI_TEMPORARY = llvm_cbe_tmp__36;   /* for PHI node */
  llvm_cbe_msg22__PHI_TEMPORARY = llvm_cbe_msg2;   /* for PHI node */
  goto llvm_cbe__2e_4_2e_select_2e_done;

llvm_cbe__2e_4_2e_select_2e_done:
  llvm_cbe_msg11 = llvm_cbe_msg11__PHI_TEMPORARY;
  llvm_cbe_msg22 = llvm_cbe_msg22__PHI_TEMPORARY;
  llvm_cbe_tmp__39 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__39;   /* for PHI node */
  llvm_cbe_msg1__PHI_TEMPORARY = llvm_cbe_msg11;   /* for PHI node */
  llvm_cbe_msg2__PHI_TEMPORARY = llvm_cbe_msg22;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
llvm_cbe__2e_8_2e_select_2e_next:
  llvm_cbe_tmp__66 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_string.field0)), UINT64_C(16));
  llvm_cbe_tmp__67 = ((struct l_unnamed_1*)llvm_cbe_tmp__66);
  *llvm_cbe_tmp__67 = llvm_ctor_unnamed_1(((&tmp__75.array[((int32_t)0)])), UINT64_C(31));
  llvm_cbe_tmp__68 = llvm_ctor_unnamed_4(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__68.field1 = (((uint8_t*)llvm_cbe_tmp__67));
  llvm_cbe_tmp__14 = llvm_cbe_tmp__68;
  llvm_cbe_tmp__69 = *((&llvm_cbe_tmp__14.field0));
  llvm_cbe_tmp__70 = *((&llvm_cbe_tmp__14.field1));
  __go_panic(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__69, llvm_cbe_tmp__70);
  __builtin_unreachable();

}


static void main_OC_main_KD_main_OC_main_EC_1(uint8_t* llvm_cbe_tmp__76) {
  struct l_unnamed_1 llvm_cbe_tmp__77;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__78;
  uint8_t* llvm_cbe_tmp__79;

  llvm_cbe_tmp__78 = *((&(((struct l_unnamed_4*)llvm_cbe_tmp__76))->field1));
  time_OC_Sleep(/*UNDEF*/((uint8_t*)/*NULL*/0), UINT64_C(1000000000));
  if ((((llvm_cbe_tmp__78 == ((uint8_t*)/*NULL*/0))&1))) {
    goto llvm_cbe_tmp__80;
  } else {
    goto llvm_cbe_tmp__81;
  }

llvm_cbe_tmp__80:
  __go_runtime_error(/*UNDEF*/((uint8_t*)/*NULL*/0), 6);
  __builtin_unreachable();

llvm_cbe_tmp__81:
  llvm_cbe_tmp__79 = *(((uint8_t**)llvm_cbe_tmp__78));
  llvm_cbe_tmp__77 = llvm_ctor_unnamed_1(((&tmp__82.array[((int32_t)0)])), UINT64_C(3));
  __go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), llvm_cbe_tmp__79, (((uint8_t*)(&llvm_cbe_tmp__77))));
}


static void tmp__71(uint8_t* llvm_cbe_tmp__83) {
  uint8_t* llvm_cbe_tmp__84;
  uint8_t* llvm_cbe_tmp__85;

  llvm_cbe_tmp__84 = *((&(((struct l_unnamed_5*)llvm_cbe_tmp__83))->field0));
  llvm_cbe_tmp__85 = *(((uint8_t**)llvm_cbe_tmp__84));
  (((l_fptr_1*)llvm_cbe_tmp__85))(llvm_cbe_tmp__84);
}


static void main_OC_main_KD_main_OC_main_EC_2(uint8_t* llvm_cbe_tmp__86) {
  struct l_unnamed_1 llvm_cbe_tmp__87;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__88;
  uint8_t* llvm_cbe_tmp__89;

  llvm_cbe_tmp__88 = *((&(((struct l_unnamed_4*)llvm_cbe_tmp__86))->field1));
  time_OC_Sleep(/*UNDEF*/((uint8_t*)/*NULL*/0), UINT64_C(2000000000));
  if ((((llvm_cbe_tmp__88 == ((uint8_t*)/*NULL*/0))&1))) {
    goto llvm_cbe_tmp__90;
  } else {
    goto llvm_cbe_tmp__91;
  }

llvm_cbe_tmp__90:
  __go_runtime_error(/*UNDEF*/((uint8_t*)/*NULL*/0), 6);
  __builtin_unreachable();

llvm_cbe_tmp__91:
  llvm_cbe_tmp__89 = *(((uint8_t**)llvm_cbe_tmp__88));
  llvm_cbe_tmp__87 = llvm_ctor_unnamed_1(((&tmp__92.array[((int32_t)0)])), UINT64_C(3));
  __go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN6_stringsre.field0.field0)), llvm_cbe_tmp__89, (((uint8_t*)(&llvm_cbe_tmp__87))));
}


static void tmp__72(uint8_t* llvm_cbe_tmp__93) {
  uint8_t* llvm_cbe_tmp__94;
  uint8_t* llvm_cbe_tmp__95;

  llvm_cbe_tmp__94 = *((&(((struct l_unnamed_5*)llvm_cbe_tmp__93))->field0));
  llvm_cbe_tmp__95 = *(((uint8_t**)llvm_cbe_tmp__94));
  (((l_fptr_1*)llvm_cbe_tmp__95))(llvm_cbe_tmp__94);
}


uint64_t __go_type_hash_AIe2e(uint8_t* llvm_cbe_tmp__96, uint64_t llvm_cbe_tmp__97) {
  struct l_unnamed_4* llvm_cbe_tmp__98;
  uint64_t llvm_cbe_tmp__99;
  uint64_t llvm_cbe_tmp__99__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__100;
  uint64_t llvm_cbe_tmp__100__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__101;
  uint64_t llvm_cbe_tmp__102;
  uint64_t llvm_cbe_tmp__103;

  llvm_cbe_tmp__98 = ((struct l_unnamed_4*)llvm_cbe_tmp__96);
  llvm_cbe_tmp__99__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_tmp__100__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__99 = llvm_cbe_tmp__99__PHI_TEMPORARY;
  llvm_cbe_tmp__100 = llvm_cbe_tmp__100__PHI_TEMPORARY;
  llvm_cbe_tmp__101 = __go_type_hash_empty_interface((((uint8_t*)((&llvm_cbe_tmp__98[((int64_t)llvm_cbe_tmp__99)])))), UINT64_C(16));
  llvm_cbe_tmp__102 = llvm_add_u64((llvm_mul_u64(llvm_cbe_tmp__100, UINT64_C(33))), llvm_cbe_tmp__101);
  llvm_cbe_tmp__103 = llvm_add_u64(llvm_cbe_tmp__99, UINT64_C(1));
  if ((((llvm_cbe_tmp__103 == UINT64_C(2))&1))) {
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__99__PHI_TEMPORARY = llvm_cbe_tmp__103;   /* for PHI node */
    llvm_cbe_tmp__100__PHI_TEMPORARY = llvm_cbe_tmp__102;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  return llvm_cbe_tmp__102;
}


uint8_t __go_type_hash_AIe2e_OC_1(uint8_t* llvm_cbe_tmp__104, uint8_t* llvm_cbe_tmp__105, uint64_t llvm_cbe_tmp__106) {
  struct l_unnamed_4* llvm_cbe_tmp__107;
  struct l_unnamed_4* llvm_cbe_tmp__108;
  uint64_t llvm_cbe_tmp__109;
  uint64_t llvm_cbe_tmp__109__PHI_TEMPORARY;
  uint8_t llvm_cbe_tmp__110;
  uint8_t llvm_cbe_merge;
  uint8_t llvm_cbe_merge__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__111;

  llvm_cbe_tmp__107 = ((struct l_unnamed_4*)llvm_cbe_tmp__104);
  llvm_cbe_tmp__108 = ((struct l_unnamed_4*)llvm_cbe_tmp__105);
  llvm_cbe_tmp__109__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe_loop;

  do {     /* Syntactic loop 'loop' to make GCC happy */
llvm_cbe_loop:
  llvm_cbe_tmp__109 = llvm_cbe_tmp__109__PHI_TEMPORARY;
  llvm_cbe_tmp__110 = __go_type_equal_empty_interface((((uint8_t*)((&llvm_cbe_tmp__107[((int64_t)llvm_cbe_tmp__109)])))), (((uint8_t*)((&llvm_cbe_tmp__108[((int64_t)llvm_cbe_tmp__109)])))), UINT64_C(16));
  if ((((llvm_cbe_tmp__110 == ((uint8_t)0))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 0;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    goto llvm_cbe_cont;
  }

llvm_cbe_cont:
  llvm_cbe_tmp__111 = llvm_add_u64(llvm_cbe_tmp__109, UINT64_C(1));
  if ((((llvm_cbe_tmp__111 == UINT64_C(2))&1))) {
    llvm_cbe_merge__PHI_TEMPORARY = 1;   /* for PHI node */
    goto llvm_cbe_exit;
  } else {
    llvm_cbe_tmp__109__PHI_TEMPORARY = llvm_cbe_tmp__111;   /* for PHI node */
    goto llvm_cbe_loop;
  }

  } while (1); /* end of syntactic loop 'loop' */
llvm_cbe_exit:
  llvm_cbe_merge = llvm_cbe_merge__PHI_TEMPORARY;
  return llvm_cbe_merge;
}


void __go_init_main(uint8_t* llvm_cbe_tmp__112) {
  main_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
}

