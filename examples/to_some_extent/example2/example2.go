package main

import "fmt"

func process1(in, out chan int) {
  for i := 0; i < 5; i++ {
    item := <- in;
    out <- item * 2 + 1;
  }
}

func process2(in, out chan int) {
  for i := 5; i < 10; i++ {
    item := <- in;
    out <- item * 2 + 1;
  }
}

func process3(in, out chan int) {
  for i := 0; i < 10; i++ {
    item := <- in;
    out <- (item - 1) / 2;
  }
}

func main() {
    c1 := make(chan int, 10);
    c2 := make(chan int, 10);
    c3 := make(chan int, 10);
    c4 := make(chan int, 10);
    for i := 0; i < 5; i++ {
      c1 <- i * i;
    }
    for i := 5; i < 10; i++ {
      c4 <- i * i;
    }

    go process1(c1, c2);
    go process2(c4, c2);
    go process3(c2, c3);
    for i := 0; i < 10; i++ {
      x := <-c3;
      fmt.Println(x)
    }
}
