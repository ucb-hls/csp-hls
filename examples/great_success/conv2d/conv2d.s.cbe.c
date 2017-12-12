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
struct l_unnamed_2;
struct l_unnamed_3;

/* Types Definitions */
struct l_array_8_uint64_t {
  uint64_t array[8];
};
struct l_array_8_struct_AC_l_array_8_uint64_t {
  struct l_array_8_uint64_t array[8];
};
struct l_unnamed_1 {
  FIFO* field0;
};
struct l_unnamed_2 {
  FIFO* field0;
  FIFO* field1;
};
struct l_unnamed_3 {
  FIFO* field0;
  FIFO* field1;
  FIFO* field2;
  FIFO* field3;
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

/* External Global Variable Declarations */

/* Function Declarations */
void main_OC__OC_import(uint8_t*);
static void main_OC_init1(uint8_t*, FIFO*);
static void main_OC_init2(uint8_t*, FIFO*);
static void main_OC_init3(uint8_t*, FIFO*);
void main_OC_main(uint8_t*);
static void tmp__66(uint8_t*);
static uint8_t* auto_pthread_wrapper(uint8_t*);
static void tmp__70(uint8_t*);
static uint8_t* auto_pthread_wrapper_OC_1(uint8_t*);
static void tmp__74(uint8_t*);
static uint8_t* auto_pthread_wrapper_OC_2(uint8_t*);
static void tmp__78(uint8_t*);
static void main_OC_process1(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_3(uint8_t*);
static void tmp__102(uint8_t*);
static void main_OC_process2(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_4(uint8_t*);
static void tmp__126(uint8_t*);
static void main_OC_process3(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_5(uint8_t*);
static void tmp__150(uint8_t*);
static void main_OC_process4(uint8_t*, FIFO*, FIFO*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_6(uint8_t*);
void __go_init_main(uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);
uint32_t main(void);


/* Global Variable Definitions and Initialization */
static struct l_array_8_struct_AC_l_array_8_uint64_t main_OC_array;
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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_srem_u64(int64_t a, int64_t b) {
  uint64_t r = a % b;
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


static void main_OC_init1(uint8_t* llvm_cbe_tmp__4, FIFO* llvm_cbe_in) {
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__5;
  uint64_t llvm_cbe_tmp__6;
  uint64_t llvm_cbe_tmp__7;
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
  llvm_cbe_tmp__5 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&((&main_OC_array.array[((int32_t)0)]))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(0))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_in, llvm_cbe_tmp__5);
  llvm_cbe_tmp__6 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__6;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__7 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__7;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void main_OC_init2(uint8_t* llvm_cbe_tmp__8, FIFO* llvm_cbe_in) {
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__9;
  uint64_t llvm_cbe_tmp__10;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__11;

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
  llvm_cbe_tmp__11 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j) < ((int64_t)UINT64_C(8)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_4_2e_for_2e_body;
  } else {
    llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__11;   /* for PHI node */
    goto llvm_cbe__2e_3_2e_for_2e_loop;
  }

}
llvm_cbe__2e_4_2e_for_2e_body: {
  llvm_cbe_tmp__9 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&((&main_OC_array.array[((int32_t)0)]))[((int64_t)llvm_cbe_tmp__11)]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_in, llvm_cbe_tmp__9);
  llvm_cbe_tmp__10 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__10;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void main_OC_init3(uint8_t* llvm_cbe_tmp__12, FIFO* llvm_cbe_in) {
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__13;
  uint64_t llvm_cbe_tmp__14;
  uint64_t llvm_cbe_tmp__15;
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
  llvm_cbe_tmp__13 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&((&main_OC_array.array[((int32_t)0)]))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(2))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_in, llvm_cbe_tmp__13);
  llvm_cbe_tmp__14 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__14;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__15 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__15;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


void main_OC_main(uint8_t* llvm_cbe_tmp__16) {
  struct l_unnamed_1 llvm_cbe_tmp__17;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__18;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__19;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__20;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id1;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__21;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__22;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_tmp__23;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id2;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__24;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__25;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__26;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id3;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__27;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__28;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__29;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id4;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__30;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__31;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__32;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id5;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__33;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__34;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__35;    /* Address-exposed local */
  uint32_t llvm_cbe_thread_id6;    /* Address-exposed local */
  uint32_t* llvm_cbe_tmp__36;    /* Address-exposed local */
  uint32_t** llvm_cbe_tmp__37;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__38;    /* Address-exposed local */
  struct l_array_6_struct_AC_l_array_6_uint64_t llvm_cbe_result;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__39;
  uint8_t* llvm_cbe_tmp__40;
  FIFO* llvm_cbe_tmp__41;
  FIFO* llvm_cbe_tmp__42;
  FIFO* llvm_cbe_tmp__43;
  FIFO* llvm_cbe_tmp__44;
  FIFO* llvm_cbe_tmp__45;
  FIFO* llvm_cbe_tmp__46;
  FIFO* llvm_cbe_tmp__47;
  uint8_t* llvm_cbe_tmp__48;
  uint8_t* llvm_cbe_tmp__49;
  uint8_t* llvm_cbe_tmp__50;
  uint8_t* llvm_cbe_tmp__51;
  uint8_t* llvm_cbe_tmp__52;
  uint8_t* llvm_cbe_tmp__53;
  uint8_t* llvm_cbe_tmp__54;
  uint8_t* llvm_cbe_tmp__55;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__56;
  uint64_t llvm_cbe_tmp__57;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_i7;
  uint64_t llvm_cbe_i7__PHI_TEMPORARY;
  uint64_t llvm_cbe_item;
  uint64_t llvm_cbe_item__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__58;
  uint64_t llvm_cbe_tmp__59;
  uint64_t llvm_cbe_tmp__60;
  uint64_t llvm_cbe_tmp__61;
  uint64_t llvm_cbe_j8;
  uint64_t llvm_cbe_j8__PHI_TEMPORARY;
  uint64_t llvm_cbe_item9;
  uint64_t llvm_cbe_item9__PHI_TEMPORARY;
  uint64_t llvm_cbe_checksum;
  uint64_t llvm_cbe_checksum__PHI_TEMPORARY;
  uint64_t llvm_cbe_i10;
  uint64_t llvm_cbe_i10__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__62;
  uint64_t llvm_cbe_tmp__63;
  uint64_t llvm_cbe_tmp__64;
  uint64_t llvm_cbe_tmp__65;
  uint64_t llvm_cbe_checksum11;
  uint64_t llvm_cbe_checksum11__PHI_TEMPORARY;
  uint64_t llvm_cbe_j12;
  uint64_t llvm_cbe_j12__PHI_TEMPORARY;

  llvm_cbe_tmp__39 = memset((((uint8_t*)(&llvm_cbe_result))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(36))))));
  llvm_cbe_tmp__40 = ((uint8_t*)(&llvm_cbe_result));
  llvm_cbe_tmp__41 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__42 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__43 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__44 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__45 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__46 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_tmp__47 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__48 = memset(llvm_cbe_tmp__40, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(36))))));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  *((&llvm_cbe_tmp__17.field0)) = llvm_cbe_tmp__41;
  llvm_cbe_tmp__18 = (&llvm_cbe_thread_id);
  llvm_cbe_tmp__19 = (&llvm_cbe_tmp__18);
  llvm_cbe_tmp__49 = *(((uint8_t**)(&llvm_cbe_tmp__19)));
  pthread_create(llvm_cbe_tmp__49, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper), (((uint8_t*)(&llvm_cbe_tmp__17))));
  *((&llvm_cbe_tmp__20.field0)) = llvm_cbe_tmp__42;
  llvm_cbe_tmp__21 = (&llvm_cbe_thread_id1);
  llvm_cbe_tmp__22 = (&llvm_cbe_tmp__21);
  llvm_cbe_tmp__50 = *(((uint8_t**)(&llvm_cbe_tmp__22)));
  pthread_create(llvm_cbe_tmp__50, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_1), (((uint8_t*)(&llvm_cbe_tmp__20))));
  *((&llvm_cbe_tmp__23.field0)) = llvm_cbe_tmp__43;
  llvm_cbe_tmp__24 = (&llvm_cbe_thread_id2);
  llvm_cbe_tmp__25 = (&llvm_cbe_tmp__24);
  llvm_cbe_tmp__51 = *(((uint8_t**)(&llvm_cbe_tmp__25)));
  pthread_create(llvm_cbe_tmp__51, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_2), (((uint8_t*)(&llvm_cbe_tmp__23))));
  *((&llvm_cbe_tmp__26.field0)) = llvm_cbe_tmp__41;
  *((&llvm_cbe_tmp__26.field1)) = llvm_cbe_tmp__44;
  llvm_cbe_tmp__27 = (&llvm_cbe_thread_id3);
  llvm_cbe_tmp__28 = (&llvm_cbe_tmp__27);
  llvm_cbe_tmp__52 = *(((uint8_t**)(&llvm_cbe_tmp__28)));
  pthread_create(llvm_cbe_tmp__52, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_3), (((uint8_t*)(&llvm_cbe_tmp__26))));
  *((&llvm_cbe_tmp__29.field0)) = llvm_cbe_tmp__42;
  *((&llvm_cbe_tmp__29.field1)) = llvm_cbe_tmp__45;
  llvm_cbe_tmp__30 = (&llvm_cbe_thread_id4);
  llvm_cbe_tmp__31 = (&llvm_cbe_tmp__30);
  llvm_cbe_tmp__53 = *(((uint8_t**)(&llvm_cbe_tmp__31)));
  pthread_create(llvm_cbe_tmp__53, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_4), (((uint8_t*)(&llvm_cbe_tmp__29))));
  *((&llvm_cbe_tmp__32.field0)) = llvm_cbe_tmp__43;
  *((&llvm_cbe_tmp__32.field1)) = llvm_cbe_tmp__46;
  llvm_cbe_tmp__33 = (&llvm_cbe_thread_id5);
  llvm_cbe_tmp__34 = (&llvm_cbe_tmp__33);
  llvm_cbe_tmp__54 = *(((uint8_t**)(&llvm_cbe_tmp__34)));
  pthread_create(llvm_cbe_tmp__54, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_5), (((uint8_t*)(&llvm_cbe_tmp__32))));
  *((&llvm_cbe_tmp__35.field0)) = llvm_cbe_tmp__44;
  *((&llvm_cbe_tmp__35.field1)) = llvm_cbe_tmp__45;
  *((&llvm_cbe_tmp__35.field2)) = llvm_cbe_tmp__46;
  *((&llvm_cbe_tmp__35.field3)) = llvm_cbe_tmp__47;
  llvm_cbe_tmp__36 = (&llvm_cbe_thread_id6);
  llvm_cbe_tmp__37 = (&llvm_cbe_tmp__36);
  llvm_cbe_tmp__55 = *(((uint8_t**)(&llvm_cbe_tmp__37)));
  pthread_create(llvm_cbe_tmp__55, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_6), (((uint8_t*)(&llvm_cbe_tmp__35))));
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
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&((&main_OC_array.array[((int32_t)0)]))[((int64_t)llvm_cbe_i)]))))))[((int64_t)llvm_cbe_j)])))))) = (llvm_srem_u64((llvm_add_u64(llvm_cbe_i, llvm_cbe_j)), UINT64_C(10)));
  llvm_cbe_tmp__56 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__56;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__57 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__57;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
  do {     /* Syntactic loop '.9.for.loop' to make GCC happy */
llvm_cbe__2e_9_2e_for_2e_loop: {
  llvm_cbe_i7 = llvm_cbe_i7__PHI_TEMPORARY;
  llvm_cbe_item = llvm_cbe_item__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i7) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_j8__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_item9__PHI_TEMPORARY = llvm_cbe_item;   /* for PHI node */
    goto llvm_cbe__2e_12_2e_for_2e_loop;
  } else {
    llvm_cbe_checksum__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    llvm_cbe_i10__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_15_2e_for_2e_loop;
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
  llvm_cbe_tmp__58 = fifo_read(llvm_cbe_tmp__47);
  llvm_cbe_tmp__38 = llvm_cbe_tmp__58;
  llvm_cbe_tmp__59 = llvm_cbe_tmp__38;
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_6_uint64_t*)llvm_cbe_tmp__40))[((int64_t)llvm_cbe_i7)]))))))[((int64_t)llvm_cbe_j8)])))))) = llvm_cbe_tmp__59;
  llvm_cbe_tmp__60 = llvm_add_u64(llvm_cbe_j8, UINT64_C(1));
  llvm_cbe_j8__PHI_TEMPORARY = llvm_cbe_tmp__60;   /* for PHI node */
  llvm_cbe_item9__PHI_TEMPORARY = llvm_cbe_tmp__59;   /* for PHI node */
  goto llvm_cbe__2e_12_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.12.for.loop' */
llvm_cbe__2e_11_2e_for_2e_done: {
  llvm_cbe_tmp__61 = llvm_add_u64(llvm_cbe_i7, UINT64_C(1));
  llvm_cbe_i7__PHI_TEMPORARY = llvm_cbe_tmp__61;   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = llvm_cbe_item9;   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.9.for.loop' */
llvm_cbe__2e_14_2e_for_2e_done: {
  return;
}
  do {     /* Syntactic loop '.15.for.loop' to make GCC happy */
llvm_cbe__2e_15_2e_for_2e_loop: {
  llvm_cbe_checksum = llvm_cbe_checksum__PHI_TEMPORARY;
  llvm_cbe_i10 = llvm_cbe_i10__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i10) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    llvm_cbe_checksum11__PHI_TEMPORARY = llvm_cbe_checksum;   /* for PHI node */
    llvm_cbe_j12__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
    goto llvm_cbe__2e_18_2e_for_2e_loop;
  } else {
    goto llvm_cbe__2e_14_2e_for_2e_done;
  }

}
  do {     /* Syntactic loop '.18.for.loop' to make GCC happy */
llvm_cbe__2e_18_2e_for_2e_loop: {
  llvm_cbe_checksum11 = llvm_cbe_checksum11__PHI_TEMPORARY;
  llvm_cbe_j12 = llvm_cbe_j12__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_j12) < ((int64_t)UINT64_C(6)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_16_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_17_2e_for_2e_done;
  }

}
llvm_cbe__2e_16_2e_for_2e_body: {
  llvm_cbe_tmp__62 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_6_uint64_t*)llvm_cbe_tmp__40))[((int64_t)llvm_cbe_i10)]))))))[((int64_t)llvm_cbe_j12)]))))));
  llvm_cbe_tmp__63 = llvm_add_u64(llvm_cbe_checksum11, llvm_cbe_tmp__62);
  llvm_cbe_tmp__64 = llvm_add_u64(llvm_cbe_j12, UINT64_C(1));
  llvm_cbe_checksum11__PHI_TEMPORARY = llvm_cbe_tmp__63;   /* for PHI node */
  llvm_cbe_j12__PHI_TEMPORARY = llvm_cbe_tmp__64;   /* for PHI node */
  goto llvm_cbe__2e_18_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.18.for.loop' */
llvm_cbe__2e_17_2e_for_2e_done: {
  llvm_cbe_tmp__65 = llvm_add_u64(llvm_cbe_i10, UINT64_C(1));
  llvm_cbe_checksum__PHI_TEMPORARY = llvm_cbe_checksum11;   /* for PHI node */
  llvm_cbe_i10__PHI_TEMPORARY = llvm_cbe_tmp__65;   /* for PHI node */
  goto llvm_cbe__2e_15_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.15.for.loop' */
}


static void tmp__66(uint8_t* llvm_cbe_tmp__67) {
  FIFO* llvm_cbe_tmp__68;

  llvm_cbe_tmp__68 = *((&(((struct l_unnamed_1*)llvm_cbe_tmp__67))->field0));
  main_OC_init1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__68);
}


static uint8_t* auto_pthread_wrapper(uint8_t* llvm_cbe_tmp__69) {
  tmp__66(llvm_cbe_tmp__69);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__70(uint8_t* llvm_cbe_tmp__71) {
  FIFO* llvm_cbe_tmp__72;

  llvm_cbe_tmp__72 = *((&(((struct l_unnamed_1*)llvm_cbe_tmp__71))->field0));
  main_OC_init2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__72);
}


static uint8_t* auto_pthread_wrapper_OC_1(uint8_t* llvm_cbe_tmp__73) {
  tmp__70(llvm_cbe_tmp__73);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__74(uint8_t* llvm_cbe_tmp__75) {
  FIFO* llvm_cbe_tmp__76;

  llvm_cbe_tmp__76 = *((&(((struct l_unnamed_1*)llvm_cbe_tmp__75))->field0));
  main_OC_init3(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__76);
}


static uint8_t* auto_pthread_wrapper_OC_2(uint8_t* llvm_cbe_tmp__77) {
  tmp__74(llvm_cbe_tmp__77);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__78(uint8_t* llvm_cbe_tmp__79) {
  struct l_unnamed_2* llvm_cbe_tmp__80;
  FIFO* llvm_cbe_tmp__81;
  FIFO* llvm_cbe_tmp__82;

  llvm_cbe_tmp__80 = ((struct l_unnamed_2*)llvm_cbe_tmp__79);
  llvm_cbe_tmp__81 = *((&llvm_cbe_tmp__80->field0));
  llvm_cbe_tmp__82 = *((&llvm_cbe_tmp__80->field1));
  main_OC_process1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__81, llvm_cbe_tmp__82);
}


static void main_OC_process1(uint8_t* llvm_cbe_tmp__83, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__84;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__85;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__86;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__87;
  uint8_t* llvm_cbe_tmp__88;
  uint8_t* llvm_cbe_tmp__89;
  uint64_t llvm_cbe_tmp__90;
  uint64_t llvm_cbe_tmp__91;
  uint64_t llvm_cbe_tmp__92;
  uint64_t llvm_cbe_tmp__93;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__94;
  uint64_t llvm_cbe_tmp__95;
  uint64_t llvm_cbe_tmp__96;
  uint64_t llvm_cbe_tmp__97;
  uint64_t llvm_cbe_tmp__98;
  uint64_t llvm_cbe_tmp__99;
  uint64_t llvm_cbe_tmp__100;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__87 = memset((((uint8_t*)(&llvm_cbe_filter_row))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  llvm_cbe_tmp__88 = ((uint8_t*)(&llvm_cbe_filter_row));
  llvm_cbe_tmp__89 = memset(llvm_cbe_tmp__88, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__88))))))))) = UINT64_C(0);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__88))[((int64_t)UINT64_C(1))])))))) = UINT64_C(1);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__88))[((int64_t)UINT64_C(2))])))))) = UINT64_C(2);
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
  llvm_cbe_tmp__90 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__84 = llvm_cbe_tmp__90;
  llvm_cbe_tmp__91 = llvm_cbe_tmp__84;
  llvm_cbe_tmp__92 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__85 = llvm_cbe_tmp__92;
  llvm_cbe_tmp__93 = llvm_cbe_tmp__85;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__91;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__93;   /* for PHI node */
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
  llvm_cbe_tmp__94 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__86 = llvm_cbe_tmp__94;
  llvm_cbe_tmp__95 = llvm_cbe_tmp__86;
  llvm_cbe_tmp__96 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__88)))))))));
  llvm_cbe_tmp__97 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__88))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__98 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__88))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__96)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__97)))), (llvm_mul_u64(llvm_cbe_tmp__95, llvm_cbe_tmp__98)))));
  llvm_cbe_tmp__99 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__95;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__99;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__95;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__100 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__100;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_3(uint8_t* llvm_cbe_tmp__101) {
  tmp__78(llvm_cbe_tmp__101);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__102(uint8_t* llvm_cbe_tmp__103) {
  struct l_unnamed_2* llvm_cbe_tmp__104;
  FIFO* llvm_cbe_tmp__105;
  FIFO* llvm_cbe_tmp__106;

  llvm_cbe_tmp__104 = ((struct l_unnamed_2*)llvm_cbe_tmp__103);
  llvm_cbe_tmp__105 = *((&llvm_cbe_tmp__104->field0));
  llvm_cbe_tmp__106 = *((&llvm_cbe_tmp__104->field1));
  main_OC_process2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__105, llvm_cbe_tmp__106);
}


static void main_OC_process2(uint8_t* llvm_cbe_tmp__107, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__108;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__109;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__110;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__111;
  uint8_t* llvm_cbe_tmp__112;
  uint8_t* llvm_cbe_tmp__113;
  uint64_t llvm_cbe_tmp__114;
  uint64_t llvm_cbe_tmp__115;
  uint64_t llvm_cbe_tmp__116;
  uint64_t llvm_cbe_tmp__117;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__118;
  uint64_t llvm_cbe_tmp__119;
  uint64_t llvm_cbe_tmp__120;
  uint64_t llvm_cbe_tmp__121;
  uint64_t llvm_cbe_tmp__122;
  uint64_t llvm_cbe_tmp__123;
  uint64_t llvm_cbe_tmp__124;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__111 = memset((((uint8_t*)(&llvm_cbe_filter_row))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  llvm_cbe_tmp__112 = ((uint8_t*)(&llvm_cbe_filter_row));
  llvm_cbe_tmp__113 = memset(llvm_cbe_tmp__112, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__112))))))))) = UINT64_C(3);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__112))[((int64_t)UINT64_C(1))])))))) = UINT64_C(4);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__112))[((int64_t)UINT64_C(2))])))))) = UINT64_C(5);
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
  llvm_cbe_tmp__114 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__108 = llvm_cbe_tmp__114;
  llvm_cbe_tmp__115 = llvm_cbe_tmp__108;
  llvm_cbe_tmp__116 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__109 = llvm_cbe_tmp__116;
  llvm_cbe_tmp__117 = llvm_cbe_tmp__109;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__115;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__117;   /* for PHI node */
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
  llvm_cbe_tmp__118 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__110 = llvm_cbe_tmp__118;
  llvm_cbe_tmp__119 = llvm_cbe_tmp__110;
  llvm_cbe_tmp__120 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__112)))))))));
  llvm_cbe_tmp__121 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__112))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__122 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__112))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__120)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__121)))), (llvm_mul_u64(llvm_cbe_tmp__119, llvm_cbe_tmp__122)))));
  llvm_cbe_tmp__123 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__119;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__123;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__119;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__124 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__124;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_4(uint8_t* llvm_cbe_tmp__125) {
  tmp__102(llvm_cbe_tmp__125);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__126(uint8_t* llvm_cbe_tmp__127) {
  struct l_unnamed_2* llvm_cbe_tmp__128;
  FIFO* llvm_cbe_tmp__129;
  FIFO* llvm_cbe_tmp__130;

  llvm_cbe_tmp__128 = ((struct l_unnamed_2*)llvm_cbe_tmp__127);
  llvm_cbe_tmp__129 = *((&llvm_cbe_tmp__128->field0));
  llvm_cbe_tmp__130 = *((&llvm_cbe_tmp__128->field1));
  main_OC_process3(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__129, llvm_cbe_tmp__130);
}


static void main_OC_process3(uint8_t* llvm_cbe_tmp__131, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__132;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__133;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__134;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__135;
  uint8_t* llvm_cbe_tmp__136;
  uint8_t* llvm_cbe_tmp__137;
  uint64_t llvm_cbe_tmp__138;
  uint64_t llvm_cbe_tmp__139;
  uint64_t llvm_cbe_tmp__140;
  uint64_t llvm_cbe_tmp__141;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__142;
  uint64_t llvm_cbe_tmp__143;
  uint64_t llvm_cbe_tmp__144;
  uint64_t llvm_cbe_tmp__145;
  uint64_t llvm_cbe_tmp__146;
  uint64_t llvm_cbe_tmp__147;
  uint64_t llvm_cbe_tmp__148;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__135 = memset((((uint8_t*)(&llvm_cbe_filter_row))), 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  llvm_cbe_tmp__136 = ((uint8_t*)(&llvm_cbe_filter_row));
  llvm_cbe_tmp__137 = memset(llvm_cbe_tmp__136, 0, (((uint64_t)(((uint64_t)((uint64_t)(uintptr_t)((&((uint64_t*)/*NULL*/0)[((int32_t)1)])))) * ((uint64_t)UINT64_C(3))))));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__136))))))))) = UINT64_C(6);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__136))[((int64_t)UINT64_C(1))])))))) = UINT64_C(7);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__136))[((int64_t)UINT64_C(2))])))))) = UINT64_C(8);
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
  llvm_cbe_tmp__138 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__132 = llvm_cbe_tmp__138;
  llvm_cbe_tmp__139 = llvm_cbe_tmp__132;
  llvm_cbe_tmp__140 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__133 = llvm_cbe_tmp__140;
  llvm_cbe_tmp__141 = llvm_cbe_tmp__133;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__139;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__141;   /* for PHI node */
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
  llvm_cbe_tmp__142 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__134 = llvm_cbe_tmp__142;
  llvm_cbe_tmp__143 = llvm_cbe_tmp__134;
  llvm_cbe_tmp__144 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__136)))))))));
  llvm_cbe_tmp__145 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__136))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__146 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__136))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__144)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__145)))), (llvm_mul_u64(llvm_cbe_tmp__143, llvm_cbe_tmp__146)))));
  llvm_cbe_tmp__147 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__143;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__147;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__143;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__148 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__148;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_5(uint8_t* llvm_cbe_tmp__149) {
  tmp__126(llvm_cbe_tmp__149);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__150(uint8_t* llvm_cbe_tmp__151) {
  struct l_unnamed_3* llvm_cbe_tmp__152;
  FIFO* llvm_cbe_tmp__153;
  FIFO* llvm_cbe_tmp__154;
  FIFO* llvm_cbe_tmp__155;
  FIFO* llvm_cbe_tmp__156;

  llvm_cbe_tmp__152 = ((struct l_unnamed_3*)llvm_cbe_tmp__151);
  llvm_cbe_tmp__153 = *((&llvm_cbe_tmp__152->field0));
  llvm_cbe_tmp__154 = *((&llvm_cbe_tmp__152->field1));
  llvm_cbe_tmp__155 = *((&llvm_cbe_tmp__152->field2));
  llvm_cbe_tmp__156 = *((&llvm_cbe_tmp__152->field3));
  main_OC_process4(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__153, llvm_cbe_tmp__154, llvm_cbe_tmp__155, llvm_cbe_tmp__156);
}


static void main_OC_process4(uint8_t* llvm_cbe_tmp__157, FIFO* llvm_cbe_in1, FIFO* llvm_cbe_in2, FIFO* llvm_cbe_in3, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__158;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__159;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__160;    /* Address-exposed local */
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__161;
  uint64_t llvm_cbe_tmp__162;
  uint64_t llvm_cbe_tmp__163;
  uint64_t llvm_cbe_tmp__164;
  uint64_t llvm_cbe_tmp__165;
  uint64_t llvm_cbe_tmp__166;
  uint64_t llvm_cbe_tmp__167;
  uint64_t llvm_cbe_tmp__168;
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
  llvm_cbe_tmp__161 = fifo_read(llvm_cbe_in1);
  llvm_cbe_tmp__158 = llvm_cbe_tmp__161;
  llvm_cbe_tmp__162 = llvm_cbe_tmp__158;
  llvm_cbe_tmp__163 = fifo_read(llvm_cbe_in2);
  llvm_cbe_tmp__159 = llvm_cbe_tmp__163;
  llvm_cbe_tmp__164 = llvm_cbe_tmp__159;
  llvm_cbe_tmp__165 = fifo_read(llvm_cbe_in3);
  llvm_cbe_tmp__160 = llvm_cbe_tmp__165;
  llvm_cbe_tmp__166 = llvm_cbe_tmp__160;
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64(llvm_cbe_tmp__162, llvm_cbe_tmp__164)), llvm_cbe_tmp__166)));
  llvm_cbe_tmp__167 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__167;   /* for PHI node */
  llvm_cbe_item11__PHI_TEMPORARY = llvm_cbe_tmp__162;   /* for PHI node */
  llvm_cbe_item22__PHI_TEMPORARY = llvm_cbe_tmp__164;   /* for PHI node */
  llvm_cbe_item33__PHI_TEMPORARY = llvm_cbe_tmp__166;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__168 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__168;   /* for PHI node */
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item11;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_item22;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item33;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_6(uint8_t* llvm_cbe_tmp__169) {
  tmp__150(llvm_cbe_tmp__169);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


void __go_init_main(uint8_t* llvm_cbe_tmp__170) {
  return;
}


uint32_t main(void) {
  main_OC_main(((uint8_t*)/*NULL*/0));
  return 0;
}

