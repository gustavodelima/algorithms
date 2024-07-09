#!/bin/bash

# Function to perform bubble sort
bubble_sort() {
    local arr=("$@")
    local n=${#arr[@]}
    local swapped=true

    while $swapped; do
        swapped=false
        for ((i=1; i<n; i++)); do
            if [[ ${arr[i-1]} -gt ${arr[i]} ]]; then
                # Swap elements
                tmp=${arr[i-1]}
                arr[i-1]=${arr[i]}
                arr[i]=$tmp
                swapped=true
            fi
        done
        ((n--))
    done

    echo "Sorted array:"
    echo "${arr[@]}"
}

# Example array
array=(64 34 25 12 22 11 90)

echo "Original array:"
echo "${array[@]}"

# Sort the array
bubble_sort "${array[@]}"
