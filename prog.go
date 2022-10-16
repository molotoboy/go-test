package main

import (
	"fmt"
	"log"
)

func main() {

	// in := "aaabbbccccc"
	// out := "a3b3c5"
	var in string
	_, err := fmt.Scan(&in)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%s", Counter(in))
}
