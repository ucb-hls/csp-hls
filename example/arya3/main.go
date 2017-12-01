package main

import "fmt"

type FIFO struct {}

func f() *FIFO {
	return &FIFO{}
}

func main() {
	b := f()
	fmt.Printf("%x\n", b)
}
