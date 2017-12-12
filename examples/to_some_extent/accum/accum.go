package main

import "fmt"

func accum(c chan int) {

	s := []int{7, 2, 8, -9, 4, 0}
	accum := 0
	for _, v := range s {
		accum += v
	}
	c <- accum // send accum to c
}

func main() {

	c := make(chan int)
	go accum(c)
	x := <-c // receive from c

	fmt.Println(x)
}
