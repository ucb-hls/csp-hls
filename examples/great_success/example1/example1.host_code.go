package main

/*
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>

int open_write0_32() {
  int status = open("/dev/xillybus_write0_32", O_WRONLY);
  return status;
}

int open_read0_32() {
  int status = open("/dev/xillybus_read0_32", O_RDONLY);
  return status;
}

void write_data(int channel, int data) {
  write(channel, (void *) &data, sizeof(data));
}

int read_data(int channel) {
  int data;
  read(channel, (void *) &data, sizeof(data));
  return data;
}

void close_channel(int channel) {
  close(channel);
}

*/
import "C"
import "fmt"

func process1(in, out chan int) {
  for i := 0; i < 5; i++ {
    item := <- in;
    out <- item * 2 + 1;
  }
}

func process2(in, out chan int) {
  for i := 0; i < 10; i++ {
    item := <- in;
    out <- (item - 1) / 2;
  }
}

func main() {
  //c1 := make(chan int, 10) 
  c1 := C.open_write0_32()
  //c2 := make(chan int, 10) // in hardware
  //c3 := make(chan int, 10);
  c3 := C.open_read0_32()
  fmt.Println("status: ", c1, c3)

  for i := 0; i < 10; i++ {
    //c1 <- i * i;
    fmt.Println("Host sending: ", i * i)
    C.write_data(c1, C.int(i * i))
  }

  //go process1(c1, c2); // in hardware
  //go process2(c1, c2); // in hardware
  //go process3(c2, c3); // in hardware

  for i := 0; i < 10; i++ {
    //x := <-c3;
    x := C.read_data(c3)
    fmt.Println("Host receiving: ", x)
  }

  //close(c1)
  //close(c2)
  //close(c3)
  C.close_channel(c1)
  C.close_channel(c3)
}
