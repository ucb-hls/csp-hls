package main

import "fmt"

func g() {
	fmt.Println("g()")
	panic("shit happened")
}

func h() {
	fmt.Println("h()")
}

func f() {
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("recovered from panic")
			h()
		}
	}()
	g()
	fmt.Println("f()")
}

func main() {
	f()
}
