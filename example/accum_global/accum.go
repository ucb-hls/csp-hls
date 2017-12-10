package main

//import "fmt"
var s = []int{7, 2, 8, -9, 4, 0}

func accum(c chan int) {

	accum := 0
	for _, v := range s {
		accum += v
	}
	c <- accum // send accum to c
}

func main() {

	c := make(chan int)
	go accum(c)
	_ = <-c // receive from c

	//fmt.Println(x)
}
