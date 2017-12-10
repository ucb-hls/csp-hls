/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#include <stdint.h>
#include <math.h>
// NOTE(growly): Removed for UCB-HLS.
//#include <APInt-C.h>
// NOTE(growly): Added for UCB-HLS.
#include <pthread.h>
#include <stdio.h>
#include "legup/streaming.h"
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
struct l_unnamed_6;
struct l_struct_method;
struct l_struct_methodSlice;
struct l_struct_uncommonType;
struct l_struct_commonType;
struct l_unnamed_1;
struct l_unnamed_2;
struct l_unnamed_3;
struct l_unnamed_4;
struct l_unnamed_5;
struct l_unnamed_7;
struct l_unnamed_8;
typedef void l_fptr_2(void);

/* Types Definitions */
struct l_struct_funcVal {
  l_fptr_2* field0;
};
struct l_unnamed_6 {
  uint8_t* field0;
  uint64_t field1;
};
struct l_struct_method {
  struct l_unnamed_6* field0;
  struct l_unnamed_6* field1;
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
  struct l_unnamed_6* field0;
  struct l_unnamed_6* field1;
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
  struct l_unnamed_6* field8;
  struct l_struct_uncommonType* field9;
  struct l_struct_commonType* field10;
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_array_4_uint8_t_KC_ {
  uint8_t* array[4];
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_8_uint64_t {
  uint64_t array[8];
};
struct l_array_8_struct_AC_l_array_8_uint64_t {
  struct l_array_8_uint64_t array[8];
};
struct l_unnamed_1 {
  uint8_t* field0;
  FIFO** field1;
  uint8_t* field2;
};
struct l_unnamed_2 {
  uint8_t* field0;
};
struct l_unnamed_3 {
  FIFO* field0;
  FIFO* field1;
};
struct l_unnamed_4 {
  FIFO* field0;
  FIFO* field1;
  FIFO* field2;
  FIFO* field3;
};
struct l_unnamed_5 {
  uint8_t* field0;
  uint8_t* field1;
};
struct l_array_1_struct_AC_l_unnamed_5 {
  struct l_unnamed_5 array[1];
};
struct l_unnamed_7 {
  uint8_t* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_unnamed_8 {
  uint64_t field0;
  struct l_unnamed_5 field1;
};
struct l_array_2_struct_AC_l_unnamed_5 {
  struct l_unnamed_5 array[2];
};
struct l_array_6_uint64_t {
  uint64_t array[6];
};
struct l_array_6_struct_AC_l_array_6_uint64_t {
  struct l_array_6_uint64_t array[6];
};
struct l_array_3_uint64_t {
  uint64_t array[3];
};

/* Function definitions */

typedef void l_fptr_1(uint8_t*);


/* External Global Variable Declarations */
struct l_struct_funcVal __go_type_hash_string_descriptor;
struct l_struct_funcVal __go_type_equal_string_descriptor;
struct l_struct_funcVal __go_type_hash_identity_descriptor;
struct l_struct_funcVal __go_type_equal_identity_descriptor;

/* Function Declarations */
void main_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_1(uint8_t*);
static void tmp__127(uint8_t*);
static uint8_t* auto_pthread_wrapper(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_2(uint8_t*);
static void tmp__140(uint8_t*);
static uint8_t* auto_pthread_wrapper_OC_1(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_3(uint8_t*);
static void tmp__153(uint8_t*);
static uint8_t* auto_pthread_wrapper_OC_2(uint8_t*);
static void tmp__158(uint8_t*);
static void main_OC_process1(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_3(uint8_t*);
static void tmp__182(uint8_t*);
static void main_OC_process2(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_4(uint8_t*);
static void tmp__206(uint8_t*);
static void main_OC_process3(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_5(uint8_t*);
static void tmp__230(uint8_t*);
static void main_OC_process4(uint8_t*, FIFO*, FIFO*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_6(uint8_t*);
struct l_unnamed_8 fmt_OC_Println(uint8_t*, struct l_unnamed_7);
struct l_unnamed_8 fmt_OC_Print(uint8_t*, struct l_unnamed_7);
void __go_init_main(uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);
uint32_t main(void);


/* Global Variable Definitions and Initialization */
static bool init_EC_guard;
static struct l_array_14_uint8_t tmp__115 = { { 79u, 114u, 105u, 103u, 105u, 110u, 97u, 108u, 32, 97u, 114u, 114u, 97u, 121u } };
struct l_struct_commonType __go_tdn_string __attribute__((common)) = { 24, 8, 8, UINT64_C(16), 100666096, (&__go_type_hash_string_descriptor), (&__go_type_equal_string_descriptor), ((uint8_t*)(&__go_tdn_string_EC_gc)), (&tmp__251), (&tmp__252), ((struct l_struct_commonType*)/*NULL*/0) };
struct l_struct_commonType __go_tdn_int __attribute__((common)) = { 130u, 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__253), (&tmp__254), ((struct l_struct_commonType*)/*NULL*/0) };
static struct l_array_1_uint8_t tmp__117 = { { 32 } };
static struct l_array_12_uint8_t tmp__116 = { { 82u, 101u, 115u, 117u, 108u, 116u, 32, 97u, 114u, 114u, 97u, 121u } };
static struct l_array_1_uint8_t tmp__118 = { { 32 } };
static struct l_array_3_uint8_t tmp__255 = { { 105u, 110u, 116u } };
static struct l_unnamed_6 tmp__253 = { ((&tmp__255.array[((int32_t)0)])), UINT64_C(3) };
static struct l_array_3_uint8_t tmp__256 = { { 105u, 110u, 116u } };
static struct l_unnamed_6 tmp__257 = { ((&tmp__256.array[((int32_t)0)])), UINT64_C(3) };
static struct l_struct_uncommonType tmp__254 = { (&tmp__257), ((struct l_unnamed_6*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_int_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_6_uint8_t tmp__258 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_6 tmp__251 = { ((&tmp__258.array[((int32_t)0)])), UINT64_C(6) };
static struct l_array_6_uint8_t tmp__259 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_6 tmp__260 = { ((&tmp__259.array[((int32_t)0)])), UINT64_C(6) };
static struct l_struct_uncommonType tmp__252 = { (&tmp__260), ((struct l_unnamed_6*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_4_uint8_t_KC_ __go_tdn_string_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(16)), ((uint8_t*)(uintptr_t)UINT64_C(7)), ((uint8_t*)/*NULL*/0), ((uint8_t*)/*NULL*/0) } };


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
static __forceinline struct l_unnamed_6 llvm_ctor_unnamed_6(uint8_t* x0, uint64_t x1) {
  struct l_unnamed_6 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_5 llvm_ctor_unnamed_5(uint8_t* x0, uint8_t* x1) {
  struct l_unnamed_5 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_7 llvm_ctor_unnamed_7(uint8_t* x0, uint64_t x1, uint64_t x2) {
  struct l_unnamed_7 r;
  r.field0 = x0;
  r.field1 = x1;
  r.field2 = x2;
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

llvm_cbe__2e_0_2e_entry: {
  return;
}
llvm_cbe_tmp__3: {
  init_EC_guard = ((1) & 1);
  goto llvm_cbe__2e_0_2e_entry;

}
}


void main_OC_main(uint8_t* llvm_cbe_tmp__4) {
  FIFO* llvm_cbe_c1_in;    /* Address-exposed local */
  FIFO* llvm_cbe_c2_in;    /* Address-exposed local */
  FIFO* llvm_cbe_c3_in;    /* Address-exposed local */
  struct l_array_8_struct_AC_l_array_8_uint64_t llvm_cbe_array;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__5;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__6;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__7;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__8;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__9;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__10;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id1;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__11;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__12;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__13;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__14;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id2;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__15;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__16;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__17;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id3;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__18;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__19;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__20;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id4;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__21;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__22;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__23;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id5;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__24;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__25;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__26;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id6;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__27;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__28;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__29;    /* Address-exposed local */
  struct l_array_1_struct_AC_l_unnamed_5 llvm_cbe_varargs;    /* Address-exposed local */
  struct l_unnamed_6 llvm_cbe_tmp__30;    /* Address-exposed local */
  struct l_unnamed_7 llvm_cbe_tmp__31;    /* Address-exposed local */
  struct l_unnamed_8 llvm_cbe_tmp__32;    /* Address-exposed local */
  struct l_array_2_struct_AC_l_unnamed_5 llvm_cbe_varargs12;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__33;    /* Address-exposed local */
  struct l_unnamed_6 llvm_cbe_tmp__34;    /* Address-exposed local */
  struct l_unnamed_7 llvm_cbe_tmp__35;    /* Address-exposed local */
  struct l_unnamed_8 llvm_cbe_tmp__36;    /* Address-exposed local */
  struct l_unnamed_7 llvm_cbe_tmp__37;    /* Address-exposed local */
  struct l_unnamed_8 llvm_cbe_tmp__38;    /* Address-exposed local */
  struct l_array_1_struct_AC_l_unnamed_5 llvm_cbe_varargs13;    /* Address-exposed local */
  struct l_unnamed_6 llvm_cbe_tmp__39;    /* Address-exposed local */
  struct l_unnamed_7 llvm_cbe_tmp__40;    /* Address-exposed local */
  struct l_unnamed_8 llvm_cbe_tmp__41;    /* Address-exposed local */
  struct l_array_2_struct_AC_l_unnamed_5 llvm_cbe_varargs16;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__42;    /* Address-exposed local */
  struct l_unnamed_6 llvm_cbe_tmp__43;    /* Address-exposed local */
  struct l_unnamed_7 llvm_cbe_tmp__44;    /* Address-exposed local */
  struct l_unnamed_8 llvm_cbe_tmp__45;    /* Address-exposed local */
  struct l_unnamed_7 llvm_cbe_tmp__46;    /* Address-exposed local */
  struct l_unnamed_8 llvm_cbe_tmp__47;    /* Address-exposed local */
  struct l_array_6_struct_AC_l_array_6_uint64_t llvm_cbe_result;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__48;
  uint8_t* llvm_cbe_tmp__49;
  FIFO* llvm_cbe_tmp__50;
  FIFO* llvm_cbe_tmp__51;
  FIFO* llvm_cbe_tmp__52;
  FIFO* llvm_cbe_tmp__53;
  FIFO* llvm_cbe_tmp__54;
  FIFO* llvm_cbe_tmp__55;
  FIFO* llvm_cbe_tmp__56;
  uint8_t* llvm_cbe_tmp__57;
  uint8_t* llvm_cbe_tmp__58;
  uint8_t* llvm_cbe_tmp__59;
  uint8_t* llvm_cbe_tmp__60;
  uint8_t* llvm_cbe_tmp__61;
  FIFO* llvm_cbe_tmp__62;
  uint8_t* llvm_cbe_tmp__63;
  FIFO* llvm_cbe_tmp__64;
  uint8_t* llvm_cbe_tmp__65;
  FIFO* llvm_cbe_tmp__66;
  uint8_t* llvm_cbe_tmp__67;
  uint8_t* llvm_cbe_tmp__68;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__69;
  uint64_t llvm_cbe_tmp__70;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint8_t* llvm_cbe_tmp__71;
  struct l_unnamed_5 llvm_cbe_tmp__72;
  struct l_unnamed_7 llvm_cbe_tmp__73;
  struct l_unnamed_7 llvm_cbe_tmp__74;
  struct l_unnamed_7 llvm_cbe_tmp__75;
  uint64_t llvm_cbe_tmp__76;
  struct l_unnamed_5 llvm_cbe_tmp__77;
  uint64_t llvm_cbe_i7;
  uint64_t llvm_cbe_i7__PHI_TEMPORARY;
  uint64_t llvm_cbe_item;
  uint64_t llvm_cbe_item__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__78;
  uint64_t llvm_cbe_tmp__79;
  uint64_t llvm_cbe_tmp__80;
  uint64_t llvm_cbe_tmp__81;
  uint64_t llvm_cbe_j8;
  uint64_t llvm_cbe_j8__PHI_TEMPORARY;
  uint64_t llvm_cbe_item9;
  uint64_t llvm_cbe_item9__PHI_TEMPORARY;
  uint8_t* llvm_cbe_tmp__82;
  struct l_unnamed_5 llvm_cbe_tmp__83;
  struct l_unnamed_7 llvm_cbe_tmp__84;
  struct l_unnamed_7 llvm_cbe_tmp__85;
  struct l_unnamed_7 llvm_cbe_tmp__86;
  uint64_t llvm_cbe_tmp__87;
  struct l_unnamed_5 llvm_cbe_tmp__88;
  uint64_t llvm_cbe_i10;
  uint64_t llvm_cbe_i10__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__89;
  uint8_t* llvm_cbe_tmp__90;
  struct l_unnamed_5 llvm_cbe_tmp__91;
  struct l_unnamed_5 llvm_cbe_tmp__92;
  struct l_unnamed_7 llvm_cbe_tmp__93;
  struct l_unnamed_7 llvm_cbe_tmp__94;
  struct l_unnamed_7 llvm_cbe_tmp__95;
  uint64_t llvm_cbe_tmp__96;
  struct l_unnamed_5 llvm_cbe_tmp__97;
  uint64_t llvm_cbe_tmp__98;
  uint64_t llvm_cbe_tmp__99;
  struct l_unnamed_5 llvm_cbe_tmp__100;
  uint64_t llvm_cbe_tmp__101;
  uint64_t llvm_cbe_j11;
  uint64_t llvm_cbe_j11__PHI_TEMPORARY;
  uint64_t llvm_cbe_i14;
  uint64_t llvm_cbe_i14__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__102;
  uint8_t* llvm_cbe_tmp__103;
  struct l_unnamed_5 llvm_cbe_tmp__104;
  struct l_unnamed_5 llvm_cbe_tmp__105;
  struct l_unnamed_7 llvm_cbe_tmp__106;
  struct l_unnamed_7 llvm_cbe_tmp__107;
  struct l_unnamed_7 llvm_cbe_tmp__108;
  uint64_t llvm_cbe_tmp__109;
  struct l_unnamed_5 llvm_cbe_tmp__110;
  uint64_t llvm_cbe_tmp__111;
  uint64_t llvm_cbe_tmp__112;
  struct l_unnamed_5 llvm_cbe_tmp__113;
  uint64_t llvm_cbe_tmp__114;
  uint64_t llvm_cbe_j15;
  uint64_t llvm_cbe_j15__PHI_TEMPORARY;

  llvm_cbe_tmp__48 = memset((((uint8_t*)(&llvm_cbe_result))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(36))))));
  llvm_cbe_tmp__49 = ((uint8_t*)(&llvm_cbe_result));
  llvm_cbe_tmp__50 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_c1_in = llvm_cbe_tmp__50;
  llvm_cbe_tmp__51 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_c2_in = llvm_cbe_tmp__51;
  llvm_cbe_tmp__52 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_c3_in = llvm_cbe_tmp__52;
  llvm_cbe_tmp__53 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__54 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__55 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__56 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__57 = ((uint8_t*)(&llvm_cbe_array));
  llvm_cbe_tmp__58 = memset(llvm_cbe_tmp__49, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(36))))));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  *((&llvm_cbe_tmp__5.field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_1);
  *((&llvm_cbe_tmp__5.field1)) = (&llvm_cbe_c1_in);
  *((&llvm_cbe_tmp__5.field2)) = llvm_cbe_tmp__57;
  *((&llvm_cbe_tmp__6.field0)) = (((uint8_t*)(&llvm_cbe_tmp__5)));
  llvm_cbe_tmp__7 = (&llvm_cbe_thread_id);
  llvm_cbe_tmp__8 = (&llvm_cbe_tmp__7);
  llvm_cbe_tmp__59 = *(((uint8_t**)(&llvm_cbe_tmp__8)));
  pthread_create(llvm_cbe_tmp__59, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper), (((uint8_t*)(&llvm_cbe_tmp__6))));
  *((&llvm_cbe_tmp__9.field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_2);
  *((&llvm_cbe_tmp__9.field1)) = (&llvm_cbe_c2_in);
  *((&llvm_cbe_tmp__9.field2)) = llvm_cbe_tmp__57;
  *((&llvm_cbe_tmp__10.field0)) = (((uint8_t*)(&llvm_cbe_tmp__9)));
  llvm_cbe_tmp__11 = (&llvm_cbe_thread_id1);
  llvm_cbe_tmp__12 = (&llvm_cbe_tmp__11);
  llvm_cbe_tmp__60 = *(((uint8_t**)(&llvm_cbe_tmp__12)));
  pthread_create(llvm_cbe_tmp__60, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_1), (((uint8_t*)(&llvm_cbe_tmp__10))));
  *((&llvm_cbe_tmp__13.field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_3);
  *((&llvm_cbe_tmp__13.field1)) = (&llvm_cbe_c3_in);
  *((&llvm_cbe_tmp__13.field2)) = llvm_cbe_tmp__57;
  *((&llvm_cbe_tmp__14.field0)) = (((uint8_t*)(&llvm_cbe_tmp__13)));
  llvm_cbe_tmp__15 = (&llvm_cbe_thread_id2);
  llvm_cbe_tmp__16 = (&llvm_cbe_tmp__15);
  llvm_cbe_tmp__61 = *(((uint8_t**)(&llvm_cbe_tmp__16)));
  pthread_create(llvm_cbe_tmp__61, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_2), (((uint8_t*)(&llvm_cbe_tmp__14))));
  llvm_cbe_tmp__62 = llvm_cbe_c1_in;
  *((&llvm_cbe_tmp__17.field0)) = llvm_cbe_tmp__62;
  *((&llvm_cbe_tmp__17.field1)) = llvm_cbe_tmp__53;
  llvm_cbe_tmp__18 = (&llvm_cbe_thread_id3);
  llvm_cbe_tmp__19 = (&llvm_cbe_tmp__18);
  llvm_cbe_tmp__63 = *(((uint8_t**)(&llvm_cbe_tmp__19)));
  pthread_create(llvm_cbe_tmp__63, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_3), (((uint8_t*)(&llvm_cbe_tmp__17))));
  llvm_cbe_tmp__64 = llvm_cbe_c2_in;
  *((&llvm_cbe_tmp__20.field0)) = llvm_cbe_tmp__64;
  *((&llvm_cbe_tmp__20.field1)) = llvm_cbe_tmp__54;
  llvm_cbe_tmp__21 = (&llvm_cbe_thread_id4);
  llvm_cbe_tmp__22 = (&llvm_cbe_tmp__21);
  llvm_cbe_tmp__65 = *(((uint8_t**)(&llvm_cbe_tmp__22)));
  pthread_create(llvm_cbe_tmp__65, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_4), (((uint8_t*)(&llvm_cbe_tmp__20))));
  llvm_cbe_tmp__66 = llvm_cbe_c3_in;
  *((&llvm_cbe_tmp__23.field0)) = llvm_cbe_tmp__66;
  *((&llvm_cbe_tmp__23.field1)) = llvm_cbe_tmp__55;
  llvm_cbe_tmp__24 = (&llvm_cbe_thread_id5);
  llvm_cbe_tmp__25 = (&llvm_cbe_tmp__24);
  llvm_cbe_tmp__67 = *(((uint8_t**)(&llvm_cbe_tmp__25)));
  pthread_create(llvm_cbe_tmp__67, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_5), (((uint8_t*)(&llvm_cbe_tmp__23))));
  *((&llvm_cbe_tmp__26.field0)) = llvm_cbe_tmp__53;
  *((&llvm_cbe_tmp__26.field1)) = llvm_cbe_tmp__54;
  *((&llvm_cbe_tmp__26.field2)) = llvm_cbe_tmp__55;
  *((&llvm_cbe_tmp__26.field3)) = llvm_cbe_tmp__56;
  llvm_cbe_tmp__27 = (&llvm_cbe_thread_id6);
  llvm_cbe_tmp__28 = (&llvm_cbe_tmp__27);
  llvm_cbe_tmp__68 = *(((uint8_t**)(&llvm_cbe_tmp__28)));
  pthread_create(llvm_cbe_tmp__68, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_6), (((uint8_t*)(&llvm_cbe_tmp__26))));
  llvm_cbe_i7__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__57))[((int64_t)llvm_cbe_i)]))))))[((int64_t)llvm_cbe_j)])))))) = (llvm_add_u64(llvm_cbe_i, llvm_cbe_j));
  llvm_cbe_tmp__69 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__69;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__70 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__70;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
llvm_cbe__2e_8_2e_for_2e_done: {
  llvm_cbe_tmp__71 = ((uint8_t*)(&llvm_cbe_varargs));
  llvm_cbe_tmp__30 = llvm_ctor_unnamed_6(((&tmp__115.array[((int32_t)0)])), UINT64_C(14));
  llvm_cbe_tmp__72 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__72.field1 = (((uint8_t*)(&llvm_cbe_tmp__30)));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__71))))))))) = llvm_cbe_tmp__72;
  llvm_cbe_tmp__73 = llvm_ctor_unnamed_7(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__73.field0 = ((&(*llvm_cbe_tmp__71)));
  llvm_cbe_tmp__74 = llvm_cbe_tmp__73;
  llvm_cbe_tmp__74.field1 = UINT64_C(1);
  llvm_cbe_tmp__75 = llvm_cbe_tmp__74;
  llvm_cbe_tmp__75.field2 = UINT64_C(1);
  llvm_cbe_tmp__31 = llvm_cbe_tmp__75;
  llvm_cbe_tmp__32 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__31);
  llvm_cbe_tmp__76 = *((&llvm_cbe_tmp__32.field0));
  llvm_cbe_tmp__77 = *((&llvm_cbe_tmp__32.field1));
  llvm_cbe_i10__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_15_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.9.for.loop' to make GCC happy */
llvm_cbe__2e_9_2e_for_2e_loop: {
  llvm_cbe_i7 = llvm_cbe_i7__PHI_TEMPORARY;
  llvm_cbe_item = llvm_cbe_item__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i7) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j8__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_item9__PHI_TEMPORARY = llvm_cbe_item;   /* for PHI node */
    goto llvm_cbe__2e_12_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_8_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.12.for.loop' to make GCC happy */
llvm_cbe__2e_12_2e_for_2e_loop: {
  llvm_cbe_j8 = llvm_cbe_j8__PHI_TEMPORARY;
  llvm_cbe_item9 = llvm_cbe_item9__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j8) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_10_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_11_2e_for_2e_done;
  }

}
llvm_cbe__2e_10_2e_for_2e_body: {
  llvm_cbe_tmp__78 = fifo_read(llvm_cbe_tmp__56);
  llvm_cbe_tmp__29 = llvm_cbe_tmp__78;
  llvm_cbe_tmp__79 = llvm_cbe_tmp__29;
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_6_uint64_t*)llvm_cbe_tmp__49))[((int64_t)llvm_cbe_i7)]))))))[((int64_t)llvm_cbe_j8)])))))) = llvm_cbe_tmp__79;
  llvm_cbe_tmp__80 = llvm_add_u64(llvm_cbe_j8, UINT64_C(1));
  llvm_cbe_j8__PHI_TEMPORARY = llvm_cbe_tmp__80;   /* for PHI node */
  llvm_cbe_item9__PHI_TEMPORARY = llvm_cbe_tmp__79;   /* for PHI node */
  goto llvm_cbe__2e_12_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.12.for.loop' */
llvm_cbe__2e_11_2e_for_2e_done: {
  llvm_cbe_tmp__81 = llvm_add_u64(llvm_cbe_i7, UINT64_C(1));
  llvm_cbe_i7__PHI_TEMPORARY = llvm_cbe_tmp__81;   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = llvm_cbe_item9;   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.9.for.loop' */
llvm_cbe__2e_14_2e_for_2e_done: {
  llvm_cbe_tmp__82 = ((uint8_t*)(&llvm_cbe_varargs13));
  llvm_cbe_tmp__39 = llvm_ctor_unnamed_6(((&tmp__116.array[((int32_t)0)])), UINT64_C(12));
  llvm_cbe_tmp__83 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__83.field1 = (((uint8_t*)(&llvm_cbe_tmp__39)));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__82))))))))) = llvm_cbe_tmp__83;
  llvm_cbe_tmp__84 = llvm_ctor_unnamed_7(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__84.field0 = ((&(*llvm_cbe_tmp__82)));
  llvm_cbe_tmp__85 = llvm_cbe_tmp__84;
  llvm_cbe_tmp__85.field1 = UINT64_C(1);
  llvm_cbe_tmp__86 = llvm_cbe_tmp__85;
  llvm_cbe_tmp__86.field2 = UINT64_C(1);
  llvm_cbe_tmp__40 = llvm_cbe_tmp__86;
  llvm_cbe_tmp__41 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__40);
  llvm_cbe_tmp__87 = *((&llvm_cbe_tmp__41.field0));
  llvm_cbe_tmp__88 = *((&llvm_cbe_tmp__41.field1));
  llvm_cbe_i14__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_21_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.15.for.loop' to make GCC happy */
llvm_cbe__2e_15_2e_for_2e_loop: {
  llvm_cbe_i10 = llvm_cbe_i10__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i10) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    llvm_cbe_j11__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_18_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_14_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.18.for.loop' to make GCC happy */
llvm_cbe__2e_18_2e_for_2e_loop: {
  llvm_cbe_j11 = llvm_cbe_j11__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j11) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_16_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_17_2e_for_2e_done;
  }

}
llvm_cbe__2e_16_2e_for_2e_body: {
  llvm_cbe_tmp__89 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__57))[((int64_t)llvm_cbe_i10)]))))))[((int64_t)llvm_cbe_j11)]))))));
  llvm_cbe_tmp__90 = ((uint8_t*)(&llvm_cbe_varargs12));
  llvm_cbe_tmp__33 = llvm_cbe_tmp__89;
  llvm_cbe_tmp__91 = llvm_ctor_unnamed_5(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__91.field1 = (((uint8_t*)(&llvm_cbe_tmp__33)));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__90))))))))) = llvm_cbe_tmp__91;
  llvm_cbe_tmp__34 = llvm_ctor_unnamed_6(((&tmp__117.array[((int32_t)0)])), UINT64_C(1));
  llvm_cbe_tmp__92 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__92.field1 = (((uint8_t*)(&llvm_cbe_tmp__34)));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(((struct l_unnamed_5*)llvm_cbe_tmp__90))[((int64_t)UINT64_C(1))])))))) = llvm_cbe_tmp__92;
  llvm_cbe_tmp__93 = llvm_ctor_unnamed_7(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__93.field0 = ((&(*llvm_cbe_tmp__90)));
  llvm_cbe_tmp__94 = llvm_cbe_tmp__93;
  llvm_cbe_tmp__94.field1 = UINT64_C(2);
  llvm_cbe_tmp__95 = llvm_cbe_tmp__94;
  llvm_cbe_tmp__95.field2 = UINT64_C(2);
  llvm_cbe_tmp__35 = llvm_cbe_tmp__95;
  llvm_cbe_tmp__36 = fmt_OC_Print(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__35);
  llvm_cbe_tmp__96 = *((&llvm_cbe_tmp__36.field0));
  llvm_cbe_tmp__97 = *((&llvm_cbe_tmp__36.field1));
  llvm_cbe_tmp__98 = llvm_add_u64(llvm_cbe_j11, UINT64_C(1));
  llvm_cbe_j11__PHI_TEMPORARY = llvm_cbe_tmp__98;   /* for PHI node */
  goto llvm_cbe__2e_18_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.18.for.loop' */
llvm_cbe__2e_17_2e_for_2e_done: {
  llvm_cbe_tmp__37 = llvm_ctor_unnamed_7(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__38 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__37);
  llvm_cbe_tmp__99 = *((&llvm_cbe_tmp__38.field0));
  llvm_cbe_tmp__100 = *((&llvm_cbe_tmp__38.field1));
  llvm_cbe_tmp__101 = llvm_add_u64(llvm_cbe_i10, UINT64_C(1));
  llvm_cbe_i10__PHI_TEMPORARY = llvm_cbe_tmp__101;   /* for PHI node */
  goto llvm_cbe__2e_15_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.15.for.loop' */
llvm_cbe__2e_20_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.21.for.loop' to make GCC happy */
llvm_cbe__2e_21_2e_for_2e_loop: {
  llvm_cbe_i14 = llvm_cbe_i14__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i14) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j15__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_24_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_20_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.24.for.loop' to make GCC happy */
llvm_cbe__2e_24_2e_for_2e_loop: {
  llvm_cbe_j15 = llvm_cbe_j15__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j15) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_22_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_23_2e_for_2e_done;
  }

}
llvm_cbe__2e_22_2e_for_2e_body: {
  llvm_cbe_tmp__102 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_6_uint64_t*)llvm_cbe_tmp__49))[((int64_t)llvm_cbe_i14)]))))))[((int64_t)llvm_cbe_j15)]))))));
  llvm_cbe_tmp__103 = ((uint8_t*)(&llvm_cbe_varargs16));
  llvm_cbe_tmp__42 = llvm_cbe_tmp__102;
  llvm_cbe_tmp__104 = llvm_ctor_unnamed_5(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__104.field1 = (((uint8_t*)(&llvm_cbe_tmp__42)));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(*(((struct l_unnamed_5*)llvm_cbe_tmp__103))))))))) = llvm_cbe_tmp__104;
  llvm_cbe_tmp__43 = llvm_ctor_unnamed_6(((&tmp__118.array[((int32_t)0)])), UINT64_C(1));
  llvm_cbe_tmp__105 = llvm_ctor_unnamed_5(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__105.field1 = (((uint8_t*)(&llvm_cbe_tmp__43)));
  *(((struct l_unnamed_5*)(((uint8_t*)((&(((struct l_unnamed_5*)llvm_cbe_tmp__103))[((int64_t)UINT64_C(1))])))))) = llvm_cbe_tmp__105;
  llvm_cbe_tmp__106 = llvm_ctor_unnamed_7(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__106.field0 = ((&(*llvm_cbe_tmp__103)));
  llvm_cbe_tmp__107 = llvm_cbe_tmp__106;
  llvm_cbe_tmp__107.field1 = UINT64_C(2);
  llvm_cbe_tmp__108 = llvm_cbe_tmp__107;
  llvm_cbe_tmp__108.field2 = UINT64_C(2);
  llvm_cbe_tmp__44 = llvm_cbe_tmp__108;
  llvm_cbe_tmp__45 = fmt_OC_Print(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__44);
  llvm_cbe_tmp__109 = *((&llvm_cbe_tmp__45.field0));
  llvm_cbe_tmp__110 = *((&llvm_cbe_tmp__45.field1));
  llvm_cbe_tmp__111 = llvm_add_u64(llvm_cbe_j15, UINT64_C(1));
  llvm_cbe_j15__PHI_TEMPORARY = llvm_cbe_tmp__111;   /* for PHI node */
  goto llvm_cbe__2e_24_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.24.for.loop' */
llvm_cbe__2e_23_2e_for_2e_done: {
  llvm_cbe_tmp__46 = llvm_ctor_unnamed_7(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__47 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__46);
  llvm_cbe_tmp__112 = *((&llvm_cbe_tmp__47.field0));
  llvm_cbe_tmp__113 = *((&llvm_cbe_tmp__47.field1));
  llvm_cbe_tmp__114 = llvm_add_u64(llvm_cbe_i14, UINT64_C(1));
  llvm_cbe_i14__PHI_TEMPORARY = llvm_cbe_tmp__114;   /* for PHI node */
  goto llvm_cbe__2e_21_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.21.for.loop' */
}


static void main_OC_main_KD_main_OC_main_EC_1(uint8_t* llvm_cbe_tmp__119) {
  struct l_unnamed_1* llvm_cbe_tmp__120;
  FIFO** llvm_cbe_tmp__121;
  uint8_t* llvm_cbe_tmp__122;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  FIFO* llvm_cbe_tmp__123;
  uint64_t llvm_cbe_tmp__124;
  uint64_t llvm_cbe_tmp__125;
  uint64_t llvm_cbe_tmp__126;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_tmp__120 = ((struct l_unnamed_1*)llvm_cbe_tmp__119);
  llvm_cbe_tmp__121 = *((&llvm_cbe_tmp__120->field1));
  llvm_cbe_tmp__122 = *((&llvm_cbe_tmp__120->field2));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__123 = *llvm_cbe_tmp__121;
  llvm_cbe_tmp__124 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__122))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(0))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_tmp__123, llvm_cbe_tmp__124);
  llvm_cbe_tmp__125 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__125;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__126 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__126;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void tmp__127(uint8_t* llvm_cbe_tmp__128) {
  uint8_t* llvm_cbe_tmp__129;
  uint8_t* llvm_cbe_tmp__130;

  llvm_cbe_tmp__129 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__128))->field0));
  llvm_cbe_tmp__130 = *(((uint8_t**)llvm_cbe_tmp__129));
  (((l_fptr_1*)llvm_cbe_tmp__130))(llvm_cbe_tmp__129);
}


static uint8_t* auto_pthread_wrapper(uint8_t* llvm_cbe_tmp__131) {
  tmp__127(llvm_cbe_tmp__131);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void main_OC_main_KD_main_OC_main_EC_2(uint8_t* llvm_cbe_tmp__132) {
  struct l_unnamed_1* llvm_cbe_tmp__133;
  FIFO** llvm_cbe_tmp__134;
  uint8_t* llvm_cbe_tmp__135;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  FIFO* llvm_cbe_tmp__136;
  uint64_t llvm_cbe_tmp__137;
  uint64_t llvm_cbe_tmp__138;
  uint64_t llvm_cbe_tmp__139;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_tmp__133 = ((struct l_unnamed_1*)llvm_cbe_tmp__132);
  llvm_cbe_tmp__134 = *((&llvm_cbe_tmp__133->field1));
  llvm_cbe_tmp__135 = *((&llvm_cbe_tmp__133->field2));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__136 = *llvm_cbe_tmp__134;
  llvm_cbe_tmp__137 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__135))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(1))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_tmp__136, llvm_cbe_tmp__137);
  llvm_cbe_tmp__138 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__138;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__139 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__139;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void tmp__140(uint8_t* llvm_cbe_tmp__141) {
  uint8_t* llvm_cbe_tmp__142;
  uint8_t* llvm_cbe_tmp__143;

  llvm_cbe_tmp__142 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__141))->field0));
  llvm_cbe_tmp__143 = *(((uint8_t**)llvm_cbe_tmp__142));
  (((l_fptr_1*)llvm_cbe_tmp__143))(llvm_cbe_tmp__142);
}


static uint8_t* auto_pthread_wrapper_OC_1(uint8_t* llvm_cbe_tmp__144) {
  tmp__140(llvm_cbe_tmp__144);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void main_OC_main_KD_main_OC_main_EC_3(uint8_t* llvm_cbe_tmp__145) {
  struct l_unnamed_1* llvm_cbe_tmp__146;
  FIFO** llvm_cbe_tmp__147;
  uint8_t* llvm_cbe_tmp__148;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  FIFO* llvm_cbe_tmp__149;
  uint64_t llvm_cbe_tmp__150;
  uint64_t llvm_cbe_tmp__151;
  uint64_t llvm_cbe_tmp__152;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_tmp__146 = ((struct l_unnamed_1*)llvm_cbe_tmp__145);
  llvm_cbe_tmp__147 = *((&llvm_cbe_tmp__146->field1));
  llvm_cbe_tmp__148 = *((&llvm_cbe_tmp__146->field2));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__149 = *llvm_cbe_tmp__147;
  llvm_cbe_tmp__150 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__148))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(2))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_tmp__149, llvm_cbe_tmp__150);
  llvm_cbe_tmp__151 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__151;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__152 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__152;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void tmp__153(uint8_t* llvm_cbe_tmp__154) {
  uint8_t* llvm_cbe_tmp__155;
  uint8_t* llvm_cbe_tmp__156;

  llvm_cbe_tmp__155 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__154))->field0));
  llvm_cbe_tmp__156 = *(((uint8_t**)llvm_cbe_tmp__155));
  (((l_fptr_1*)llvm_cbe_tmp__156))(llvm_cbe_tmp__155);
}


static uint8_t* auto_pthread_wrapper_OC_2(uint8_t* llvm_cbe_tmp__157) {
  tmp__153(llvm_cbe_tmp__157);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__158(uint8_t* llvm_cbe_tmp__159) {
  struct l_unnamed_3* llvm_cbe_tmp__160;
  FIFO* llvm_cbe_tmp__161;
  FIFO* llvm_cbe_tmp__162;

  llvm_cbe_tmp__160 = ((struct l_unnamed_3*)llvm_cbe_tmp__159);
  llvm_cbe_tmp__161 = *((&llvm_cbe_tmp__160->field0));
  llvm_cbe_tmp__162 = *((&llvm_cbe_tmp__160->field1));
  main_OC_process1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__161, llvm_cbe_tmp__162);
}


static void main_OC_process1(uint8_t* llvm_cbe_tmp__163, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__164;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__165;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__166;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__167;
  uint8_t* llvm_cbe_tmp__168;
  uint8_t* llvm_cbe_tmp__169;
  uint64_t llvm_cbe_tmp__170;
  uint64_t llvm_cbe_tmp__171;
  uint64_t llvm_cbe_tmp__172;
  uint64_t llvm_cbe_tmp__173;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__174;
  uint64_t llvm_cbe_tmp__175;
  uint64_t llvm_cbe_tmp__176;
  uint64_t llvm_cbe_tmp__177;
  uint64_t llvm_cbe_tmp__178;
  uint64_t llvm_cbe_tmp__179;
  uint64_t llvm_cbe_tmp__180;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__167 = memset((((uint8_t*)(&llvm_cbe_filter_row))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  llvm_cbe_tmp__168 = ((uint8_t*)(&llvm_cbe_filter_row));
  llvm_cbe_tmp__169 = memset(llvm_cbe_tmp__168, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__168))))))))) = UINT64_C(0);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__168))[((int64_t)UINT64_C(1))])))))) = UINT64_C(1);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__168))[((int64_t)UINT64_C(2))])))))) = UINT64_C(2);
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_item3 = llvm_cbe_item3__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
llvm_cbe__2e_1_2e_for_2e_body: {
  llvm_cbe_tmp__170 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__164 = llvm_cbe_tmp__170;
  llvm_cbe_tmp__171 = llvm_cbe_tmp__164;
  llvm_cbe_tmp__172 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__165 = llvm_cbe_tmp__172;
  llvm_cbe_tmp__173 = llvm_cbe_tmp__165;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__171;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__173;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_item3;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_item1 = llvm_cbe_item1__PHI_TEMPORARY;
  llvm_cbe_item2 = llvm_cbe_item2__PHI_TEMPORARY;
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  llvm_cbe_item31 = llvm_cbe_item31__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__174 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__166 = llvm_cbe_tmp__174;
  llvm_cbe_tmp__175 = llvm_cbe_tmp__166;
  llvm_cbe_tmp__176 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__168)))))))));
  llvm_cbe_tmp__177 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__168))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__178 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__168))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__176)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__177)))), (llvm_mul_u64(llvm_cbe_tmp__175, llvm_cbe_tmp__178)))));
  llvm_cbe_tmp__179 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__175;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__179;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__175;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__180 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__180;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_3(uint8_t* llvm_cbe_tmp__181) {
  tmp__158(llvm_cbe_tmp__181);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__182(uint8_t* llvm_cbe_tmp__183) {
  struct l_unnamed_3* llvm_cbe_tmp__184;
  FIFO* llvm_cbe_tmp__185;
  FIFO* llvm_cbe_tmp__186;

  llvm_cbe_tmp__184 = ((struct l_unnamed_3*)llvm_cbe_tmp__183);
  llvm_cbe_tmp__185 = *((&llvm_cbe_tmp__184->field0));
  llvm_cbe_tmp__186 = *((&llvm_cbe_tmp__184->field1));
  main_OC_process2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__185, llvm_cbe_tmp__186);
}


static void main_OC_process2(uint8_t* llvm_cbe_tmp__187, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__188;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__189;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__190;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__191;
  uint8_t* llvm_cbe_tmp__192;
  uint8_t* llvm_cbe_tmp__193;
  uint64_t llvm_cbe_tmp__194;
  uint64_t llvm_cbe_tmp__195;
  uint64_t llvm_cbe_tmp__196;
  uint64_t llvm_cbe_tmp__197;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__198;
  uint64_t llvm_cbe_tmp__199;
  uint64_t llvm_cbe_tmp__200;
  uint64_t llvm_cbe_tmp__201;
  uint64_t llvm_cbe_tmp__202;
  uint64_t llvm_cbe_tmp__203;
  uint64_t llvm_cbe_tmp__204;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__191 = memset((((uint8_t*)(&llvm_cbe_filter_row))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  llvm_cbe_tmp__192 = ((uint8_t*)(&llvm_cbe_filter_row));
  llvm_cbe_tmp__193 = memset(llvm_cbe_tmp__192, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__192))))))))) = UINT64_C(3);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__192))[((int64_t)UINT64_C(1))])))))) = UINT64_C(4);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__192))[((int64_t)UINT64_C(2))])))))) = UINT64_C(5);
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_item3 = llvm_cbe_item3__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
llvm_cbe__2e_1_2e_for_2e_body: {
  llvm_cbe_tmp__194 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__188 = llvm_cbe_tmp__194;
  llvm_cbe_tmp__195 = llvm_cbe_tmp__188;
  llvm_cbe_tmp__196 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__189 = llvm_cbe_tmp__196;
  llvm_cbe_tmp__197 = llvm_cbe_tmp__189;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__195;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__197;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_item3;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_item1 = llvm_cbe_item1__PHI_TEMPORARY;
  llvm_cbe_item2 = llvm_cbe_item2__PHI_TEMPORARY;
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  llvm_cbe_item31 = llvm_cbe_item31__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__198 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__190 = llvm_cbe_tmp__198;
  llvm_cbe_tmp__199 = llvm_cbe_tmp__190;
  llvm_cbe_tmp__200 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__192)))))))));
  llvm_cbe_tmp__201 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__192))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__202 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__192))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__200)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__201)))), (llvm_mul_u64(llvm_cbe_tmp__199, llvm_cbe_tmp__202)))));
  llvm_cbe_tmp__203 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__199;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__203;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__199;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__204 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__204;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_4(uint8_t* llvm_cbe_tmp__205) {
  tmp__182(llvm_cbe_tmp__205);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__206(uint8_t* llvm_cbe_tmp__207) {
  struct l_unnamed_3* llvm_cbe_tmp__208;
  FIFO* llvm_cbe_tmp__209;
  FIFO* llvm_cbe_tmp__210;

  llvm_cbe_tmp__208 = ((struct l_unnamed_3*)llvm_cbe_tmp__207);
  llvm_cbe_tmp__209 = *((&llvm_cbe_tmp__208->field0));
  llvm_cbe_tmp__210 = *((&llvm_cbe_tmp__208->field1));
  main_OC_process3(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__209, llvm_cbe_tmp__210);
}


static void main_OC_process3(uint8_t* llvm_cbe_tmp__211, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__212;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__213;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__214;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__215;
  uint8_t* llvm_cbe_tmp__216;
  uint8_t* llvm_cbe_tmp__217;
  uint64_t llvm_cbe_tmp__218;
  uint64_t llvm_cbe_tmp__219;
  uint64_t llvm_cbe_tmp__220;
  uint64_t llvm_cbe_tmp__221;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__222;
  uint64_t llvm_cbe_tmp__223;
  uint64_t llvm_cbe_tmp__224;
  uint64_t llvm_cbe_tmp__225;
  uint64_t llvm_cbe_tmp__226;
  uint64_t llvm_cbe_tmp__227;
  uint64_t llvm_cbe_tmp__228;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__215 = memset((((uint8_t*)(&llvm_cbe_filter_row))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  llvm_cbe_tmp__216 = ((uint8_t*)(&llvm_cbe_filter_row));
  llvm_cbe_tmp__217 = memset(llvm_cbe_tmp__216, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__216))))))))) = UINT64_C(6);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__216))[((int64_t)UINT64_C(1))])))))) = UINT64_C(7);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__216))[((int64_t)UINT64_C(2))])))))) = UINT64_C(8);
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_item3 = llvm_cbe_item3__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
llvm_cbe__2e_1_2e_for_2e_body: {
  llvm_cbe_tmp__218 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__212 = llvm_cbe_tmp__218;
  llvm_cbe_tmp__219 = llvm_cbe_tmp__212;
  llvm_cbe_tmp__220 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__213 = llvm_cbe_tmp__220;
  llvm_cbe_tmp__221 = llvm_cbe_tmp__213;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__219;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__221;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_item3;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_item1 = llvm_cbe_item1__PHI_TEMPORARY;
  llvm_cbe_item2 = llvm_cbe_item2__PHI_TEMPORARY;
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  llvm_cbe_item31 = llvm_cbe_item31__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__222 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__214 = llvm_cbe_tmp__222;
  llvm_cbe_tmp__223 = llvm_cbe_tmp__214;
  llvm_cbe_tmp__224 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__216)))))))));
  llvm_cbe_tmp__225 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__216))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__226 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__216))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__224)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__225)))), (llvm_mul_u64(llvm_cbe_tmp__223, llvm_cbe_tmp__226)))));
  llvm_cbe_tmp__227 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__223;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__227;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__223;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__228 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__228;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_5(uint8_t* llvm_cbe_tmp__229) {
  tmp__206(llvm_cbe_tmp__229);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__230(uint8_t* llvm_cbe_tmp__231) {
  struct l_unnamed_4* llvm_cbe_tmp__232;
  FIFO* llvm_cbe_tmp__233;
  FIFO* llvm_cbe_tmp__234;
  FIFO* llvm_cbe_tmp__235;
  FIFO* llvm_cbe_tmp__236;

  llvm_cbe_tmp__232 = ((struct l_unnamed_4*)llvm_cbe_tmp__231);
  llvm_cbe_tmp__233 = *((&llvm_cbe_tmp__232->field0));
  llvm_cbe_tmp__234 = *((&llvm_cbe_tmp__232->field1));
  llvm_cbe_tmp__235 = *((&llvm_cbe_tmp__232->field2));
  llvm_cbe_tmp__236 = *((&llvm_cbe_tmp__232->field3));
  main_OC_process4(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__233, llvm_cbe_tmp__234, llvm_cbe_tmp__235, llvm_cbe_tmp__236);
}


static void main_OC_process4(uint8_t* llvm_cbe_tmp__237, FIFO* llvm_cbe_in1, FIFO* llvm_cbe_in2, FIFO* llvm_cbe_in3, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__238;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__239;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__240;    /* Address-exposed local */
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__241;
  uint64_t llvm_cbe_tmp__242;
  uint64_t llvm_cbe_tmp__243;
  uint64_t llvm_cbe_tmp__244;
  uint64_t llvm_cbe_tmp__245;
  uint64_t llvm_cbe_tmp__246;
  uint64_t llvm_cbe_tmp__247;
  uint64_t llvm_cbe_tmp__248;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item11;
  uint64_t llvm_cbe_item11__PHI_TEMPORARY;
  uint64_t llvm_cbe_item22;
  uint64_t llvm_cbe_item22__PHI_TEMPORARY;
  uint64_t llvm_cbe_item33;
  uint64_t llvm_cbe_item33__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item1__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  llvm_cbe_item1 = llvm_cbe_item1__PHI_TEMPORARY;
  llvm_cbe_item2 = llvm_cbe_item2__PHI_TEMPORARY;
  llvm_cbe_item3 = llvm_cbe_item3__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_item11__PHI_TEMPORARY = llvm_cbe_item1;   /* for PHI node */
    llvm_cbe_item22__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
    llvm_cbe_item33__PHI_TEMPORARY = llvm_cbe_item3;   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  llvm_cbe_item11 = llvm_cbe_item11__PHI_TEMPORARY;
  llvm_cbe_item22 = llvm_cbe_item22__PHI_TEMPORARY;
  llvm_cbe_item33 = llvm_cbe_item33__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__241 = fifo_read(llvm_cbe_in1);
  llvm_cbe_tmp__238 = llvm_cbe_tmp__241;
  llvm_cbe_tmp__242 = llvm_cbe_tmp__238;
  llvm_cbe_tmp__243 = fifo_read(llvm_cbe_in2);
  llvm_cbe_tmp__239 = llvm_cbe_tmp__243;
  llvm_cbe_tmp__244 = llvm_cbe_tmp__239;
  llvm_cbe_tmp__245 = fifo_read(llvm_cbe_in3);
  llvm_cbe_tmp__240 = llvm_cbe_tmp__245;
  llvm_cbe_tmp__246 = llvm_cbe_tmp__240;
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64(llvm_cbe_tmp__242, llvm_cbe_tmp__244)), llvm_cbe_tmp__246)));
  llvm_cbe_tmp__247 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__247;   /* for PHI node */
  llvm_cbe_item11__PHI_TEMPORARY = llvm_cbe_tmp__242;   /* for PHI node */
  llvm_cbe_item22__PHI_TEMPORARY = llvm_cbe_tmp__244;   /* for PHI node */
  llvm_cbe_item33__PHI_TEMPORARY = llvm_cbe_tmp__246;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__248 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__248;   /* for PHI node */
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item11;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_item22;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item33;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_6(uint8_t* llvm_cbe_tmp__249) {
  tmp__230(llvm_cbe_tmp__249);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


void __go_init_main(uint8_t* llvm_cbe_tmp__250) {
  return;
}


uint32_t main(void) {
  main_OC_main(((uint8_t*)/*NULL*/0));
  return 0;
}

