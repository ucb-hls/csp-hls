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
struct l_unnamed_4;

/* Types Definitions */
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

/* Function Declarations */
void main_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_1(uint8_t*);
static void tmp__63(uint8_t*);
static uint8_t* auto_pthread_wrapper(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_2(uint8_t*);
static void tmp__76(uint8_t*);
static uint8_t* auto_pthread_wrapper_OC_1(uint8_t*);
static void main_OC_main_KD_main_OC_main_EC_3(uint8_t*);
static void tmp__89(uint8_t*);
static uint8_t* auto_pthread_wrapper_OC_2(uint8_t*);
static void tmp__94(uint8_t*);
static void main_OC_process1(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_3(uint8_t*);
static void tmp__116(uint8_t*);
static void main_OC_process2(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_4(uint8_t*);
static void tmp__138(uint8_t*);
static void main_OC_process3(uint8_t*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_5(uint8_t*);
static void tmp__160(uint8_t*);
static void main_OC_process4(uint8_t*, FIFO*, FIFO*, FIFO*, FIFO*);
static uint8_t* auto_pthread_wrapper_OC_6(uint8_t*);
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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
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
  struct l_array_6_struct_AC_l_array_6_uint64_t llvm_cbe_result;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__30;
  FIFO* llvm_cbe_tmp__31;
  FIFO* llvm_cbe_tmp__32;
  FIFO* llvm_cbe_tmp__33;
  FIFO* llvm_cbe_tmp__34;
  FIFO* llvm_cbe_tmp__35;
  FIFO* llvm_cbe_tmp__36;
  FIFO* llvm_cbe_tmp__37;
  uint8_t* llvm_cbe_tmp__38;
  uint8_t* llvm_cbe_tmp__39;
  uint8_t* llvm_cbe_tmp__40;
  uint8_t* llvm_cbe_tmp__41;
  FIFO* llvm_cbe_tmp__42;
  uint8_t* llvm_cbe_tmp__43;
  FIFO* llvm_cbe_tmp__44;
  uint8_t* llvm_cbe_tmp__45;
  FIFO* llvm_cbe_tmp__46;
  uint8_t* llvm_cbe_tmp__47;
  uint8_t* llvm_cbe_tmp__48;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__49;
  uint64_t llvm_cbe_tmp__50;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_i7;
  uint64_t llvm_cbe_i7__PHI_TEMPORARY;
  uint64_t llvm_cbe_item;
  uint64_t llvm_cbe_item__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__51;
  uint64_t llvm_cbe_tmp__52;
  uint64_t llvm_cbe_tmp__53;
  uint64_t llvm_cbe_tmp__54;
  uint64_t llvm_cbe_j8;
  uint64_t llvm_cbe_j8__PHI_TEMPORARY;
  uint64_t llvm_cbe_item9;
  uint64_t llvm_cbe_item9__PHI_TEMPORARY;

  llvm_cbe_tmp__30 = ((uint8_t*)(&llvm_cbe_result));
  llvm_cbe_tmp__31 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_c1_in = llvm_cbe_tmp__31;
  llvm_cbe_tmp__32 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_c2_in = llvm_cbe_tmp__32;
  llvm_cbe_tmp__33 = fifo_malloc(64u, UINT64_C(10));
  llvm_cbe_c3_in = llvm_cbe_tmp__33;
  llvm_cbe_tmp__34 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__35 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__36 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__37 = fifo_malloc(64u, UINT64_C(1));
  llvm_cbe_tmp__38 = ((uint8_t*)(&llvm_cbe_array));
  llvm_cbe_i__PHI_TEMPORARY = UINT64_C(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done: {
  *((&llvm_cbe_tmp__5.field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_1);
  *((&llvm_cbe_tmp__5.field1)) = (&llvm_cbe_c1_in);
  *((&llvm_cbe_tmp__5.field2)) = llvm_cbe_tmp__38;
  *((&llvm_cbe_tmp__6.field0)) = (((uint8_t*)(&llvm_cbe_tmp__5)));
  llvm_cbe_tmp__7 = (&llvm_cbe_thread_id);
  llvm_cbe_tmp__8 = (&llvm_cbe_tmp__7);
  llvm_cbe_tmp__39 = *(((uint8_t**)(&llvm_cbe_tmp__8)));
  pthread_create(llvm_cbe_tmp__39, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper), (((uint8_t*)(&llvm_cbe_tmp__6))));
  *((&llvm_cbe_tmp__9.field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_2);
  *((&llvm_cbe_tmp__9.field1)) = (&llvm_cbe_c2_in);
  *((&llvm_cbe_tmp__9.field2)) = llvm_cbe_tmp__38;
  *((&llvm_cbe_tmp__10.field0)) = (((uint8_t*)(&llvm_cbe_tmp__9)));
  llvm_cbe_tmp__11 = (&llvm_cbe_thread_id1);
  llvm_cbe_tmp__12 = (&llvm_cbe_tmp__11);
  llvm_cbe_tmp__40 = *(((uint8_t**)(&llvm_cbe_tmp__12)));
  pthread_create(llvm_cbe_tmp__40, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_1), (((uint8_t*)(&llvm_cbe_tmp__10))));
  *((&llvm_cbe_tmp__13.field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_3);
  *((&llvm_cbe_tmp__13.field1)) = (&llvm_cbe_c3_in);
  *((&llvm_cbe_tmp__13.field2)) = llvm_cbe_tmp__38;
  *((&llvm_cbe_tmp__14.field0)) = (((uint8_t*)(&llvm_cbe_tmp__13)));
  llvm_cbe_tmp__15 = (&llvm_cbe_thread_id2);
  llvm_cbe_tmp__16 = (&llvm_cbe_tmp__15);
  llvm_cbe_tmp__41 = *(((uint8_t**)(&llvm_cbe_tmp__16)));
  pthread_create(llvm_cbe_tmp__41, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_2), (((uint8_t*)(&llvm_cbe_tmp__14))));
  llvm_cbe_tmp__42 = llvm_cbe_c1_in;
  *((&llvm_cbe_tmp__17.field0)) = llvm_cbe_tmp__42;
  *((&llvm_cbe_tmp__17.field1)) = llvm_cbe_tmp__34;
  llvm_cbe_tmp__18 = (&llvm_cbe_thread_id3);
  llvm_cbe_tmp__19 = (&llvm_cbe_tmp__18);
  llvm_cbe_tmp__43 = *(((uint8_t**)(&llvm_cbe_tmp__19)));
  pthread_create(llvm_cbe_tmp__43, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_3), (((uint8_t*)(&llvm_cbe_tmp__17))));
  llvm_cbe_tmp__44 = llvm_cbe_c2_in;
  *((&llvm_cbe_tmp__20.field0)) = llvm_cbe_tmp__44;
  *((&llvm_cbe_tmp__20.field1)) = llvm_cbe_tmp__35;
  llvm_cbe_tmp__21 = (&llvm_cbe_thread_id4);
  llvm_cbe_tmp__22 = (&llvm_cbe_tmp__21);
  llvm_cbe_tmp__45 = *(((uint8_t**)(&llvm_cbe_tmp__22)));
  pthread_create(llvm_cbe_tmp__45, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_4), (((uint8_t*)(&llvm_cbe_tmp__20))));
  llvm_cbe_tmp__46 = llvm_cbe_c3_in;
  *((&llvm_cbe_tmp__23.field0)) = llvm_cbe_tmp__46;
  *((&llvm_cbe_tmp__23.field1)) = llvm_cbe_tmp__36;
  llvm_cbe_tmp__24 = (&llvm_cbe_thread_id5);
  llvm_cbe_tmp__25 = (&llvm_cbe_tmp__24);
  llvm_cbe_tmp__47 = *(((uint8_t**)(&llvm_cbe_tmp__25)));
  pthread_create(llvm_cbe_tmp__47, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_5), (((uint8_t*)(&llvm_cbe_tmp__23))));
  *((&llvm_cbe_tmp__26.field0)) = llvm_cbe_tmp__34;
  *((&llvm_cbe_tmp__26.field1)) = llvm_cbe_tmp__35;
  *((&llvm_cbe_tmp__26.field2)) = llvm_cbe_tmp__36;
  *((&llvm_cbe_tmp__26.field3)) = llvm_cbe_tmp__37;
  llvm_cbe_tmp__27 = (&llvm_cbe_thread_id6);
  llvm_cbe_tmp__28 = (&llvm_cbe_tmp__27);
  llvm_cbe_tmp__48 = *(((uint8_t**)(&llvm_cbe_tmp__28)));
  pthread_create(llvm_cbe_tmp__48, ((uint8_t*)/*NULL*/0), ((uint8_t*)auto_pthread_wrapper_OC_6), (((uint8_t*)(&llvm_cbe_tmp__26))));
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
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__38))[((int64_t)llvm_cbe_i)]))))))[((int64_t)llvm_cbe_j)])))))) = (llvm_add_u64(llvm_cbe_i, llvm_cbe_j));
  llvm_cbe_tmp__49 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__49;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__50 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__50;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
llvm_cbe__2e_8_2e_for_2e_done: {
  return;
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
  llvm_cbe_tmp__51 = fifo_read(llvm_cbe_tmp__37);
  llvm_cbe_tmp__29 = llvm_cbe_tmp__51;
  llvm_cbe_tmp__52 = llvm_cbe_tmp__29;
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_6_uint64_t*)llvm_cbe_tmp__30))[((int64_t)llvm_cbe_i7)]))))))[((int64_t)llvm_cbe_j8)])))))) = llvm_cbe_tmp__52;
  llvm_cbe_tmp__53 = llvm_add_u64(llvm_cbe_j8, UINT64_C(1));
  llvm_cbe_j8__PHI_TEMPORARY = llvm_cbe_tmp__53;   /* for PHI node */
  llvm_cbe_item9__PHI_TEMPORARY = llvm_cbe_tmp__52;   /* for PHI node */
  goto llvm_cbe__2e_12_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.12.for.loop' */
llvm_cbe__2e_11_2e_for_2e_done: {
  llvm_cbe_tmp__54 = llvm_add_u64(llvm_cbe_i7, UINT64_C(1));
  llvm_cbe_i7__PHI_TEMPORARY = llvm_cbe_tmp__54;   /* for PHI node */
  llvm_cbe_item__PHI_TEMPORARY = llvm_cbe_item9;   /* for PHI node */
  goto llvm_cbe__2e_9_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.9.for.loop' */
}


static void main_OC_main_KD_main_OC_main_EC_1(uint8_t* llvm_cbe_tmp__55) {
  struct l_unnamed_1* llvm_cbe_tmp__56;
  FIFO** llvm_cbe_tmp__57;
  uint8_t* llvm_cbe_tmp__58;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  FIFO* llvm_cbe_tmp__59;
  uint64_t llvm_cbe_tmp__60;
  uint64_t llvm_cbe_tmp__61;
  uint64_t llvm_cbe_tmp__62;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_tmp__56 = ((struct l_unnamed_1*)llvm_cbe_tmp__55);
  llvm_cbe_tmp__57 = *((&llvm_cbe_tmp__56->field1));
  llvm_cbe_tmp__58 = *((&llvm_cbe_tmp__56->field2));
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
  llvm_cbe_tmp__59 = *llvm_cbe_tmp__57;
  llvm_cbe_tmp__60 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__58))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(0))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_tmp__59, llvm_cbe_tmp__60);
  llvm_cbe_tmp__61 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__61;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__62 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__62;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void tmp__63(uint8_t* llvm_cbe_tmp__64) {
  uint8_t* llvm_cbe_tmp__65;
  uint8_t* llvm_cbe_tmp__66;

  llvm_cbe_tmp__65 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__64))->field0));
  llvm_cbe_tmp__66 = *(((uint8_t**)llvm_cbe_tmp__65));
  (((l_fptr_1*)llvm_cbe_tmp__66))(llvm_cbe_tmp__65);
}


static uint8_t* auto_pthread_wrapper(uint8_t* llvm_cbe_tmp__67) {
  tmp__63(llvm_cbe_tmp__67);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void main_OC_main_KD_main_OC_main_EC_2(uint8_t* llvm_cbe_tmp__68) {
  struct l_unnamed_1* llvm_cbe_tmp__69;
  FIFO** llvm_cbe_tmp__70;
  uint8_t* llvm_cbe_tmp__71;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  FIFO* llvm_cbe_tmp__72;
  uint64_t llvm_cbe_tmp__73;
  uint64_t llvm_cbe_tmp__74;
  uint64_t llvm_cbe_tmp__75;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_tmp__69 = ((struct l_unnamed_1*)llvm_cbe_tmp__68);
  llvm_cbe_tmp__70 = *((&llvm_cbe_tmp__69->field1));
  llvm_cbe_tmp__71 = *((&llvm_cbe_tmp__69->field2));
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
  llvm_cbe_tmp__72 = *llvm_cbe_tmp__70;
  llvm_cbe_tmp__73 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__71))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(1))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_tmp__72, llvm_cbe_tmp__73);
  llvm_cbe_tmp__74 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__74;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__75 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__75;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void tmp__76(uint8_t* llvm_cbe_tmp__77) {
  uint8_t* llvm_cbe_tmp__78;
  uint8_t* llvm_cbe_tmp__79;

  llvm_cbe_tmp__78 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__77))->field0));
  llvm_cbe_tmp__79 = *(((uint8_t**)llvm_cbe_tmp__78));
  (((l_fptr_1*)llvm_cbe_tmp__79))(llvm_cbe_tmp__78);
}


static uint8_t* auto_pthread_wrapper_OC_1(uint8_t* llvm_cbe_tmp__80) {
  tmp__76(llvm_cbe_tmp__80);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void main_OC_main_KD_main_OC_main_EC_3(uint8_t* llvm_cbe_tmp__81) {
  struct l_unnamed_1* llvm_cbe_tmp__82;
  FIFO** llvm_cbe_tmp__83;
  uint8_t* llvm_cbe_tmp__84;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  FIFO* llvm_cbe_tmp__85;
  uint64_t llvm_cbe_tmp__86;
  uint64_t llvm_cbe_tmp__87;
  uint64_t llvm_cbe_tmp__88;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;

  llvm_cbe_tmp__82 = ((struct l_unnamed_1*)llvm_cbe_tmp__81);
  llvm_cbe_tmp__83 = *((&llvm_cbe_tmp__82->field1));
  llvm_cbe_tmp__84 = *((&llvm_cbe_tmp__82->field2));
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
  llvm_cbe_tmp__85 = *llvm_cbe_tmp__83;
  llvm_cbe_tmp__86 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)(((uint8_t*)((&(((struct l_array_8_uint64_t*)llvm_cbe_tmp__84))[((int64_t)(llvm_add_u64(llvm_cbe_i, UINT64_C(2))))]))))))[((int64_t)llvm_cbe_j)]))))));
  fifo_write(llvm_cbe_tmp__85, llvm_cbe_tmp__86);
  llvm_cbe_tmp__87 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__87;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__88 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__88;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static void tmp__89(uint8_t* llvm_cbe_tmp__90) {
  uint8_t* llvm_cbe_tmp__91;
  uint8_t* llvm_cbe_tmp__92;

  llvm_cbe_tmp__91 = *((&(((struct l_unnamed_2*)llvm_cbe_tmp__90))->field0));
  llvm_cbe_tmp__92 = *(((uint8_t**)llvm_cbe_tmp__91));
  (((l_fptr_1*)llvm_cbe_tmp__92))(llvm_cbe_tmp__91);
}


static uint8_t* auto_pthread_wrapper_OC_2(uint8_t* llvm_cbe_tmp__93) {
  tmp__89(llvm_cbe_tmp__93);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__94(uint8_t* llvm_cbe_tmp__95) {
  struct l_unnamed_3* llvm_cbe_tmp__96;
  FIFO* llvm_cbe_tmp__97;
  FIFO* llvm_cbe_tmp__98;

  llvm_cbe_tmp__96 = ((struct l_unnamed_3*)llvm_cbe_tmp__95);
  llvm_cbe_tmp__97 = *((&llvm_cbe_tmp__96->field0));
  llvm_cbe_tmp__98 = *((&llvm_cbe_tmp__96->field1));
  main_OC_process1(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__97, llvm_cbe_tmp__98);
}


static void main_OC_process1(uint8_t* llvm_cbe_tmp__99, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__100;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__101;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__102;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__103;
  uint64_t llvm_cbe_tmp__104;
  uint64_t llvm_cbe_tmp__105;
  uint64_t llvm_cbe_tmp__106;
  uint64_t llvm_cbe_tmp__107;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__108;
  uint64_t llvm_cbe_tmp__109;
  uint64_t llvm_cbe_tmp__110;
  uint64_t llvm_cbe_tmp__111;
  uint64_t llvm_cbe_tmp__112;
  uint64_t llvm_cbe_tmp__113;
  uint64_t llvm_cbe_tmp__114;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__103 = ((uint8_t*)(&llvm_cbe_filter_row));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__103))))))))) = UINT64_C(0);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__103))[((int64_t)UINT64_C(1))])))))) = UINT64_C(1);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__103))[((int64_t)UINT64_C(2))])))))) = UINT64_C(2);
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
  llvm_cbe_tmp__104 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__100 = llvm_cbe_tmp__104;
  llvm_cbe_tmp__105 = llvm_cbe_tmp__100;
  llvm_cbe_tmp__106 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__101 = llvm_cbe_tmp__106;
  llvm_cbe_tmp__107 = llvm_cbe_tmp__101;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__105;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__107;   /* for PHI node */
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
  llvm_cbe_tmp__108 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__102 = llvm_cbe_tmp__108;
  llvm_cbe_tmp__109 = llvm_cbe_tmp__102;
  llvm_cbe_tmp__110 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__103)))))))));
  llvm_cbe_tmp__111 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__103))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__112 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__103))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__110)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__111)))), (llvm_mul_u64(llvm_cbe_tmp__109, llvm_cbe_tmp__112)))));
  llvm_cbe_tmp__113 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__109;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__113;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__109;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__114 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__114;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_3(uint8_t* llvm_cbe_tmp__115) {
  tmp__94(llvm_cbe_tmp__115);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__116(uint8_t* llvm_cbe_tmp__117) {
  struct l_unnamed_3* llvm_cbe_tmp__118;
  FIFO* llvm_cbe_tmp__119;
  FIFO* llvm_cbe_tmp__120;

  llvm_cbe_tmp__118 = ((struct l_unnamed_3*)llvm_cbe_tmp__117);
  llvm_cbe_tmp__119 = *((&llvm_cbe_tmp__118->field0));
  llvm_cbe_tmp__120 = *((&llvm_cbe_tmp__118->field1));
  main_OC_process2(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__119, llvm_cbe_tmp__120);
}


static void main_OC_process2(uint8_t* llvm_cbe_tmp__121, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__122;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__123;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__124;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__125;
  uint64_t llvm_cbe_tmp__126;
  uint64_t llvm_cbe_tmp__127;
  uint64_t llvm_cbe_tmp__128;
  uint64_t llvm_cbe_tmp__129;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__130;
  uint64_t llvm_cbe_tmp__131;
  uint64_t llvm_cbe_tmp__132;
  uint64_t llvm_cbe_tmp__133;
  uint64_t llvm_cbe_tmp__134;
  uint64_t llvm_cbe_tmp__135;
  uint64_t llvm_cbe_tmp__136;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__125 = ((uint8_t*)(&llvm_cbe_filter_row));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__125))))))))) = UINT64_C(3);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__125))[((int64_t)UINT64_C(1))])))))) = UINT64_C(4);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__125))[((int64_t)UINT64_C(2))])))))) = UINT64_C(5);
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
  llvm_cbe_tmp__126 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__122 = llvm_cbe_tmp__126;
  llvm_cbe_tmp__127 = llvm_cbe_tmp__122;
  llvm_cbe_tmp__128 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__123 = llvm_cbe_tmp__128;
  llvm_cbe_tmp__129 = llvm_cbe_tmp__123;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__127;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__129;   /* for PHI node */
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
  llvm_cbe_tmp__130 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__124 = llvm_cbe_tmp__130;
  llvm_cbe_tmp__131 = llvm_cbe_tmp__124;
  llvm_cbe_tmp__132 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__125)))))))));
  llvm_cbe_tmp__133 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__125))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__134 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__125))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__132)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__133)))), (llvm_mul_u64(llvm_cbe_tmp__131, llvm_cbe_tmp__134)))));
  llvm_cbe_tmp__135 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__131;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__135;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__131;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__136 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__136;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_4(uint8_t* llvm_cbe_tmp__137) {
  tmp__116(llvm_cbe_tmp__137);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__138(uint8_t* llvm_cbe_tmp__139) {
  struct l_unnamed_3* llvm_cbe_tmp__140;
  FIFO* llvm_cbe_tmp__141;
  FIFO* llvm_cbe_tmp__142;

  llvm_cbe_tmp__140 = ((struct l_unnamed_3*)llvm_cbe_tmp__139);
  llvm_cbe_tmp__141 = *((&llvm_cbe_tmp__140->field0));
  llvm_cbe_tmp__142 = *((&llvm_cbe_tmp__140->field1));
  main_OC_process3(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__141, llvm_cbe_tmp__142);
}


static void main_OC_process3(uint8_t* llvm_cbe_tmp__143, FIFO* llvm_cbe_in, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__144;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__145;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__146;    /* Address-exposed local */
  struct l_array_3_uint64_t llvm_cbe_filter_row;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__147;
  uint64_t llvm_cbe_tmp__148;
  uint64_t llvm_cbe_tmp__149;
  uint64_t llvm_cbe_tmp__150;
  uint64_t llvm_cbe_tmp__151;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__152;
  uint64_t llvm_cbe_tmp__153;
  uint64_t llvm_cbe_tmp__154;
  uint64_t llvm_cbe_tmp__155;
  uint64_t llvm_cbe_tmp__156;
  uint64_t llvm_cbe_tmp__157;
  uint64_t llvm_cbe_tmp__158;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_j;
  uint64_t llvm_cbe_j__PHI_TEMPORARY;
  uint64_t llvm_cbe_item31;
  uint64_t llvm_cbe_item31__PHI_TEMPORARY;

  llvm_cbe_tmp__147 = ((uint8_t*)(&llvm_cbe_filter_row));
  *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__147))))))))) = UINT64_C(6);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__147))[((int64_t)UINT64_C(1))])))))) = UINT64_C(7);
  *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__147))[((int64_t)UINT64_C(2))])))))) = UINT64_C(8);
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
  llvm_cbe_tmp__148 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__144 = llvm_cbe_tmp__148;
  llvm_cbe_tmp__149 = llvm_cbe_tmp__144;
  llvm_cbe_tmp__150 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__145 = llvm_cbe_tmp__150;
  llvm_cbe_tmp__151 = llvm_cbe_tmp__145;
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_tmp__149;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__151;   /* for PHI node */
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
  llvm_cbe_tmp__152 = fifo_read(llvm_cbe_in);
  llvm_cbe_tmp__146 = llvm_cbe_tmp__152;
  llvm_cbe_tmp__153 = llvm_cbe_tmp__146;
  llvm_cbe_tmp__154 = *(((uint64_t*)(((uint8_t*)((&(*(((uint64_t*)llvm_cbe_tmp__147)))))))));
  llvm_cbe_tmp__155 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__147))[((int64_t)UINT64_C(1))]))))));
  llvm_cbe_tmp__156 = *(((uint64_t*)(((uint8_t*)((&(((uint64_t*)llvm_cbe_tmp__147))[((int64_t)UINT64_C(2))]))))));
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64((llvm_mul_u64(llvm_cbe_item1, llvm_cbe_tmp__154)), (llvm_mul_u64(llvm_cbe_item2, llvm_cbe_tmp__155)))), (llvm_mul_u64(llvm_cbe_tmp__153, llvm_cbe_tmp__156)))));
  llvm_cbe_tmp__157 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item2;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_tmp__153;   /* for PHI node */
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__157;   /* for PHI node */
  llvm_cbe_item31__PHI_TEMPORARY = llvm_cbe_tmp__153;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__158 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__158;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item31;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_5(uint8_t* llvm_cbe_tmp__159) {
  tmp__138(llvm_cbe_tmp__159);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


static void tmp__160(uint8_t* llvm_cbe_tmp__161) {
  struct l_unnamed_4* llvm_cbe_tmp__162;
  FIFO* llvm_cbe_tmp__163;
  FIFO* llvm_cbe_tmp__164;
  FIFO* llvm_cbe_tmp__165;
  FIFO* llvm_cbe_tmp__166;

  llvm_cbe_tmp__162 = ((struct l_unnamed_4*)llvm_cbe_tmp__161);
  llvm_cbe_tmp__163 = *((&llvm_cbe_tmp__162->field0));
  llvm_cbe_tmp__164 = *((&llvm_cbe_tmp__162->field1));
  llvm_cbe_tmp__165 = *((&llvm_cbe_tmp__162->field2));
  llvm_cbe_tmp__166 = *((&llvm_cbe_tmp__162->field3));
  main_OC_process4(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__163, llvm_cbe_tmp__164, llvm_cbe_tmp__165, llvm_cbe_tmp__166);
}


static void main_OC_process4(uint8_t* llvm_cbe_tmp__167, FIFO* llvm_cbe_in1, FIFO* llvm_cbe_in2, FIFO* llvm_cbe_in3, FIFO* llvm_cbe_out) {
  uint64_t llvm_cbe_tmp__168;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__169;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__170;    /* Address-exposed local */
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;
  uint64_t llvm_cbe_item1;
  uint64_t llvm_cbe_item1__PHI_TEMPORARY;
  uint64_t llvm_cbe_item2;
  uint64_t llvm_cbe_item2__PHI_TEMPORARY;
  uint64_t llvm_cbe_item3;
  uint64_t llvm_cbe_item3__PHI_TEMPORARY;
  uint64_t llvm_cbe_tmp__171;
  uint64_t llvm_cbe_tmp__172;
  uint64_t llvm_cbe_tmp__173;
  uint64_t llvm_cbe_tmp__174;
  uint64_t llvm_cbe_tmp__175;
  uint64_t llvm_cbe_tmp__176;
  uint64_t llvm_cbe_tmp__177;
  uint64_t llvm_cbe_tmp__178;
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
  llvm_cbe_tmp__171 = fifo_read(llvm_cbe_in1);
  llvm_cbe_tmp__168 = llvm_cbe_tmp__171;
  llvm_cbe_tmp__172 = llvm_cbe_tmp__168;
  llvm_cbe_tmp__173 = fifo_read(llvm_cbe_in2);
  llvm_cbe_tmp__169 = llvm_cbe_tmp__173;
  llvm_cbe_tmp__174 = llvm_cbe_tmp__169;
  llvm_cbe_tmp__175 = fifo_read(llvm_cbe_in3);
  llvm_cbe_tmp__170 = llvm_cbe_tmp__175;
  llvm_cbe_tmp__176 = llvm_cbe_tmp__170;
  fifo_write(llvm_cbe_out, (llvm_add_u64((llvm_add_u64(llvm_cbe_tmp__172, llvm_cbe_tmp__174)), llvm_cbe_tmp__176)));
  llvm_cbe_tmp__177 = llvm_add_u64(llvm_cbe_j, UINT64_C(1));
  llvm_cbe_j__PHI_TEMPORARY = llvm_cbe_tmp__177;   /* for PHI node */
  llvm_cbe_item11__PHI_TEMPORARY = llvm_cbe_tmp__172;   /* for PHI node */
  llvm_cbe_item22__PHI_TEMPORARY = llvm_cbe_tmp__174;   /* for PHI node */
  llvm_cbe_item33__PHI_TEMPORARY = llvm_cbe_tmp__176;   /* for PHI node */
  goto llvm_cbe__2e_6_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.6.for.loop' */
llvm_cbe__2e_5_2e_for_2e_done: {
  llvm_cbe_tmp__178 = llvm_add_u64(llvm_cbe_i, UINT64_C(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__178;   /* for PHI node */
  llvm_cbe_item1__PHI_TEMPORARY = llvm_cbe_item11;   /* for PHI node */
  llvm_cbe_item2__PHI_TEMPORARY = llvm_cbe_item22;   /* for PHI node */
  llvm_cbe_item3__PHI_TEMPORARY = llvm_cbe_item33;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

}
  } while (1); /* end of syntactic loop '.3.for.loop' */
}


static uint8_t* auto_pthread_wrapper_OC_6(uint8_t* llvm_cbe_tmp__179) {
  tmp__160(llvm_cbe_tmp__179);
  pthread_exit(((uint8_t*)/*NULL*/0));
  return ((uint8_t*)/*NULL*/0);
}


void __go_init_main(uint8_t* llvm_cbe_tmp__180) {
  return;
}


uint32_t main(void) {
  main_OC_main(((uint8_t*)/*NULL*/0));
  return 0;
}

