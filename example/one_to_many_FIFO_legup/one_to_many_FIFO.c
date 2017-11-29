// Simple example showing how to describe one-to-many FIFO connections in LegUp. 
// In this example, there is one producer (1 thread) writing data to a 
// work queue (FIFO), and three producers (3 threads) reading data from the 
// same work queue. Arbitration logic on the read side of the FIFO is 
// automatically created by LegUp. 

#include "legup/streaming.h"
#include <stdio.h>
#include <pthread.h>

#define NUM_CONSUMERS 3
#define SIZE NUM_CONSUMERS*100

// Struct for threading function argument.
typedef struct {
    FIFO *input;
    FIFO *output;
} thread_data;

void *producer(void *threadArg) {
    thread_data *arg = (thread_data *)threadArg;
    FIFO *input_fifo = arg->input;
    FIFO *output_fifo = arg->output;

producer_loop:
    // This loop is pipelined and is "always running", just like how a
    // streaming module always executes whenever new input is available.
    while (1) {
        // Read from input FIFO.
        int in = fifo_read(input_fifo);
    
        // Perform some computation.
        int data = in;
        
        // Write to output FIFO.
        fifo_write(output_fifo, data);
    }

    pthread_exit(NULL);
}

void *consumer(void *threadArg) {
    thread_data *arg = (thread_data *)threadArg;
    FIFO *input_fifo = arg->input;
    FIFO *output_fifo = arg->output;

consumer_loop:
    // This loop is pipelined and is "always running", just like how a
    // streaming module always executes whenever new input is available.
    while (1) {
        // Read from input FIFO.
        int in = fifo_read(input_fifo);
    
        // Perform some computation.
        int data = in;
                
        // Write to output FIFO.
        fifo_write(output_fifo, data);
    }

    pthread_exit(NULL);
}


int main() {

    int i, j;
    // Create input and output FIFOs for kernels.
    // Input fifo for producer.
    FIFO *producer_input_fifo = fifo_malloc(/*width*/ 32, /*depth*/ SIZE);
    // This work queue ifo is shared between the producer and all consumers.
    // Arbitration is created automatically a FIFO shared by multiple threads. 
    FIFO *work_queue_fifo = fifo_malloc(/*width*/ 32, /*depth*/ SIZE);
    // Output fifo for each consumer.
    FIFO *consumer_output_fifo[NUM_CONSUMERS];
    #pragma unroll
    for (i = 0; i < NUM_CONSUMERS; i++) {
        consumer_output_fifo[i] = fifo_malloc(/*width*/ 32, /*depth*/ SIZE);
    }

    // Build structs of arguments for kernels.
    thread_data producer_data;
    thread_data consumer_data[NUM_CONSUMERS];

    // Assign input/output of producer kernel.
    producer_data.input = producer_input_fifo;
    producer_data.output = work_queue_fifo;

    // Assign input/output of consumer kernels.
    #pragma unroll
    for (i = 0; i < NUM_CONSUMERS; i++) {
        // Assign the same input fifo to all consumer kernels.
        consumer_data[i].input = work_queue_fifo;
        // Each consumer has its own output fifo though.
        consumer_data[i].output = consumer_output_fifo[i];
    }
    
    // Launch the kernels.
    pthread_t producer_thread_var, consumer_thread_var[NUM_CONSUMERS];
    pthread_create(&producer_thread_var, NULL, producer, (void *)&producer_data);
    for (i = 0; i < NUM_CONSUMERS; i++) {
        pthread_create(&consumer_thread_var[i], NULL, consumer, (void *)&consumer_data[i]);
    }
    
    // Push input data into the input FIFO of producer. 
    int golden_result = 0;
    for (i = 0; i < SIZE; i++) {       
        int data = i+1; 
        fifo_write(producer_input_fifo, data);
        golden_result += data;
    }
    printf("golden_result = %d\n", golden_result);

    // Get outputs from the output FIFOs of consumers.
    int computed_result = 0, count = 0;
    while (1) {
        // The support for arrays of FIFOs still in beta, so you may 
        // have to manually unroll a loop in the code as below. 
        /*
        #pragma unroll
        for (i = 0; i < NUM_CONSUMERS; i++) {
            if (!fifo_empty(consumer_output_fifo[i])) {
                int data = fifo_read(consumer_output_fifo[i]);
                computed_result += data;
                count++;
            }
        }
        */
        // If the output fifo of this consumer is not empty, get the output data
        // When there are multiple consumers retrieving data from the same
        // work queue, there's no guarantee that all consumers will get the 
        // same number of work items, hence we need to first check if the
        // output FIFO is not empty then retrieve the data, due to the blocking
        // behaviour of fifo_read.
        if (!fifo_empty(consumer_output_fifo[0])) {           
            int data = fifo_read(consumer_output_fifo[0]);
            computed_result += data;
            count++;
        }
        if (!fifo_empty(consumer_output_fifo[1])) {
            int data = fifo_read(consumer_output_fifo[1]);
            computed_result += data;
            count++;
        }
        if (!fifo_empty(consumer_output_fifo[2])) {
            int data = fifo_read(consumer_output_fifo[2]);
            computed_result += data;
            count++;
        }        
        // If we've retrieved all output data, get out of loop.
        if (count == SIZE)
            break;
    }

    // Check final result.
    printf("computed result = %d\n", computed_result);
    if (golden_result == computed_result)
        printf("PASS\n");
    else
        printf("FAIL\n");

    return 0;
}
