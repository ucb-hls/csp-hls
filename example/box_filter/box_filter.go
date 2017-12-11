package main

import "fmt"

const NUM_ROWS = 256
const NUM_COLS = 256

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

func stream_data(channel chan int) {
  for i := 0; i < NUM_ROWS; i++ {
    channel <- 0 // for edge
    for j := 0; j < NUM_COLS; j++ {
      channel <- array[i][j]
    }
    channel <- 0 // for edge
  }
}

func main() {
    c1 := make(chan int, NUM_ROWS * NUM_COLS); // Host->FPGA
    c2 := make(chan int, NUM_ROWS * NUM_COLS); // Host->FPGA
    c3 := make(chan int, NUM_ROWS * NUM_COLS); // Host->FPGA

    //var array [NUM_ROWS][NUM_COLS] int
    var result [NUM_ROWS][NUM_COLS] int
    for i := 0; i < NUM_ROWS; i++ {
      for j := 0; j < NUM_COLS; j++ {
        array[i][j] = (i + j) % 255
      }
    }

    // Host->FPGA
    go stream_data(c1)

    go process1(c1, c2) // to FPGA
    go process2(c2, c3) // to FPGA

    for i := 0; i < NUM_ROWS; i++ {
      for j := 0; j < NUM_COLS; j++ {
        item := <- c3
        result[i][j] = item
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
    fmt.Println("checksum: ", checksum)
}
