package main

import "fmt"
import "time"

type Bogus struct {
	field int
}

func producer(output chan Bogus) {
	for {
		b := Bogus{ 2 }
		output <- b
	}
}

func consumer(name string, input chan Bogus) {
	b := <-input
	fmt.Println(name, "got", b.field)
}

func main() {
	c := make(chan Bogus)

	go consumer("steve", c)
	go consumer("jane", c)
	go producer(c)

	time.Sleep(50 * time.Millisecond)
}
