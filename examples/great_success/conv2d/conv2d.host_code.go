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

int open_write1_32() {
  int status = open("/dev/xillybus_write1_32", O_WRONLY);
  return status;
}

int open_write2_32() {
  int status = open("/dev/xillybus_write2_32", O_WRONLY);
  return status;
}

int open_write3_32() {
  int status = open("/dev/xillybus_write3_32", O_WRONLY);
  return status;
}

int open_read0_32() {
  int status = open("/dev/xillybus_read0_32", O_RDONLY);
  return status;
}

int open_read1_32() {
  int status = open("/dev/xillybus_read1_32", O_RDONLY);
  return status;
}

int open_read2_32() {
  int status = open("/dev/xillybus_read2_32", O_RDONLY);
  return status;
}

int open_read3_32() {
  int status = open("/dev/xillybus_read3_32", O_RDONLY);
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
import "time"

const NUM_ROWS = 1024
const NUM_COLS = 1024
const KERNEL_SIZE = 3
const NUM_ROWS1 = NUM_ROWS - KERNEL_SIZE + 1
const NUM_COLS1 = NUM_COLS - KERNEL_SIZE + 1
var array [NUM_ROWS][NUM_COLS]int

func process1(in, out chan int) {
  filter_row := [KERNEL_SIZE]int{0, 1, 2}
  for i := 0; i < NUM_ROWS1; i++ {
    item1 := <-in
    item2 := <-in
    for j := 0; j < NUM_COLS1; j++ {
      item3 := <-in
      out <- item1*filter_row[0] + item2*filter_row[1] +
             item3*filter_row[2]
      item1 = item2
      item2 = item3
    }
  }
}

func process2(in, out chan int) {
  filter_row := [KERNEL_SIZE]int{3, 4, 5}
  for i := 0; i < NUM_ROWS1; i++ {
    item1 := <-in
    item2 := <-in
    for j := 0; j < NUM_COLS1; j++ {
      item3 := <-in
      out <- item1*filter_row[0] + item2*filter_row[1] +
             item3*filter_row[2]
      item1 = item2
      item2 = item3
    }
  }
}

func process3(in, out chan int) {
  filter_row := [KERNEL_SIZE]int{6, 7, 8}
  for i := 0; i < NUM_ROWS1; i++ {
    item1 := <-in
    item2 := <-in
    for j := 0; j < NUM_COLS1; j++ {
      item3 := <-in
      out <- item1*filter_row[0] + item2*filter_row[1] +
             item3*filter_row[2]
      item1 = item2
      item2 = item3
    }
  }
}

func process4(in1, in2, in3, out chan int) {
  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS1; j++ {
      item1 := <-in1
      item2 := <-in2
      item3 := <-in3
      out <- item1 + item2 + item3
    }
  }
}

//func init1(in chan int) {
func init1(in C.int) {
  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS; j++ {
      //in <- array[i + 0][j]
      C.write_data(in, C.int(array[i + 0][j]))
    }
  }
}

//func init2(in chan int) {
func init2(in C.int) {
  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS; j++ {
      //in <- array[i + 1][j]
      C.write_data(in, C.int(array[i + 1][j]))
    }
  }
}

//func init3(in chan int) {
func init3(in C.int) {
  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS; j++ {
      //in <- array[i + 2][j]
      C.write_data(in, C.int(array[i + 2][j]))
    }
  }
}

func main() {
  //c1_in := make(chan int, 10) // Host->FPGA
  //c2_in := make(chan int, 10) // Host->FPGA
  //c3_in := make(chan int, 10) // Host->FPGA
  c1_in := C.open_write0_32()
  c2_in := C.open_write1_32()
  c3_in := C.open_write2_32()
  //c1_out := make(chan int, 10) // FPGA
  //c2_out := make(chan int, 10) // FPGA
  //c3_out := make(chan int, 10) // FPGA
  //c4 := make(chan int, 1)     // FPGA->Host
  c4 := C.open_read0_32()     // FPGA->Host

  //fmt.Println("status: ", c1_in, c2_in, c3_in, c4)

  var result [NUM_ROWS1][NUM_COLS1]int
  for i := 0; i < NUM_ROWS; i++ {
    for j := 0; j < NUM_COLS; j++ {
      array[i][j] = (i + j) % 10
    }
  }

  go init1(c1_in)
  go init2(c3_in)
  go init3(c2_in)
  start := time.Now()

  //go process1(c1_in, c1_out)              // to FPGA
  //go process2(c2_in, c2_out)              // to FPGA
  //go process3(c3_in, c3_out)              // to FPGA
  //go process4(c1_out, c2_out, c3_out, c4) // to FPGA

  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS1; j++ {
      //item := <-c4
      item := C.read_data(c4)
      result[i][j] = int(item)
    }
  }

  //fmt.Println("Original array")
  //for i := 0; i < NUM_ROWS; i++ {
  //  for j := 0; j < NUM_COLS; j++ {
  //    fmt.Print(array[i][j], " ")
  //  }
  //  fmt.Println()
  //}

  //fmt.Println("Result array")
  //for i := 0; i < NUM_ROWS1; i++ {
  //  for j := 0; j < NUM_COLS1; j++ {
  //    fmt.Print(result[i][j], " ")
  //  }
  //  fmt.Println()
  //}

  checksum := 0
  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS1; j++ {
      checksum = checksum + result[i][j]
    }
  }
  fmt.Println(time.Since(start))

  fmt.Println("checksum: ", checksum)

  C.close_channel(c1_in)
  C.close_channel(c2_in)
  C.close_channel(c3_in)
  C.close_channel(c4)
}
