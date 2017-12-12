package main

import "fmt"
import "time"

func say(s string) {
	fmt.Println(s)
}

func main() {
	go say("hello")
	go say("world")
	time.Sleep(50 * time.Millisecond)
}
