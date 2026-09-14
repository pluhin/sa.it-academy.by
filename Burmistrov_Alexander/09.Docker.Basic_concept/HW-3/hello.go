package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.Println("Hello Docker! Current time:", time.Now().Format("15:04:05"))
		time.Sleep(1 * time.Second)
	}
}

