/*
 * sum.c
 *
 *  Created on: Nov 22, 2017
 *      Author: huangqij
 */

#include "legup/streaming.h"
#include <stdio.h>
#include <pthread.h>
// 1. Array size must be known in advance for synthesis
#define N 6
#define PART 2
// 2. You cannot pass pointers around unless there is a mem intetface

/*
func sum(s []int, c chan int) {
    sum := 0
    for _, v := range s {
        sum += v
    }
    c <- sum // send sum to c
}
*/
int s[6] = {7, 2, 8, -9, 4, 0};

struct thread_data {
    int s_index;
    FIFO *c;
};

void *sum (void *args ) {

	struct thread_data *data = (struct thread_data *)args;
	int sec = data -> s_index;
	int i;
	int sum = 0;

	for (i = sec; i < sec + (N/PART); i++) {
		sum += s[i];
	}
	fifo_write((FIFO*)data -> c, sum);
    pthread_exit(NULL);
}

/*
func main() {
    s := []int{7, 2, 8, -9, 4, 0}

    c := make(chan int)
    go sum(s[:len(s)/2], c)
    go sum(s[len(s)/2:], c)
    x, y := <-c, <-c // receive from c

    fmt.Println(x, y, x+y)
}
*/

int main(){
    pthread_t sum1_t, sum2_t;

	FIFO *c = fifo_malloc(/*data_width =*/ 32, /*fifo_depth =*/ 10);

    struct thread_data data1, data2;

    data1.c = c;
    data2.c = c;
    data1.s_index = 0;
    data2.s_index = N/PART;
    pthread_create(&sum1_t, NULL, sum, (void *)&data1);
    pthread_create(&sum2_t, NULL, sum, (void *)&data2);
    int x = fifo_read(c);
    int y = fifo_read(c);
    printf("%d, %d, %d", x, y, x+y);

	return 0;
}
