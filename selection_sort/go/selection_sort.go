package main

import "fmt"

// Function to perform Selection Sort
func selectionSort(arr []int) {
    n := len(arr)
    for i := 0; i < n-1; i++ {
        // Find the minimum element in the unsorted part of the array
        minIdx := i
        for j := i + 1; j < n; j++ {
            if arr[j] < arr[minIdx] {
                minIdx = j
            }
        }

        // Swap the found minimum element with the first element
        arr[i], arr[minIdx] = arr[minIdx], arr[i]
    }
}

func main() {
    // Example array
    arr := []int{64, 25, 12, 22, 11}
    fmt.Println("Original array:", arr)
    
    // Sorting the array using selection sort
    selectionSort(arr)
    fmt.Println("Sorted array:", arr)
}
