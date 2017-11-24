package main;

import "fmt"

func sub_process(in int) int {
	return 2 * in * in
}

func main() {
	a := 5
	c := 0
	for ; a < 8; a++ {
		c += sub_process(a)
	}

	fmt.Println(c)
}
