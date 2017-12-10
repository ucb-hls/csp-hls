package main

//import "fmt"

func main() {
	c := make(chan int)
	a := 19
	go func(someChan chan int) {
		someChan <- a
	}(c)
	_ = <-c
}
