package main

import (
	"fmt"
	"time"
)

func main() {
	hello_world_bytes := []byte{0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21}
	now := time.Now()
	count := 0
	for count < 100000 {
		upcase := make([]byte, 1, 1)
		for _, c := range hello_world_bytes {
			if 0x41 <= c && c <= 0x7a {
				upcase = append(upcase, c-0x20)
			} else {
				upcase = append(upcase, c)
			}
		}
		count += 1
	}
	fmt.Printf("%v\n", time.Since(now))
	// fmt.Println(string(upcase))
}
