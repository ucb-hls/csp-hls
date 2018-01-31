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
struct l_unnamed_4;
struct l_struct_method;
struct l_struct_methodSlice;
struct l_struct_uncommonType;
struct l_struct_commonType;
struct l_unnamed_1;
struct l_unnamed_2;
struct l_unnamed_3;
struct l_unnamed_5;
struct l_unnamed_6;
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
struct l_array_256_uint64_t {
  uint64_t array[256];
};
struct l_array_256_struct_AC_l_array_256_uint64_t {
  struct l_array_256_uint64_t array[256];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_4_uint8_t_KC_ {
  uint8_t* array[4];
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_unnamed_1 {
  FIFO* field0;
};
struct l_unnamed_2 {
  FIFO* field0;
  FIFO* field1;
};
struct l_unnamed_3 {
  uint8_t* field0;
  uint8_t* field1;
};
struct l_array_2_struct_AC_l_unnamed_3 {
  struct l_unnamed_3 array[2];
};
struct l_unnamed_5 {
  uint8_t* field0;
  uint64_t field1;
  uint64_t field2;
};
struct l_unnamed_6 {
  uint64_t field0;
  struct l_unnamed_3 field1;
};
struct l_array_2_struct_AC_l_array_256_uint64_t {
  struct l_array_256_uint64_t array[2];
};

/* Function definitions */


/* External Global Variable Declarations */
struct l_struct_funcVal __go_type_hash_string_descriptor;
struct l_struct_funcVal __go_type_equal_string_descriptor;
struct l_struct_funcVal __go_type_hash_identity_descriptor;
struct l_struct_funcVal __go_type_equal_identity_descriptor;

/* Function Declarations */
void main_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void tmp__47(uint8_t*);
static void main_OC_stream_data(uint8_t*, FIFO*);
static uint8_t* auto_pthread_wrapper(uint8_t*);
static void tmp__55(uint8_t*);
static void main_OC_process1(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_1(uint8_t*);
static void tmp__73(uint8_t*);
static void main_OC_process2(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_2(uint8_t*);
struct l_unnamed_6 fmt_OC_Println(uint8_t*, struct l_unnamed_5);
void __go_init_main(uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);
uint32_t main(void);


/* Global Variable Definitions and Initialization */
static struct l_array_256_struct_AC_l_array_256_uint64_t main_OC_array;
static bool init_EC_guard;
static struct l_array_10_uint8_t tmp__46 = { { 99u, 104u, 101u, 99u, 107u, 115u, 117u, 109u, 58, 32 } };
struct l_struct_commonType __go_tdn_string __attribute__((common)) = { 24, 8, 8, UINT64_C(16), 100666096, (&__go_type_hash_string_descriptor), (&__go_type_equal_string_descriptor), ((uint8_t*)(&__go_tdn_string_EC_gc)), (&tmp__100), (&tmp__101), ((struct l_struct_commonType*)/*NULL*/0) };
struct l_struct_commonType __go_tdn_int __attribute__((common)) = { 130u, 8, 8, UINT64_C(8), 50332917, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_tdn_int_EC_gc)), (&tmp__102), (&tmp__103), ((struct l_struct_commonType*)/*NULL*/0) };
static struct l_array_3_uint8_t tmp__104 = { { 105u, 110u, 116u } };
static struct l_unnamed_4 tmp__102 = { ((&tmp__104.array[((int32_t)0)])), UINT64_C(3) };
static struct l_array_3_uint8_t tmp__105 = { { 105u, 110u, 116u } };
static struct l_unnamed_4 tmp__106 = { ((&tmp__105.array[((int32_t)0)])), UINT64_C(3) };
static struct l_struct_uncommonType tmp__103 = { (&tmp__106), ((struct l_unnamed_4*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_int_EC_gc __attribute__((common)) = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)/*NULL*/0) } };
static struct l_array_6_uint8_t tmp__107 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_4 tmp__100 = { ((&tmp__107.array[((int32_t)0)])), UINT64_C(6) };
static struct l_array_6_uint8_t tmp__108 = { { 115u, 116u, 114u, 105u, 110u, 103u } };
static struct l_unnamed_4 tmp__109 = { ((&tmp__108.array[((int32_t)0)])), UINT64_C(6) };
static struct l_struct_uncommonType tmp__101 = { (&tmp__109), ((struct l_unnamed_4*)/*NULL*/0), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_sdiv_u64(int64_t a, int64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_srem_u64(int64_t a, int64_t b) {
  uint64_t r = a % b;
  return r;
}
static __forceinline struct l_unnamed_4 llvm_ctor_unnamed_4(uint8_t* x0, uint64_t x1) {
  struct l_unnamed_4 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_3 llvm_ctor_unnamed_3(uint8_t* x0, uint8_t* x1) {
  struct l_unnamed_3 r;
  r.field0 = x0;
  r.field1 = x1;
  return r;
}
static __forceinline struct l_unnamed_5 llvm_ctor_unnamed_5(uint8_t* x0, uint64_t x1, uint64_t x2) {
  struct l_unnamed_5 r;
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
  struct l_unnamed_1 llvm_cbe_tmp__5;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__6;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__7;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__8;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id1;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__9;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__10;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__11;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id2;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__12;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__13;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__14;    /* Address-exposed local */
  struct l_array_2_struct_AC_l_unnamed_3 llvm_cbe_varargs;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__15;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__16;    /* Address-exposed local */
  struct l_unnamed_5 llvm_cbe_tmp__17;    /* Address-exposed local */
  struct l_unnamed_6 llvm_cbe_tmp__18;    /* Address-exposed local */
  struct l_array_256_struct_AC_l_array_256_uint64_t llvm_cbe_result;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__19;
  uint8_t* llvm_cbe_tmp__20;
  FIFO* llvm_cbe_tmp__21;
  FIFO* llvm_cbe_tmp__22;
  FIFO* llvm_cbe_tmp__23;
  uint8_t* llvm_cbe_tmp__24;
  uint8_t* llvm_cbe_tmp__25;
  uint8_t* llvm_cbe_tmp__26;
  uint8_t* llvm_cbe_tmp__27;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__28;
  uint64_t llvm_cbe_tmp__29;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_i3;
  uint64_t llvm_cbe_i3__PHI_TEMPORARY;
  uint64_t llvm_cbe_item;
  uint64_t llvm_cbe_item__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__30;
  uint64_t llvm_cbe_tmp__31;
  uint64_t llvm_cbe_tmp__32;
  uint64_t llvm_cbe_tmp__33;
  uint64_t llvm_cbe_j4;
  uint64_t llvm_cbe_j4__PHI_TEMPORARY;
  uint64_t llvm_cbe_item5;
  uint64_t llvm_cbe_item5__PHI_TEMPORARY;
  uint8_t* llvm_cbe_tmp__34;
  struct l_unnamed_3 llvm_cbe_tmp__35;
  struct l_unnamed_3 llvm_cbe_tmp__36;
  struct l_unnamed_5 llvm_cbe_tmp__37;
  struct l_unnamed_5 llvm_cbe_tmp__38;
  struct l_unnamed_5 llvm_cbe_tmp__39;
  uint64_t llvm_cbe_tmp__40;
  struct l_unnamed_3 llvm_cbe_tmp__41;
  uint64_t llvm_cbe_checksum;
  uint64_t llvm_cbe_checksum__PHI_TEMPORARY;
  uint64_t llvm_cbe_i6;
  uint64_t llvm_cbe_i6__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__42;
  uint64_t llvm_cbe_tmp__43;
  uint64_t llvm_cbe_tmp__44;
  uint64_t llvm_cbe_tmp__45;
  uint64_t llvm_cbe_checksum7;
  uint64_t llvm_cbe_checksum7__PHI_TEMPORARY;
  uint64_t llvm_cbe_j8;
  uint64_t llvm_cbe_j8__PHI_TEMPORARY;

  llvm_cbe_tmp__19 = memset((((uint8_t*)(&llvm_cbe_result))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(65536))))));
  llvm_cbe_tmp__20 = ((uint8_t*)(&llvm_cbe_result));
  llvm_cbe_tmp__21 = fifo_malloc(64u, UINT64_C(65536));
  llvm_cbe_tmp__22 = fifo_malloc(64u, UINT64_C(65536));
  llvm_cbe_tmp__23 = fifo_malloc(64u, UINT64_C(65536));
  llvm_cbe_tmp__24 = memset(llvm_cbe_tmp__20, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(65536))))));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  *((&llvm_cbe_tmp__5.field0)) = llvm_cbe_tmp__21;
  llvm_cbe_tmp__6 = (&llvm_cbe_thread_id);
  llvm_cbe_tmp__7 = (&llvm_cbe_tmp__6);
  llvm_cbe_tmp__25 = *(((uint8_t**)(&llvm_cbe_tmp__7)));
  pthread_create(llvm_cbe_tmp__25, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper), (((uint8_t*)(&llvm_cbe_tmp__5))));
  *((&llvm_cbe_tmp__8.field0)) = llvm_cbe_tmp__21;
  *((&llvm_cbe_tmp__8.field1)) = llvm_cbe_tmp__22;
  llvm_cbe_tmp__9 = (&llvm_cbe_thread_id1);
  llvm_cbe_tmp__10 = (&llvm_cbe_tmp__9);
  llvm_cbe_tmp__26 = *(((uint8_t**)(&llvm_cbe_tmp__10)));
  pthread_create(llvm_cbe_tmp__26, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_1), (((uint8_t*)(&llvm_cbe_tmp__8))));
  *((&llvm_cbe_tmp__11.field0)) = llvm_cbe_tmp__22;
  *((&llvm_cbe_tmp__11.field1)) = llvm_cbe_tmp__23;
  llvm_cbe_tmp__12 = (&llvm_cbe_thread_id2);
  llvm_cbe_tmp__13 = (&llvm_cbe_tmp__12);
  llvm_cbe_tmp__27 = *(((uint8_t**)(&llvm_cbe_tmp__13)));
  pthread_create(llvm_cbe_tmp__27, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_2), (((uint8_t*)(&llvm_cbe_tmp__11))));
  llvm_cbe_i3__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&((&main_OC_array.array[((int32_t)0)]))[((int64_t)llvm_cbe_i)]))))))[((int64_t)llvm_cbe_j)])))))) = (llvm_srem_u64((llvm_add_u64(llvm_cbe_i, llvm_cbe_j)), UINT64_C(255)));
  llvm_cbe_tmp__28 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__28;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__29 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__29;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
  do {     /* Syntactic loop '.9.for.loop' to make GCC happy */
llvm_cbe__2e_9_2e_for_2e_loop: {
  llvm_cbe_i3 = llvm_cbe_i3__PHI_TEMPORARY;
  llvm_cbe_item = llvm_cbe_item__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i3) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    llvm_cbe_j4__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_item5__PHI_TEMPORARY = llvm_cbe_item;   /* for PHI node */
    goto llvm_cbe__2e_12_2e_for_2e_loop;
  } else {
    llvm_cbe_checksum__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_i6__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_15_2e_for_2e_loop;
  }

}
  do {     /* Syntactic loop '.12.for.loop' to make GCC happy */
llvm_cbe__2e_12_2e_for_2e_loop: {
  llvm_cbe_j4 = llvm_cbe_j4__PHI_TEMPORARY;
  llvm_cbe_item5 = llvm_cbe_item5__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j4) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_10_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_11_2e_for_2e_done;
  }

}
llvm_cbe__2e_10_2e_for_2e_body: {
  llvm_cbe_tmp__30 = fifo_read(llvm_cbe_tmp__23);
  llvm_cbe_tmp__14 = llvm_cbe_tmp__30;
  llvm_cbe_tmp__31 = llvm_cbe_tmp__14;
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_256_uint64_t*)llvm_cbe_tmp__20))[((int64_t)llvm_cbe_i3)]))))))[((int64_t)llvm_cbe_j4)])))))) = llvm_cbe_tmp__31;
  llvm_cbe_tmp__32 = llvm_add_u64(llvm_cbe_j4, UINT64_C(1));
  llvm_cbe_j4__PHI_TEMPORARY = llvm_cbe_tmp__32;   /* for PHI node */
  llvm_cbe_item5__PHI_TEMPORARY = llvm_cbe_tmp__31;   /* for PHI node */
  goto llvm_cbe__2e_12_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.12.for.loop' */
llvm_cbe__2e_11_2e_for_2e_done: {
  llvm_cbe_tmp__33 = llvm_add_u64(llvm_cbe_i3, UINT64_C(1));
  llvm_cbe_i3__PHI_TEMPORARY = llvm_cbe_tmp__33;   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = llvm_cbe_item5;   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.9.for.loop' */
llvm_cbe__2e_14_2e_for_2e_done: {
  llvm_cbe_tmp__34 = ((uint8_t*)(&llvm_cbe_varargs));
  llvm_cbe_tmp__15 = llvm_ctor_unnamed_4(((&tmp__46.array[((int32_t)0)])), UINT64_C(10));
  llvm_cbe_tmp__35 = llvm_ctor_unnamed_3(((&__go_tdn_string.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__35.field1 = (((uint8_t*)(&llvm_cbe_tmp__15)));
  *(((struct l_unnamed_3*)(((uint8_t*)((&(*(((struct l_unnamed_3*)llvm_cbe_tmp__34))))))))) = llvm_cbe_tmp__35;
  llvm_cbe_tmp__16 = llvm_cbe_checksum;
  llvm_cbe_tmp__36 = llvm_ctor_unnamed_3(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__36.field1 = (((uint8_t*)(&llvm_cbe_tmp__16)));
  *(((struct l_unnamed_3*)(((uint8_t*)((&(((struct l_unnamed_3*)llvm_cbe_tmp__34))[((int64_t)UINT64_C(1))])))))) = llvm_cbe_tmp__36;
  llvm_cbe_tmp__37 = llvm_ctor_unnamed_5(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__37.field0 = ((&(*llvm_cbe_tmp__34)));
  llvm_cbe_tmp__38 = llvm_cbe_tmp__37;
  llvm_cbe_tmp__38.field1 = UINT64_C(2);
  llvm_cbe_tmp__39 = llvm_cbe_tmp__38;
  llvm_cbe_tmp__39.field2 = UINT64_C(2);
  llvm_cbe_tmp__17 = llvm_cbe_tmp__39;
  llvm_cbe_tmp__18 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__17);
  llvm_cbe_tmp__40 = *((&llvm_cbe_tmp__18.field0));
  llvm_cbe_tmp__41 = *((&llvm_cbe_tmp__18.field1));
  return;
}
  do {     /* Syntactic loop '.15.for.loop' to make GCC happy */
llvm_cbe__2e_15_2e_for_2e_loop: {
  llvm_cbe_checksum = llvm_cbe_checksum__PHI_TEMPORARY;
  llvm_cbe_i6 = llvm_cbe_i6__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i6) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    llvm_cbe_checksum7__PHI_TEMPORARY = llvm_cbe_checksum;   /* for PHI node */
    llvm_cbe_j8__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_18_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_14_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.18.for.loop' to make GCC happy */
llvm_cbe__2e_18_2e_for_2e_loop: {
  llvm_cbe_checksum7 = llvm_cbe_checksum7__PHI_TEMPORARY;
  llvm_cbe_j8 = llvm_cbe_j8__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j8) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_16_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_17_2e_for_2e_done;
  }

}
llvm_cbe__2e_16_2e_for_2e_body: {
  llvm_cbe_tmp__42 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_256_uint64_t*)llvm_cbe_tmp__20))[((int64_t)llvm_cbe_i6)]))))))[((int64_t)llvm_cbe_j8)]))))));
  llvm_cbe_tmp__43 = llvm_add_u64(llvm_cbe_checksum7, llvm_cbe_tmp__42);
  llvm_cbe_tmp__44 = llvm_add_u64(llvm_cbe_j8, UINT64_C(1));
  llvm_cbe_checksum7__PHI_TEMPORARY = llvm_cbe_tmp__43;   /* for PHI node */
  llvm_cbe_j8__PHI_TEMPORARY = llvm_cbe_tmp__44;   /* for PHI node */
  goto llvm_cbe__2e_18_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.18.for.loop' */
llvm_cbe__2e_17_2e_for_2e_done: {
  llvm_cbe_tmp__45 = llvm_add_u64(llvm_cbe_i6, UINT64_C(1));
  llvm_cbe_checksum__PHI_TEMPORARY = llvm_cbe_checksum7;   /* for PHI node */
  llvm_cbe_i6__PHI_TEMPORARY = llvm_cbe_tmp__45;   /* for PHI node */
  goto llvm_cbe__2e_15_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.15.for.loop' */
}


static void tmp__47(uint8_t* llvm_cbe_tmp__48) {
  FIFO* llvm_cbe_tmp__49;

  llvm_cbe_tmp__49 = *((&(((struct l_unnamed_1*)llvm_cbe_tmp__48))->field0));
  main_OC_stream_data(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__49);
}


static void main_OC_stream_data(uint8_t* llvm_cbe_tmp__50, FIFO* llvm_cbe_channel) {
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__51;
  uint64_t llvm_cbe_tmp__52;
  uint64_t llvm_cbe_tmp__53;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
llvm_cbe__2e_1_2e_for_2e_body: {
  fifo_write(llvm_cbe_channel, UINT64_C(0));
  llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__51 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&((&main_OC_array.array[((int32_t)0)]))[((int64_t)llvm_cbe_i)]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_channel, llvm_cbe_tmp__51);
  llvm_cbe_tmp__52 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__52;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  fifo_write(llvm_cbe_channel, UINT64_C(0));
  llvm_cbe_tmp__53 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__53;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper(uint8_t* llvm_cbe_tmp__54) {
  tmp__47(llvm_cbe_tmp__54);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__55(uint8_t* llvm_cbe_tmp__56) {
  struct l_unnamed_2* llvm_cbe_tmp__57;
  FIFO* llvm_cbe_tmp__58;
  FIFO* llvm_cbe_tmp__59;

  llvm_cbe_tmp__57 = ((struct l_unnamed_2*)llvm_cbe_tmp__56);
  llvm_cbe_tmp__58 = *((&llvm_cbe_tmp__57->field0));
  llvm_cbe_tmp__59 = *((&llvm_cbe_tmp__57->field1));
  main_OC_process1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__58, llvm_cbe_tmp__59);
}


static void main_OC_process1(uint8_t* llvm_cbe_tmp__60, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__61;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__62;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__63;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__64;
  uint64_t llvm_cbe_tmp__65;
  uint64_t llvm_cbe_tmp__66;
  uint64_t llvm_cbe_tmp__67;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__68;
  uint64_t llvm_cbe_tmp__69;
  uint64_t llvm_cbe_tmp__70;
  uint64_t llvm_cbe_tmp__71;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

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
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

}
llvm_cbe__2e_1_2e_for_2e_body: {
  llvm_cbe_tmp__64 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__61 = llvm_cbe_tmp__64;
  llvm_cbe_tmp__65 = llvm_cbe_tmp__61;
  llvm_cbe_tmp__66 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__62 = llvm_cbe_tmp__66;
  llvm_cbe_tmp__67 = llvm_cbe_tmp__62;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__65;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__67;   /* for PHI node */
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
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__68 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__63 = llvm_cbe_tmp__68;
  llvm_cbe_tmp__69 = llvm_cbe_tmp__63;
  fifo_write(llvm_cbe_out, (llvm_sdiv_u64((llvm_add_u64((llvm_add_u64(llvm_cbe_item1, llvm_cbe_item2)), llvm_cbe_tmp__69)), UINT64_C(3))));
  llvm_cbe_tmp__70 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__69;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__70;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__69;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__71 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__71;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_1(uint8_t* llvm_cbe_tmp__72) {
  tmp__55(llvm_cbe_tmp__72);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__73(uint8_t* llvm_cbe_tmp__74) {
  struct l_unnamed_2* llvm_cbe_tmp__75;
  FIFO* llvm_cbe_tmp__76;
  FIFO* llvm_cbe_tmp__77;

  llvm_cbe_tmp__75 = ((struct l_unnamed_2*)llvm_cbe_tmp__74);
  llvm_cbe_tmp__76 = *((&llvm_cbe_tmp__75->field0));
  llvm_cbe_tmp__77 = *((&llvm_cbe_tmp__75->field1));
  main_OC_process2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__76, llvm_cbe_tmp__77);
}


static void main_OC_process2(uint8_t* llvm_cbe_tmp__78, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__79;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__80;    /* Address-exposed local */
  struct l_array_2_struct_AC_l_array_256_uint64_t llvm_cbe_buffer;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__81;
  uint8_t* llvm_cbe_tmp__82;
  uint8_t* llvm_cbe_tmp__83;
  uint64_t llvm_cbe_tmp__84;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__85;
  uint64_t llvm_cbe_tmp__86;
  uint64_t llvm_cbe_tmp__87;
  uint64_t llvm_cbe_i1;
  uint64_t llvm_cbe_i1__PHI_TEMPORARY;
  uint64_t llvm_cbe_pos;
  uint64_t llvm_cbe_pos__PHI_TEMPORARY;
  uint64_t llvm_cbe_i2;
  uint64_t llvm_cbe_i2__PHI_TEMPORARY;
  uint64_t llvm_cbe_item;
  uint64_t llvm_cbe_item__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__88;
  uint64_t llvm_cbe_tmp__89;
  uint64_t llvm_cbe_tmp__90;
  uint64_t llvm_cbe_tmp__91;
  uint64_t llvm_cbe_tmp__92;
  uint64_t llvm_cbe_tmp__93;
  uint64_t llvm_cbe_tmp__94;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__95;
  uint64_t llvm_cbe_tmp__96;
  uint64_t llvm_cbe_tmp__97;
  uint64_t llvm_cbe_j4;
  uint64_t llvm_cbe_j4__PHI_TEMPORARY;

  llvm_cbe_tmp__81 = memset((((uint8_t*)(&llvm_cbe_buffer))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(512))))));
  llvm_cbe_tmp__82 = ((uint8_t*)(&llvm_cbe_buffer));
  llvm_cbe_tmp__83 = memset(llvm_cbe_tmp__82, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(512))))));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop: {
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    llvm_cbe_i1__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_6_2e_for_2e_loop;
  }

}
llvm_cbe__2e_1_2e_for_2e_body: {
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(*(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82)))))))))[((int64_t)llvm_cbe_i)])))))) = UINT64_C(0);
  llvm_cbe_tmp__84 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__84;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop: {
  llvm_cbe_i1 = llvm_cbe_i1__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i1) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    llvm_cbe_pos__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_i2__PHI_TEMPORARY = UINT64_C(1);   /* for PHI node */
    llvm_cbe_item__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_9_2e_for_2e_loop;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__85 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__79 = llvm_cbe_tmp__85;
  llvm_cbe_tmp__86 = llvm_cbe_tmp__79;
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82))[((int64_t)UINT64_C(1))]))))))[((int64_t)llvm_cbe_i1)])))))) = llvm_cbe_tmp__86;
  llvm_cbe_tmp__87 = llvm_add_u64(llvm_cbe_i1, UINT64_C(1));
  llvm_cbe_i1__PHI_TEMPORARY = llvm_cbe_tmp__87;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
  do {     /* Syntactic loop '.9.for.loop' to make GCC happy */
llvm_cbe__2e_9_2e_for_2e_loop: {
  llvm_cbe_pos = llvm_cbe_pos__PHI_TEMPORARY;
  llvm_cbe_i2 = llvm_cbe_i2__PHI_TEMPORARY;
  llvm_cbe_item = llvm_cbe_item__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i2) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    llvm_cbe_j__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item;   /* for PHI node */
    goto llvm_cbe__2e_12_2e_for_2e_loop;
  } else {
    llvm_cbe_j4__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_15_2e_for_2e_loop;
  }

}
  do {     /* Syntactic loop '.12.for.loop' to make GCC happy */
llvm_cbe__2e_12_2e_for_2e_loop: {
  llvm_cbe_j = llvm_cbe_j__PHI_TEMPORARY;
  llvm_cbe_item3 = llvm_cbe_item3__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_10_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_11_2e_for_2e_done;
  }

}
llvm_cbe__2e_10_2e_for_2e_body: {
  llvm_cbe_tmp__88 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__80 = llvm_cbe_tmp__88;
  llvm_cbe_tmp__89 = llvm_cbe_tmp__80;
  llvm_cbe_tmp__90 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(*(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82)))))))))[((int64_t)llvm_cbe_j)]))))));
  llvm_cbe_tmp__91 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82))[((int64_t)UINT64_C(1))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_out, (llvm_sdiv_u64((llvm_add_u64((llvm_add_u64(llvm_cbe_tmp__90, llvm_cbe_tmp__91)), llvm_cbe_tmp__89)), UINT64_C(3))));
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82))[((int64_t)llvm_cbe_pos)]))))))[((int64_t)llvm_cbe_j)])))))) = llvm_cbe_tmp__89;
  llvm_cbe_tmp__92 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__92;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_tmp__89;   /* for PHI node */
  goto llvm_cbe__2e_12_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.12.for.loop' */
llvm_cbe__2e_11_2e_for_2e_done: {
  llvm_cbe_tmp__93 = llvm_sub_u64(UINT64_C(1), llvm_cbe_pos);
  llvm_cbe_tmp__94 = llvm_add_u64(llvm_cbe_i2, UINT64_C(1));
  llvm_cbe_pos__PHI_TEMPORARY = llvm_cbe_tmp__93;   /* for PHI node */
  llvm_cbe_i2__PHI_TEMPORARY = llvm_cbe_tmp__94;   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = llvm_cbe_item3;   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.9.for.loop' */
llvm_cbe__2e_14_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.15.for.loop' to make GCC happy */
llvm_cbe__2e_15_2e_for_2e_loop: {
  llvm_cbe_j4 = llvm_cbe_j4__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j4) < ((int64_t)UINT64_C(256)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_13_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_14_2e_for_2e_done;
  }

}
llvm_cbe__2e_13_2e_for_2e_body: {
  llvm_cbe_tmp__95 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(*(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82)))))))))[((int64_t)llvm_cbe_j4)]))))));
  llvm_cbe_tmp__96 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_256_uint64_t*)llvm_cbe_tmp__82))[((int64_t)UINT64_C(1))]))))))[((int64_t)llvm_cbe_j4)]))))));
  fifo_write(llvm_cbe_out, (llvm_sdiv_u64((llvm_add_u64((llvm_add_u64(llvm_cbe_tmp__95, llvm_cbe_tmp__96)), UINT64_C(0))), UINT64_C(3))));
  llvm_cbe_tmp__97 = llvm_add_u64(llvm_cbe_j4, UINT64_C(1));
  llvm_cbe_j4__PHI_TEMPORARY = llvm_cbe_tmp__97;   /* for PHI node */
  goto llvm_cbe__2e_15_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.15.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_2(uint8_t* llvm_cbe_tmp__98) {
  tmp__73(llvm_cbe_tmp__98);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


void __go_init_main(uint8_t* llvm_cbe_tmp__99) {
  return;
}


uint32_t main(void) {
  main_OC_main(((uint8_t*)/*NULL*/0));
  return 0;
}

