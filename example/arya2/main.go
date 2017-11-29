package main

import "fmt"
import "time"

func producer(output chan int) {
	for {
		output <- 1
	}
}

func consumer(name string, input chan int) {
	i := <-input
	fmt.Println(name, "got", i)
}

func main() {
	c := make(chan int)

	go consumer("steve", c)
	go consumer("jane", c)
	go producer(c)

	time.Sleep(50 * time.Millisecond)
}
