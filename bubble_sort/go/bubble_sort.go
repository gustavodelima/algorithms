package main

import "fmt"

// bubbleSort function sorts an array using bubble sort algorithm
func bubbleSort(arr []int) {
    n := len(arr)
    for i := 0; i < n; i++ {
        swapped := false
        for j := 0; j < n-i-1; j++ {
            if arr[j] > arr[j+1] {
                arr[j], arr[j+1] = arr[j+1], arr[j]
                swapped = true
            }
        }
        // If no two elements were swapped by inner loop, then break
        if !swapped {
            break
        }
    }
}

func main() {
    sample := []int{64, 34, 25, 12, 22, 11, 90}
    fmt.Println("Original array:", sample)
    bubbleSort(sample)
    fmt.Println("Sorted array:  ", sample)
}
