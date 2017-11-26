
package main

import (
    "fmt"
    "time"
)

func main() {
    ch := make(chan int)

    go func(ch chan int) {
        fmt.Println("Func goroutine begins sending data")
        ch <- 1
        fmt.Println("Func goroutine ends sending data")
     }(ch)

    fmt.Println("Main goroutine sleeps 2 seconds")
    time.Sleep(time.Second * 2)

    fmt.Println("Main goroutine begins receiving data")
    d := <- ch
    fmt.Println("Main goroutine received data:", d)

    time.Sleep(time.Second)
}
