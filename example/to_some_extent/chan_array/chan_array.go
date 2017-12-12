package main

//import "fmt"

func process(chans [5]chan int) {

	for i := 0; i < 5; i++ {
		chans[i] <- i
	}
}

func main() {

	// Create a new channel with `make(chan val-type)`.
	// Channels are typed by the values they convey.

	var chans [5]chan int
	for i := 0; i < 5; i++ {
		chans[i] = make(chan int)
	}
	// _Send_ a value into a channel using the `channel <-`
	// syntax. Here we send `"ping"`  to the `messages`
	// channel we made above, from a new goroutine.
	//go func() { messages <- 7 }()

	go process(chans)
	//b := 2
	//go func(a int) { messages <- a}(b)

	// The `<-channel` syntax _receives_ a value from the
	// channel. Here we'll receive the `"ping"` message
	// we sent above and print it out.
	//msg := <-messages

	for i := 0; i < 5; i++ {
		_ = <-chans[i]
	}
	//fmt.Println(msg)
}
