package main

import "fmt"

func main() {

    // Create a new channel with `make(chan val-type)`.
    // Channels are typed by the values they convey.
    messages := make(chan int)

	 //channs := [4]chan int {
	 //  nil,
	 //  make(chan int, 2),
	 //  nil, nil}
	 //channs[1] <- 1

    // _Send_ a value into a channel using the `channel <-`
    // syntax. Here we send `"ping"`  to the `messages`
    // channel we made above, from a new goroutine.
    go func() { messages <- 7 }()
	 go func() { messages <- 19 }()
	 //b := 2
	 //go func(a int) { messages <- a}(b)

    // The `<-channel` syntax _receives_ a value from the
    // channel. Here we'll receive the `"ping"` message
    // we sent above and print it out.
    msg := <-messages
    fmt.Println(msg)
}
