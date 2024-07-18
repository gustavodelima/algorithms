package main

import (
	"fmt"
)

// BinarySearch function takes a sorted array and a target value
// It returns the index of the target if found, otherwise -1
func BinarySearch(array []int, target int) int {
	low := 0
	high := len(array) - 1

	for low <= high {
		mid := low + (high-low)/2

		// Check if target is present at mid
		if array[mid] == target {
			return mid
		}

		// If target greater, ignore left half
		if array[mid] < target {
			low = mid + 1
		} else {
			// If target is smaller, ignore right half
			high = mid - 1
		}
	}

	// Target was not found in the array
	return -1
}

func main() {
	array := []int{2, 3, 4, 10, 40} // Must be sorted
	target := 10

	result := BinarySearch(array, target)
	if result != -1 {
		fmt.Printf("Element found at index %d\n", result)
	} else {
		fmt.Println("Element not found in the array")
	}
}
