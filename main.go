package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	var (
		q = make(chan os.Signal)
	)

	signal.Notify(q, syscall.SIGINT, syscall.SIGTERM, syscall.SIGQUIT)
	select {
	case <-q:
		fmt.Println("quitting...")
	}
}
