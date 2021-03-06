package main

import "fmt"

const NUM_ROWS = 4096
const NUM_COLS = 4096
const KERNEL_SIZE = 3
const NUM_ROWS1 = NUM_ROWS - KERNEL_SIZE + 1
const NUM_COLS1 = NUM_COLS - KERNEL_SIZE + 1

var array [NUM_ROWS][NUM_COLS] int
func process1(in, out1, out2, out3 chan int) {
  filter := [KERNEL_SIZE][KERNEL_SIZE]int{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}}

  for i := 0; i < NUM_ROWS; i++ {
    item1 := <- in
    item2 := <- in

    for j := 0; j < NUM_COLS1; j++ {
      item3 := <- in
      if (!(0 > i || 0 <= i - NUM_ROWS1)) {
        tmp := item1 * filter[0][0] + item2 * filter[0][1] +
              item3 * filter[0][2]

        out1 <- tmp
      }
 
      if (!(1 > i || 1 <= i - NUM_ROWS1)) {
        tmp := item1 * filter[1][0] + item2 * filter[1][1] +
              item3 * filter[1][2]

        out2 <- tmp
      }

      if (!(2 > i || 2 <= i - NUM_ROWS1)) {
        tmp := item1 * filter[2][0] + item2 * filter[2][1] +
              item3 * filter[2][2]

        out3 <- tmp
      }

      item1 = item2
      item2 = item3
    }
  }
}

func process2(in1, in2, in3, out chan int) {
  for i := 0; i < NUM_ROWS1; i++ {
    for j := 0; j < NUM_COLS1; j++ {
      item1 := <- in1
      item2 := <- in2
      item3 := <- in3
      out <- (item1 + item2 + item3)
    }
  }
}

func stream_data(channel chan int) {
  for i := 0; i < NUM_ROWS; i++ {
    for j := 0; j < NUM_COLS; j++ {
      channel <- array[i][j]
    }
  }
}

func main() {
    c1 := make(chan int, NUM_COLS); // Host->FPGA
    c2 := make(chan int, 3 * NUM_COLS); // Host->FPGA
    c3 := make(chan int, NUM_COLS); // Host->FPGA
    c4 := make(chan int, NUM_COLS); // FPGA->Host
    c5 := make(chan int, NUM_COLS); // FPGA->Host

    //var array [NUM_ROWS][NUM_COLS] int
    var result [NUM_ROWS1][NUM_COLS1] int
    for i := 0; i < NUM_ROWS; i++ {
      for j := 0; j < NUM_COLS; j++ {
        array[i][j] = (i + j) % 5
      }
    }

    // Host->FPGA
    go stream_data(c1)

    go process1(c1, c2, c3, c4) // to FPGA
    go process2(c2, c3, c4, c5) // to FPGA

    for i := 0; i < NUM_ROWS1; i++ {
      for j := 0; j < NUM_COLS1; j++ {
        item := <- c5
        result[i][j] = item
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
    fmt.Println("checksum: ", checksum)
}
