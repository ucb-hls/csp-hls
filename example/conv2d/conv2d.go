package main

import "fmt"

func process1(in, out chan int) {
  filter_row := [3]int{0, 1, 2}
  for i := 0; i < 6; i++ {
    item1 := <- in
    item2 := <- in
    for j := 0; j < 6; j++ {
      item3 := <- in
      out <- item1 * filter_row[0] + item2 * filter_row[1] +
             item3 * filter_row[2]
      item1 = item2
      item2 = item3
    }
  }
}

func process2(in, out chan int) {
  filter_row := [3]int{3, 4, 5}
  for i := 0; i < 6; i++ {
    item1 := <- in
    item2 := <- in
    for j := 0; j < 6; j++ {
      item3 := <- in
      out <- item1 * filter_row[0] + item2 * filter_row[1] +
             item3 * filter_row[2]
      item1 = item2
      item2 = item3
    }
  }
}

func process3(in, out chan int) {
  filter_row := [3]int{6, 7, 8}
  for i := 0; i < 6; i++ {
    item1 := <- in
    item2 := <- in
    for j := 0; j < 6; j++ {
      item3 := <- in
      out <- item1 * filter_row[0] + item2 * filter_row[1] +
             item3 * filter_row[2]
      item1 = item2
      item2 = item3
    }
  }
}

func process4(in1, in2, in3, out chan int) {
  for i := 0; i < 6; i++ {
    for j := 0; j < 6; j++ {
      item1 := <- in1
      item2 := <- in2
      item3 := <- in3
      out <- item1 + item2 + item3
    }
  }
}

func main() {
    c1_in := make(chan int, 10); // Host->FPGA
    c2_in := make(chan int, 10); // Host->FPGA
    c3_in := make(chan int, 10); // Host->FPGA
    c1_out := make(chan int, 1); // FPGA
    c2_out := make(chan int, 1); // FPGA
    c3_out := make(chan int, 1); // FPGA
    c4 := make(chan int, 1); // FPGA->Host

    var array [8][8] int
    var result [6][6] int
    for i := 0; i < 8; i++ {
      for j := 0; j < 8; j++ {
        array[i][j] = i + j
      }
    }

    // Host->FPGA
    go func() {
      for i := 0; i < 6; i++ {
        for j := 0; j < 8; j++ {
          c1_in <- array[i + 0][j];
        }
      }
    }()

    // Host->FPGA
    go func() {
      for i := 0; i < 6; i++ {
        for j := 0; j < 8; j++ {
          c2_in <- array[i + 1][j];
        }
      }
    }()

    // Host->FPGA
    go func() {
      for i := 0; i < 6; i++ {
        for j := 0; j < 8; j++ {
          c3_in <- array[i + 2][j];
        }
      }
    }()

    go process1(c1_in, c1_out) // to FPGA
    go process2(c2_in, c2_out) // to FPGA
    go process3(c3_in, c3_out) // to FPGA
    go process4(c1_out, c2_out, c3_out, c4) // to FPGA

    for i := 0; i < 6; i++ {
      for j := 0; j < 6; j++ {
        item := <- c4
        result[i][j] = item
      }
    }

    fmt.Println("Original array")
    for i := 0; i < 8; i++ {
      for j := 0; j < 8; j++ {
        fmt.Printf("%4d ", array[i][j])
      }
      fmt.Println()
    }

    fmt.Println("Result array")
    for i := 0; i < 6; i++ {
      for j := 0; j < 6; j++ {
        fmt.Printf("%4d ", result[i][j])
      }
      fmt.Println()
    }

}
