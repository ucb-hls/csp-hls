#include "legup/streaming.h"
#include <pthread.h>

#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#include <stdint.h>
#include <math.h>
#include <stdio.h>
//#include <APInt-C.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

struct l_unnamed_3 {
  uint8_t* field0;
  // FIFO*
  //  uint8_t* field1;
  FIFO* field1;
};

//static void main_OC_main_KD_main_OC_main_EC_1(uint8_t* llvm_cbe_tmp__32) {
void* main_OC_main_KD_main_OC_main_EC_1(void *llvm_cbe_tmp__32) {
  uint64_t llvm_cbe_tmp__33;    /* Address-exposed local */
  uint8_t* llvm_cbe_tmp__34;
  //FIFO* llvm_cbe_tmp__34;
  uint8_t* llvm_cbe_tmp__35;

  //printf("read\n");
//  llvm_cbe_tmp__34 = *((&(((struct l_unnamed_3*)llvm_cbe_tmp__32))->field1));
  llvm_cbe_tmp__34 = ((struct l_unnamed_3*)llvm_cbe_tmp__32) -> field1;
  if ((((llvm_cbe_tmp__34 == ((uint8_t*)/*NULL*/0))&1))) {
    goto llvm_cbe_tmp__36;
  } else {
    goto llvm_cbe_tmp__37;
  }

  llvm_cbe_tmp__36:
//  __go_runtime_error(/*UNDEF*/((uint8_t*)/*NULL*/0), 6);
//  __builtin_unreachable();
  //printf("a");
  pthread_exit(NULL);


  llvm_cbe_tmp__37:
// JENNY: We need to get rid of the dereference operation here and probably change the type of uint8_t to FIFO*
//  llvm_cbe_tmp__35 = *(((uint8_t**)llvm_cbe_tmp__34));
  llvm_cbe_tmp__35 = llvm_cbe_tmp__34;
  llvm_cbe_tmp__33 = UINT64_C(7);
  //printf("b %d\n", llvm_cbe_tmp__33);
//  __go_send_big(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__35, (((uint8_t*)(&llvm_cbe_tmp__33))));
  fifo_write((FIFO*) llvm_cbe_tmp__35, llvm_cbe_tmp__33);
  //printf("b_exit\n");

  //JENNY
  pthread_exit(NULL);
}

//static void tmp__31(uint8_t* llvm_cbe_tmp__38) {
//  uint8_t* llvm_cbe_tmp__39;
//  uint8_t* llvm_cbe_tmp__40;
//
//  llvm_cbe_tmp__39 = *((&(((struct l_unnamed_4*)llvm_cbe_tmp__38))->field0));
//  llvm_cbe_tmp__40 = *(((uint8_t**)llvm_cbe_tmp__39));
//  (((l_fptr_1*)llvm_cbe_tmp__40))(llvm_cbe_tmp__39);
//}

//void main_OC_main(uint8_t* llvm_cbe_tmp__4) {
int main (void) {
  uint32_t llvm_cbe_tmp__5;    /* Address-exposed local */
  uint32_t llvm_cbe_tmp__6;    /* Address-exposed local */
  uint64_t llvm_cbe_tmp__7;    /* Address-exposed local */
//  struct l_unnamed_1 llvm_cbe_tmp__8;    /* Address-exposed local */
//  struct l_unnamed_2 llvm_cbe_tmp__9;    /* Address-exposed local */
//  uint8_t* llvm_cbe_tmp__10;
//  uint8_t* llvm_cbe_tmp__11;
  FIFO* llvm_cbe_tmp__11;
  uint64_t llvm_cbe_tmp__12;
  uint64_t llvm_cbe_tmp__13;
//  uint8_t* llvm_cbe_tmp__14;
  FIFO * llvm_cbe_tmp__14;
  uint8_t* llvm_cbe_tmp__15;
  struct l_unnamed_3* llvm_cbe_tmp__16;
//  uint8_t* llvm_cbe_tmp__17;
//  struct l_unnamed_4* llvm_cbe_tmp__18;
  uint8_t* llvm_cbe_tmp__19;
//  uint64_t llvm_cbe_tmp__20;
//  uint8_t* llvm_cbe_tmp__21;
//  uint8_t* llvm_cbe_tmp__22;
//  uint8_t* llvm_cbe_tmp__23;
//  uint64_t* llvm_cbe_tmp__24;
//  struct l_unnamed_3 llvm_cbe_tmp__25;
//  struct l_unnamed_1 llvm_cbe_tmp__26;
//  struct l_unnamed_1 llvm_cbe_tmp__27;
//  struct l_unnamed_1 llvm_cbe_tmp__28;
//  uint64_t llvm_cbe_tmp__29;
//  struct l_unnamed_3 llvm_cbe_tmp__30;

  //llvm_cbe_tmp__10 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), UINT64_C(8));
  //llvm_cbe_tmp__11 = ((uint8_t*)(((uint8_t**)llvm_cbe_tmp__10)));
  llvm_cbe_tmp__5 = 1010;
  llvm_cbe_tmp__12 = *(((uint64_t*)(&llvm_cbe_tmp__5)));
  llvm_cbe_tmp__6 = 30;
  llvm_cbe_tmp__13 = *(((uint64_t*)(&llvm_cbe_tmp__6)));
  //llvm_cbe_tmp__14 = fifo_malloc(llvm_cbe_tmp__12, llvm_cbe_tmp__13);
  llvm_cbe_tmp__14 = fifo_malloc(32, llvm_cbe_tmp__13);

  // this is actually for closure, the pointer thing needs to be fixed
//  *(((uint8_t**)llvm_cbe_tmp__11)) = llvm_cbe_tmp__14;
  llvm_cbe_tmp__11 = llvm_cbe_tmp__14;

  //llvm_cbe_tmp__15 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S1__Fe1__pCN3_intsree.field0.field0)), UINT64_C(16));
  // JENNY: Init new static struct
  struct l_unnamed_3 llvm_cbe_tmp__15_struct;
  llvm_cbe_tmp__15 = & llvm_cbe_tmp__15_struct;

  llvm_cbe_tmp__16 = ((struct l_unnamed_3*)llvm_cbe_tmp__15);
//  *((&llvm_cbe_tmp__16->field0)) = ((uint8_t*)main_OC_main_KD_main_OC_main_EC_1);
  *((&llvm_cbe_tmp__16->field1)) = llvm_cbe_tmp__11;
  // JENNY: New Closure
  pthread_t run;
  pthread_create(&run, NULL, main_OC_main_KD_main_OC_main_EC_1, (void *)llvm_cbe_tmp__16);

  // JENNY: Closure ref to tmp__31
//  llvm_cbe_tmp__17 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_S0_Fee.field0.field0)), UINT64_C(8));
//  llvm_cbe_tmp__18 = ((struct l_unnamed_4*)llvm_cbe_tmp__17);
//  *((&llvm_cbe_tmp__18->field0)) = (((uint8_t*)llvm_cbe_tmp__16));
//  __go_go(/*UNDEF*/((uint8_t*)/*NULL*/0), ((uint8_t*)tmp__31), (((uint8_t*)llvm_cbe_tmp__18)));
  //llvm_cbe_tmp__19 = *(((uint8_t**)llvm_cbe_tmp__11));
//  __go_receive(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_CN3_intsre.field0.field0)), llvm_cbe_tmp__19, (((uint8_t*)(&llvm_cbe_tmp__7))));
  llvm_cbe_tmp__7 = fifo_read((FIFO*)llvm_cbe_tmp__14);
//  llvm_cbe_tmp__20 = llvm_cbe_tmp__7;
//  llvm_cbe_tmp__21 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_td_AIe1e.field0.field0)), UINT64_C(16));
//  llvm_cbe_tmp__22 = ((uint8_t*)(((struct l_array_1_struct_AC_l_unnamed_3*)llvm_cbe_tmp__21)));
//  llvm_cbe_tmp__23 = __go_new(/*UNDEF*/((uint8_t*)/*NULL*/0), ((&__go_tdn_int.field0)), UINT64_C(8));
//  llvm_cbe_tmp__24 = ((uint64_t*)llvm_cbe_tmp__23);
//  *llvm_cbe_tmp__24 = llvm_cbe_tmp__20;
//  llvm_cbe_tmp__25 = llvm_ctor_unnamed_3(((&__go_tdn_int.field0)), /*UNDEF*/((uint8_t*)/*NULL*/0));
//  llvm_cbe_tmp__25.field1 = (((uint8_t*)llvm_cbe_tmp__24));
//  *(((struct l_unnamed_3*)(((uint8_t*)((&(*(((struct l_unnamed_3*)llvm_cbe_tmp__22))))))))) = llvm_cbe_tmp__25;
//  msg
//  llvm_cbe_tmp__26 = llvm_ctor_unnamed_1(((uint8_t*)/*NULL*/0), UINT64_C(0), UINT64_C(0));
//  llvm_cbe_tmp__26.field0 = ((&(*llvm_cbe_tmp__22)));
//  llvm_cbe_tmp__27 = llvm_cbe_tmp__26;
//  llvm_cbe_tmp__27.field1 = UINT64_C(1);
//  llvm_cbe_tmp__28 = llvm_cbe_tmp__27;
//  llvm_cbe_tmp__28.field2 = UINT64_C(1);
//  llvm_cbe_tmp__8 = llvm_cbe_tmp__28;
//  llvm_cbe_tmp__9 = fmt_OC_Println(/*UNDEF*/((uint8_t*)/*NULL*/0), llvm_cbe_tmp__8);
  printf("%d\n", llvm_cbe_tmp__7);
//  llvm_cbe_tmp__29 = *((&llvm_cbe_tmp__9.field0));
//  llvm_cbe_tmp__30 = *((&llvm_cbe_tmp__9.field1));
  return 0;
}
