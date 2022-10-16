package main

import (
	"fmt"
	"sort"
)

type RuneSlice []rune

func (s RuneSlice) Len() int           { return len(s) }
func (s RuneSlice) Less(i, j int) bool { return s[i] < s[j] }
func (s RuneSlice) Swap(i, j int)      { s[i], s[j] = s[j], s[i] }

func Counter(input string) (output string) {
	letters := make(map[rune]int)
	for _, c := range input {
		letters[c]++
	}
	keys := make(RuneSlice, 0, len(letters))
	for k := range letters {
		keys = append(keys, k)
	}
	sort.Sort(keys)
	for i, c := range keys {
		output += fmt.Sprintf("%c%v", c, letters[keys[i]])
	}
	return output
}
