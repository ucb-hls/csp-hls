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

const NUM_ROWS = 4096
const NUM_COLS = 4096

var array [NUM_ROWS][NUM_COLS] int
func process1(in, out chan int) {
  for i := 0; i < NUM_ROWS; i++ {
    item1 := <- in
    item2 := <- in
    for j := 0; j < NUM_COLS; j++ {
      item3 := <- in
      out <- (item1 + item2 + item3) / 3
      item1 = item2
      item2 = item3
    }
  }
}

func process2(in, out chan int) {
  var buffer [2][NUM_COLS] int
  for i := 0; i < NUM_COLS; i++ {
    buffer[0][i] = 0
  }

  for i := 0; i < NUM_COLS; i++ {
    item := <- in
    buffer[1][i] = item
  }

  pos := 0
  for i := 1; i < NUM_ROWS; i++ {
    for j := 0; j < NUM_COLS; j++ {
      item := <- in
      out <- (buffer[0][j] + buffer[1][j] + item) / 3
      buffer[pos][j] = item
    }
    pos = 1 - pos
  }
  for j := 0; j < NUM_COLS; j++ {
    out <- (buffer[0][j] + buffer[1][j] + 0) / 3
  }
}

//func stream_data(channel chan int) {
func stream_data(channel C.int) {
  for i := 0; i < NUM_ROWS; i++ {
    //channel <- 0 // for edge
    C.write_data(channel, C.int(0))
    for j := 0; j < NUM_COLS; j++ {
      //channel <- array[i][j]
      C.write_data(channel, C.int(array[i][j]))
    }
    //channel <- 0 // for edge
    C.write_data(channel, C.int(0))
  }
}

func main() {
    start := time.Now()

    //c1 := make(chan int, NUM_COLS); // Host->FPGA
    //c2 := make(chan int, NUM_COLS); // FPGA
    //c3 := make(chan int, NUM_COLS); // FPGA->Host
    c1 := C.open_write0_32()
    c3 := C.open_read0_32()
    //fmt.Println("status: ", c1, c3)

    //var array [NUM_ROWS][NUM_COLS] int
    var result [NUM_ROWS][NUM_COLS] int
    for i := 0; i < NUM_ROWS; i++ {
      for j := 0; j < NUM_COLS; j++ {
        array[i][j] = (i + j) % 10
      }
    }

    // Host->FPGA
    go stream_data(c1)

    //go process1(c1, c2) // FPGA
    //go process2(c2, c3) // FPGA

    for i := 0; i < NUM_ROWS; i++ {
      for j := 0; j < NUM_COLS; j++ {
        //item := <- c3
        //result[i][j] = item
        item := C.read_data(c3)
        result[i][j] = int(item)
      }
    }

//    fmt.Println("Original array")
//    for i := 0; i < NUM_ROWS; i++ {
//      for j := 0; j < NUM_COLS; j++ {
//        fmt.Print(array[i][j], " ")
//      }
//      fmt.Println()
//    }
//
//    fmt.Println("Result array")
//    for i := 0; i < NUM_ROWS; i++ {
//      for j := 0; j < NUM_COLS; j++ {
//        fmt.Print(result[i][j], " ")
//      }
//      fmt.Println()
//    }

    checksum := 0
    for i := 0; i < NUM_ROWS; i++ {
      for j := 0; j < NUM_COLS; j++ {
        checksum = checksum + result[i][j]
      }
    }

    fmt.Println(time.Since(start))
    fmt.Println("checksum: ", checksum)

    C.close_channel(c1)
    C.close_channel(c3)
}
