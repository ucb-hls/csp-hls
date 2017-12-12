#include <hls_stream.h>
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#include <stdint.h>
#include <math.h>

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

//static void main_OC_process1(uint8_t* llvm_cbe_tmp__35, uint8_t* llvm_cbe_tmp__36, uint8_t* llvm_cbe_tmp__37) {
void main_OC_process1(hls::stream<uint64_t> &llvm_cbe_tmp__36, hls::stream<uint64_t> &llvm_cbe_tmp__37) {
#pragma HLS INTERFACE port=return s_axilite

  uint64_t llvm_cbe_tmp__38;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__39;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__40;
  uint64_t llvm_cbe_tmp__41;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = uint64_t(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done:
  return;
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)uint64_t(10)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  //__go_receive(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__36, (((uint8_t*)(&llvm_cbe_tmp__38))));
  llvm_cbe_tmp__36.read(llvm_cbe_tmp__38); // Channel Read
  llvm_cbe_tmp__40 = llvm_cbe_tmp__38;
  llvm_cbe_tmp__39 = (llvm_add_u64((llvm_mul_u64(llvm_cbe_tmp__40, uint64_t(2))), uint64_t(1)));
  //__go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__37, (((uint8_t*)(&llvm_cbe_tmp__39))));
  llvm_cbe_tmp__37.write(llvm_cbe_tmp__39); // Channel Write
  llvm_cbe_tmp__41 = llvm_add_u64(llvm_cbe_i, uint64_t(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__41;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
}

//static void main_OC_process2(uint8_t* llvm_cbe_tmp__46, uint8_t* llvm_cbe_tmp__47, uint8_t* llvm_cbe_tmp__48) {
void main_OC_process2(hls::stream<uint64_t> &llvm_cbe_tmp__47, hls::stream<uint64_t> &llvm_cbe_tmp__48) {
#pragma HLS INTERFACE port=return s_axilite
  uint64_t llvm_cbe_tmp__49;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__50;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__51;
  uint64_t llvm_cbe_tmp__52;
  uint64_t llvm_cbe_i;
  uint64_t llvm_cbe_i__PHI_TEMPORARY;

  llvm_cbe_i__PHI_TEMPORARY = uint64_t(0);   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

llvm_cbe__2e_2_2e_for_2e_done:
  return;
  do {     /* Syntactic loop '.3.for.loop' to make GCC happy */
llvm_cbe__2e_3_2e_for_2e_loop:
  llvm_cbe_i = llvm_cbe_i__PHI_TEMPORARY;
  if ((((((bool)(((uint8_t)(bool)(((((int64_t)llvm_cbe_i) < ((int64_t)uint64_t(10)))&1))))&1u))&1))) {
    goto llvm_cbe__2e_1_2e_for_2e_body;
  } else {
    goto llvm_cbe__2e_2_2e_for_2e_done;
  }

llvm_cbe__2e_1_2e_for_2e_body:
  //__go_receive(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__47, (((uint8_t*)(&llvm_cbe_tmp__49))));
  llvm_cbe_tmp__47.read(llvm_cbe_tmp__49); // Channel Read
  llvm_cbe_tmp__51 = llvm_cbe_tmp__49;
  llvm_cbe_tmp__50 = (llvm_sdiv_u64((llvm_sub_u64(llvm_cbe_tmp__51, uint64_t(1))), uint64_t(2)));
  //__go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__48, (((uint8_t*)(&llvm_cbe_tmp__50))));
  llvm_cbe_tmp__48.write(llvm_cbe_tmp__50); // Channel Write
  llvm_cbe_tmp__52 = llvm_add_u64(llvm_cbe_i, uint64_t(1));
  llvm_cbe_i__PHI_TEMPORARY = llvm_cbe_tmp__52;   /* for PHI node */
  goto llvm_cbe__2e_3_2e_for_2e_loop;

  } while (1); /* end of syntactic loop '.3.for.loop' */
}

