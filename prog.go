package main

import (
	"fmt"
)

func main() {

	// in := "aaabbbccccc"
	// out := "a3b3c5"
	var in string
	_, err := fmt.Scan(&in)
	if err != nil {
		fmt.Println("Error: ", err)
	}
	fmt.Printf("%s", Counter(in))
}
