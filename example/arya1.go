package main

import "fmt"
import "time"

func producer(out chan int, quit chan bool) {
  for i := 1;; i++ {
    select {
    case <-quit:
      fmt.Println("producer quit")
    case out <- i:
      fmt.Println("producer produced")
    }
  }
  fmt.Println("producer done")
}

func consumer_1(in chan int, out chan int, quit chan bool) {
  for {
    select {
    case <-quit:

    case x := <-in:
      // This blocks until out is available for writing, since 'out' isn't
      // buffered.
      y := x
      select {
      case out <- y:
      default:
      }
    }
  }
  fmt.Println("consumer_1 done")
}

func consumer_2(in chan int, out chan int, quit chan bool) {
  for {
    select {
    case <-quit:
      fmt.Println("quit")
    case x := <-in:
      // This blocks until out is available for writing, since 'out' isn't
      // buffered.
      y := 10 * x * x * x
      select {
      case out <- y:
      default:
      }
    }
  }
  fmt.Println("consumer_2 done")
}

func main() {
  quit := make(chan bool, 10)
  a := make(chan int)
  b := make(chan int)

  go producer(a, quit)

  go consumer_1(a, b, quit)
  go consumer_2(a, b, quit)

  for i := 0; i < 5; i++ {
    fmt.Println(<-b)
    fmt.Println(<-b)
  }

  for i := 0; i < 3; i++ {
    quit <- true
  }
  time.Sleep(1 * time.Second)
}
