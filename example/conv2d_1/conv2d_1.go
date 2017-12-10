package main

import "fmt"

func process1(in, out1, out2, out3 chan int) {
  filter := [3][3]int{{0, 1, 2}, {3, 4, 5}, {6, 7, 8}}

  for i := 0; i < 8; i++ {
    item1 := <- in
    item2 := <- in

    for j := 0; j < 6; j++ {
      item3 := <- in
      if (!(0 > i || 0 <= i - 6)) {
        tmp := item1 * filter[0][0] + item2 * filter[0][1] +
              item3 * filter[0][2]

        out1 <- tmp
      }
 
      if (!(1 > i || 1 <= i - 6)) {
        tmp := item1 * filter[1][0] + item2 * filter[1][1] +
              item3 * filter[1][2]

        out2 <- tmp
      }

      if (!(2 > i || 2 <= i - 6)) {
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
  for i := 0; i < 6; i++ {
    for j := 0; j < 6; j++ {
      item1 := <- in1
      item2 := <- in2
      item3 := <- in3
      out <- (item1 + item2 + item3)
    }
  }
}

func main() {
    c1 := make(chan int, 100); // Host->FPGA
    c2 := make(chan int, 20); // Host->FPGA
    c3 := make(chan int, 10); // Host->FPGA
    c4 := make(chan int, 10); // FPGA->Host
    c5 := make(chan int, 100); // FPGA->Host

    var array [8][8] int
    var result [6][6] int
    for i := 0; i < 8; i++ {
      for j := 0; j < 8; j++ {
        array[i][j] = i + j
      }
    }

    // Host->FPGA
    go func() {
      for i := 0; i < 8; i++ {
        for j := 0; j < 8; j++ {
          c1 <- array[i][j];
        }
      }
    }()


    go process1(c1, c2, c3, c4) // to FPGA
    go process2(c2, c3, c4, c5) // to FPGA

    for i := 0; i < 6; i++ {
      for j := 0; j < 6; j++ {
        item := <- c5
        result[i][j] = item
      }
    }

    fmt.Println("Original array")
    for i := 0; i < 8; i++ {
      for j := 0; j < 8; j++ {
        fmt.Print(array[i][j], " ")
      }
      fmt.Println()
    }

    fmt.Println("Result array")
    for i := 0; i < 6; i++ {
      for j := 0; j < 6; j++ {
        fmt.Print(result[i][j], " ")
      }
      fmt.Println()
    }

}
