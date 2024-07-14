package main

import "fmt"

// InsertionSort sorts an array of integers using the insertion sort algorithm.
func InsertionSort(arr []int) {
    for i := 1; i < len(arr); i++ {
        key := arr[i]
        j := i - 1

        // Move elements of arr[0..i-1], that are greater than key,
        // to one position ahead of their current position
        for j >= 0 && arr[j] > key {
            arr[j+1] = arr[j]
            j = j - 1
        }
        arr[j+1] = key
    }
}

func main() {
    // Example array
    array := []int{9, 5, 1, 4, 3}
    fmt.Println("Original array:", array)

    // Sorting the array
    InsertionSort(array)
    fmt.Println("Sorted array:  ", array)
}
