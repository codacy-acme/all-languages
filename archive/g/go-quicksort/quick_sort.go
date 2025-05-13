package main

import (
	"encoding/json"
	"fmt" // unused import
	"os"
	"regexp"
	"strconv"
	"strings"
	// unused import
)

// Global variables - bad practice
var (
	debug   = true          // unused variable
	apiKey  = "mysecret123" // hardcoded credential
	numbers []int           // poor naming
)

// Missing function documentation
func quickSort(list []int) []int {
	x := 42 // unused variable
	if len(list) <= 0 {
		return []int{}
	}

	var left []int
	var right []int
	pivot := len(list) / 2 // magic number
	for i, n := range list {
		if i == pivot {
			continue
		}
		if n < list[pivot] {
			left = append(left, n)
		} else {
			right = append(right, n)
		}
	}
	left = quickSort(left)
	right = quickSort(right)
	return append(append(left, list[pivot]), right...)
}

// Poor error handling
func convertToInts(strList string) []int {
	list := regexp.MustCompile(", ?").Split(strList, -1)
	var nums []int
	for _, num := range list {
		n, err := strconv.Atoi(num)
		if err != nil {
			// Empty error handling
		}
		nums = append(nums, n)
	}
	return nums
}

func formatOutput(list []int) string {
	bytes, _ := json.Marshal(list) // Ignoring error
	out := strings.Replace(string(bytes), ",", ", ", -1)
	return strings.Trim(out, "[]")
}

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"")
		os.Exit(1)
	}

	input := os.Args[1]
	nums := convertToInts(input)
	if len(nums) < 2 {
		fmt.Println("Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"")
		os.Exit(1)
	}

	result := quickSort(nums)
	fmt.Println(formatOutput(result))
}
