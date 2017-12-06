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
struct l_unnamed_1;

/* Types Definitions */
struct l_unnamed_1 {
  FIFO* field0;
  FIFO* field1;
};

/* Function definitions */

/* External Global Variable Declarations */

/* Function Declarations */
void main_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void tmp__21(uint8_t*);
static void main_OC_process1(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper(uint8_t*);
static void tmp__34(uint8_t*);
static void main_OC_process2(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_1(uint8_t*);
void __go_init_main(uint8_t*);
uint32_t main(void);


/* Global Variable Definitions and Initialization */
static bool init_EC_guard;


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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_sdiv_u64(int64_t a, int64_t b) {
  uint64_t r = a / b;
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
  goto llvm_cbe__2e_0_2e_entry;

}


void main_OC_main(uint8_t* llvm_cbe_tmp__4) {
  struct l_unnamed_1 llvm_cbe_tmp__5;    /* Address-exposed local */
  uint32_t llvm_cbe_p;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__6;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__7;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__8;    /* Address-exposed local */
  uint32_t llvm_cbe_p1;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__9;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__10;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__11;    /* Address-exposed local */
  FIFO* llvm_cbe_tmp__12;
  FIFO* llvm_cbe_tmp__13;
  FIFO* llvm_cbe_tmp__14;
  uint64_t llvm_cbe_tmp__15;
  uint8_t* llvm_cbe_tmp__16;
  uint8_t* llvm_cbe_tmp__17;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__18;
  uint64_t llvm_cbe_tmp__19;
  uint64_t llvm_cbe_tmp__20;
  uint64_t llvm_cbe_i2;
  uint64_t llvm_cbe_i2__PHI_TEMPORARY;

  llvm_cbe_tmp__12 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__13 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__14 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done:
  *((&llvm_cbe_tmp__5.field0)) = llvm_cbe_tmp__12;
  *((&llvm_cbe_tmp__5.field1)) = llvm_cbe_tmp__13;
  llvm_cbe_tmp__6 = (&llvm_cbe_p);
  llvm_cbe_tmp__7 = (&llvm_cbe_tmp__6);
  llvm_cbe_tmp__16 = *(((uint8_t**)(&llvm_cbe_tmp__7)));
  pthread_create(llvm_cbe_tmp__16, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper), (((uint8_t*)(&llvm_cbe_tmp__5))));
  *((&llvm_cbe_tmp__8.field0)) = llvm_cbe_tmp__13;
  *((&llvm_cbe_tmp__8.field1)) = llvm_cbe_tmp__14;
  llvm_cbe_tmp__9 = (&llvm_cbe_p1);
  llvm_cbe_tmp__10 = (&llvm_cbe_tmp__9);
  llvm_cbe_tmp__17 = *(((uint8_t**)(&llvm_cbe_tmp__10)));
  pthread_create(llvm_cbe_tmp__17, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_1), (((uint8_t*)(&llvm_cbe_tmp__8))));
  llvm_cbe_i2__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(10)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  fifo_write(llvm_cbe_tmp__12, (llvm_mul_u64(llvm_cbe_i, llvm_cbe_i)));
  llvm_cbe_tmp__15 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__15;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done:
  return;
  do {     /* Syntactic loop '.6.for.loop' to make GCC happy */
llvm_cbe__2e_6_2e_for_2e_loop:
  llvm_cbe_i2 = llvm_cbe_i2__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i2) < ((int64_t)UINT64_C(10)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_5_2e_for_2e_done;
  }

llvm_cbe__2e_4_2e_for_2e_body:
  llvm_cbe_tmp__18 = fifo_read(llvm_cbe_tmp__14);
  llvm_cbe_tmp__11 = llvm_cbe_tmp__18;
  llvm_cbe_tmp__19 = llvm_cbe_tmp__11;
  llvm_cbe_tmp__20 = llvm_add_u64(llvm_cbe_i2, UINT64_C(1));
  llvm_cbe_i2__PHI_TEMPORARY = llvm_cbe_tmp__20;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.6.for.loop' */
}


static void tmp__21(uint8_t* llvm_cbe_tmp__22) {
  struct l_unnamed_1* llvm_cbe_tmp__23;
  FIFO* llvm_cbe_tmp__24;
  FIFO* llvm_cbe_tmp__25;

  llvm_cbe_tmp__23 = ((struct l_unnamed_1*)llvm_cbe_tmp__22);
  llvm_cbe_tmp__24 = *((&llvm_cbe_tmp__23->field0));
  llvm_cbe_tmp__25 = *((&llvm_cbe_tmp__23->field1));
  main_OC_process1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__24, llvm_cbe_tmp__25);
}


static void main_OC_process1(uint8_t* llvm_cbe_tmp__26, FIFO* llvm_cbe_tmp__27, FIFO* llvm_cbe_tmp__28) {
  uint64_t llvm_cbe_tmp__29;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__30;
  uint64_t llvm_cbe_tmp__31;
  uint64_t llvm_cbe_tmp__32;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done:
  return;
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(10)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_tmp__30 = fifo_read(llvm_cbe_tmp__27);
  llvm_cbe_tmp__29 = llvm_cbe_tmp__30;
  llvm_cbe_tmp__31 = llvm_cbe_tmp__29;
  fifo_write(llvm_cbe_tmp__28, (llvm_add_u64((llvm_mul_u64(llvm_cbe_tmp__31, UINT64_C(2))), UINT64_C(1))));
  llvm_cbe_tmp__32 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__32;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper(uint8_t* llvm_cbe_tmp__33) {
  tmp__21(llvm_cbe_tmp__33);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__34(uint8_t* llvm_cbe_tmp__35) {
  struct l_unnamed_1* llvm_cbe_tmp__36;
  FIFO* llvm_cbe_tmp__37;
  FIFO* llvm_cbe_tmp__38;

  llvm_cbe_tmp__36 = ((struct l_unnamed_1*)llvm_cbe_tmp__35);
  llvm_cbe_tmp__37 = *((&llvm_cbe_tmp__36->field0));
  llvm_cbe_tmp__38 = *((&llvm_cbe_tmp__36->field1));
  main_OC_process2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__37, llvm_cbe_tmp__38);
}


static void main_OC_process2(uint8_t* llvm_cbe_tmp__39, FIFO* llvm_cbe_tmp__40, FIFO* llvm_cbe_tmp__41) {
  uint64_t llvm_cbe_tmp__42;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__43;
  uint64_t llvm_cbe_tmp__44;
  uint64_t llvm_cbe_tmp__45;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done:
  return;
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)UINT64_C(10)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  llvm_cbe_tmp__43 = fifo_read(llvm_cbe_tmp__40);
  llvm_cbe_tmp__42 = llvm_cbe_tmp__43;
  llvm_cbe_tmp__44 = llvm_cbe_tmp__42;
  fifo_write(llvm_cbe_tmp__41, (llvm_sdiv_u64((llvm_sub_u64(llvm_cbe_tmp__44, UINT64_C(1))), UINT64_C(2))));
  llvm_cbe_tmp__45 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__45;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_1(uint8_t* llvm_cbe_tmp__46) {
  tmp__34(llvm_cbe_tmp__46);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


void __go_init_main(uint8_t* llvm_cbe_tmp__47) {
  return;
}


uint32_t main(void) {
  main_OC_main(((uint8_t*)/*NULL*/0));
  return 0;
}

