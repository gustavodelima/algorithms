package main

import (
	"fmt"
)

// linearSearch function takes an array and a target value.
// It returns the index of the target value if found in the array.
// If the target is not found, it returns -1.
func linearSearch(data []int, target int) int {
	for index, value := range data {
		if value == target {
			return index // Return the index where the target is found
		}
	}
	return -1 // Return -1 if the target is not found
}

func main() {
	data := []int{3, 5, 7, 9, 1, 2, 4, 6, 8, 0} // Sample array
	target := 4                                // Target value to search for

	result := linearSearch(data, target)
	if result != -1 {
		fmt.Printf("Target %d found at index %d\n", target, result)
	} else {
		fmt.Println("Target not found")
	}
}
