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
struct l_struct_structField;
struct l_struct_structFieldSlice;
struct l_struct_structType;
struct l_struct_ptrType;
struct l_unnamed_1;
struct l_unnamed_3;
struct l_unnamed_4;
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
struct l_struct_ptrType {
  struct l_struct_commonType field0;
  struct l_struct_commonType* field1;
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_5_uint8_t_KC_ {
  uint8_t* array[5];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_unnamed_1 {
  uint8_t* field0;
  uint8_t* field1;
};
struct l_array_1_struct_AC_l_unnamed_1 {
  struct l_unnamed_1 array[1];
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

/* Function definitions */


/* External Global Variable Declarations */
extern struct l_struct_funcVal __go_type_hash_identity_descriptor;
extern struct l_struct_funcVal __go_type_equal_identity_descriptor;

/* Function Declarations */
static uint8_t* main_OC_f(uint8_t*);
void main_OC__OC_import(uint8_t*);
void fmt_OC__OC_import(uint8_t*);
void main_OC_main(uint8_t*);
struct l_unnamed_4 fmt_OC_Printf(uint8_t*, uint8_t*, uint64_t, struct l_unnamed_3);
uint64_t __go_type_hash_Se(uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
uint8_t __go_type_equal_Se(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTE_WEAK__;
void __go_init_main(uint8_t*);


/* Global Variable Definitions and Initialization */
struct l_struct_structType __go_tdn_main_OC_FIFO = { { 153u, 1, 1, UINT64_C(0), 134220952, (&__go_type_hash_Se_descriptor), (&__go_type_equal_Se_descriptor), ((uint8_t*)(&__go_tdn_main_OC_FIFO_EC_gc)), (&tmp__33), (&tmp__34), ((&__go_td_pN9_main_OC_FIFO.field0)) }, { ((struct l_struct_structField*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
uint8_t* main_OC__OC_import_EC_descriptor = ((uint8_t*)main_OC__OC_import);
static bool init_EC_guard;
uint8_t* main_OC_main_EC_descriptor = ((uint8_t*)main_OC_main);
struct l_struct_ptrType __go_td_pN9_main_OC_FIFO = { { 54, 8, 8, UINT64_C(8), 2147535241u, (&__go_type_hash_identity_descriptor), (&__go_type_equal_identity_descriptor), ((uint8_t*)(&__go_td_pN9_main_OC_FIFO_EC_gc)), (&tmp__35), ((struct l_struct_uncommonType*)/*NULL*/0), ((struct l_struct_commonType*)/*NULL*/0) }, ((&__go_tdn_main_OC_FIFO.field0)) };
static struct l_array_3_uint8_t tmp__23 = { { 37, 120u, 10 } };
static struct l_array_16_uint8_t tmp__36 = { { 42, 9, 109u, 97u, 105u, 110u, 9, 109u, 97u, 105u, 110u, 46, 70u, 73u, 70u, 79u } };
static struct l_unnamed_2 tmp__35 = { ((&tmp__36.array[((int32_t)0)])), UINT64_C(16) };
struct l_array_5_uint8_t_KC_ __go_td_pN9_main_OC_FIFO_EC_gc = { { ((uint8_t*)(uintptr_t)UINT64_C(8)), ((uint8_t*)(uintptr_t)UINT64_C(1)), ((uint8_t*)/*NULL*/0), ((uint8_t*)(&__go_tdn_main_OC_FIFO_EC_gc)), ((uint8_t*)/*NULL*/0) } };
struct l_struct_funcVal __go_type_hash_Se_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_hash_Se) };
struct l_struct_funcVal __go_type_equal_Se_descriptor __attribute__((common)) = { ((l_fptr_1*)__go_type_equal_Se) };
static struct l_array_15_uint8_t tmp__37 = { { 9, 109u, 97u, 105u, 110u, 9, 109u, 97u, 105u, 110u, 46, 70u, 73u, 70u, 79u } };
static struct l_unnamed_2 tmp__33 = { ((&tmp__37.array[((int32_t)0)])), UINT64_C(15) };
static struct l_array_4_uint8_t tmp__38 = { { 70u, 73u, 70u, 79u } };
static struct l_unnamed_2 tmp__39 = { ((&tmp__38.array[((int32_t)0)])), UINT64_C(4) };
static struct l_array_4_uint8_t tmp__40 = { { 109u, 97u, 105u, 110u } };
static struct l_unnamed_2 tmp__41 = { ((&tmp__40.array[((int32_t)0)])), UINT64_C(4) };
static struct l_struct_uncommonType tmp__34 = { (&tmp__39), (&tmp__41), { ((struct l_struct_method*)/*NULL*/0), UINT64_C(0), UINT64_C(0) } };
struct l_array_2_uint8_t_KC_ __go_tdn_main_OC_FIFO_EC_gc;


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

static uint8_t* main_OC_f(uint8_t* llvm_cbe_tmp__1) {
  void llvm_cbe_tmp__2;    /* Address-exposed local */
  void* llvm_cbe_tmp__3;    /* Address-exposed local */

  llvm_cbe_tmp__3 = (&llvm_cbe_tmp__2);
  return (((uint8_t*)(((void*)(&llvm_cbe_tmp__3)))));
}


void main_OC__OC_import(uint8_t* llvm_cbe_tmp__4) {
  bool llvm_cbe_tmp__5;

  llvm_cbe_tmp__5 = ((init_EC_guard)&1);
  if (llvm_cbe_tmp__5) {
    goto llvm_cbe__2e_0_2e_entry;
  } else {
    goto llvm_cbe_tmp__6;
  }

llvm_cbe__2e_0_2e_entry:
  return;
llvm_cbe_tmp__6:
  init_EC_guard = ((1) & 1);
  fmt_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
  goto llvm_cbe__2e_0_2e_entry;

}


void main_OC_main(uint8_t* llvm_cbe_tmp__7) {
  struct l_array_1_struct_AC_l_unnamed_1 llvm_cbe_tmp__8;    /* Address-exposed local */
  struct l_array_1_struct_AC_l_unnamed_1* llvm_cbe_tmp__9;    /* Address-exposed local */
  struct l_unnamed_2 llvm_cbe_tmp__10;    /* Address-exposed local */
  struct l_unnamed_3 llvm_cbe_tmp__11;    /* Address-exposed local */
  struct l_unnamed_4 llvm_cbe_tmp__12;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__13;
  uint8_t* llvm_cbe_tmp__14;
  struct l_unnamed_1 llvm_cbe_tmp__15;
  struct l_unnamed_3 llvm_cbe_tmp__16;
  struct l_unnamed_3 llvm_cbe_tmp__17;
  struct l_unnamed_3 llvm_cbe_tmp__18;
  uint8_t* llvm_cbe_tmp__19;
  uint64_t llvm_cbe_tmp__20;
  uint64_t llvm_cbe_tmp__21;
  struct l_unnamed_1 llvm_cbe_tmp__22;

  llvm_cbe_tmp__13 = main_OC_f(/*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__9 = (&llvm_cbe_tmp__8);
  llvm_cbe_tmp__14 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_1*)(&llvm_cbe_tmp__9))));
  llvm_cbe_tmp__15 = llvm_ctor_unnamed_1(((&__go_td_pN9_main_OC_FIFO.field0.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
  llvm_cbe_tmp__15.field1 = llvm_cbe_tmp__13;
  *(((struct l_unnamed_1*)(((uint8_t*)((&(*(((struct l_unnamed_1*)llvm_cbe_tmp__14))))))))) = llvm_cbe_tmp__15;
  llvm_cbe_tmp__16 = llvm_ctor_unnamed_3(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
  llvm_cbe_tmp__16.field0 = ((&(*llvm_cbe_tmp__14)));
  llvm_cbe_tmp__17 = llvm_cbe_tmp__16;
  llvm_cbe_tmp__17.field1 = UINT64_C(1);
  llvm_cbe_tmp__18 = llvm_cbe_tmp__17;
  llvm_cbe_tmp__18.field2 = UINT64_C(1);
  llvm_cbe_tmp__10 = llvm_ctor_unnamed_2(((&tmp__23.array[((int32_t)0)])), UINT64_C(3));
  llvm_cbe_tmp__19 = *((&llvm_cbe_tmp__10.field0));
  llvm_cbe_tmp__20 = *((&llvm_cbe_tmp__10.field1));
  llvm_cbe_tmp__11 = llvm_cbe_tmp__18;
  llvm_cbe_tmp__12 = fmt_OC_Printf(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__19, llvm_cbe_tmp__20, llvm_cbe_tmp__11);
  llvm_cbe_tmp__21 = *((&llvm_cbe_tmp__12.field0));
  llvm_cbe_tmp__22 = *((&llvm_cbe_tmp__12.field1));
}


uint64_t __go_type_hash_Se(uint8_t* llvm_cbe_tmp__24, uint64_t llvm_cbe_tmp__25) {
  void* llvm_cbe_tmp__26;

  llvm_cbe_tmp__26 = ((void*)llvm_cbe_tmp__24);
  return UINT64_C(0);
}


uint8_t __go_type_equal_Se(uint8_t* llvm_cbe_tmp__27, uint8_t* llvm_cbe_tmp__28, uint64_t llvm_cbe_tmp__29) {
  void* llvm_cbe_tmp__30;
  void* llvm_cbe_tmp__31;

  llvm_cbe_tmp__30 = ((void*)llvm_cbe_tmp__27);
  llvm_cbe_tmp__31 = ((void*)llvm_cbe_tmp__28);
  return 1;
}


void __go_init_main(uint8_t* llvm_cbe_tmp__32) {
  main_OC__OC_import(/*UNDEF*/((uint8_t*)/*NULL*/0));
}

