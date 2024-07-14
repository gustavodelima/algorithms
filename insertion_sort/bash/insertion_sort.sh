#!/bin/bash

# Function to perform insertion sort
insertion_sort() {
    local array=("$@")
    local n=${#array[@]}

    for ((i = 1; i < n; i++)); do
        key=${array[i]}
        j=$((i - 1))

        # Move elements of array[0..i-1], that are greater than key,
        # to one position ahead of their current position
        while ((j >= 0 && array[j] > key)); do
            array[j + 1]=${array[j]}
            j=$((j - 1))
        done
        array[j + 1]=$key
    done

    echo "${array[@]}"
}

# Example usage
numbers=(34 8 64 51 32 21)

echo "Original array: ${numbers[@]}"
sorted_numbers=($(insertion_sort "${numbers[@]}"))
echo "Sorted array: ${sorted_numbers[@]}"
