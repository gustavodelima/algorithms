#!/bin/bash

# Function to perform binary search
# Arguments are: sorted array, target value
binary_search() {
    local arr=("$@")             # The array is all arguments except the last
    local target=${arr[-1]}      # The target is the last argument
    unset arr[-1]                # Remove the last element from the array
    local low=0
    local high=$((${#arr[@]} - 1))

    while [ $low -le $high ]; do
        local mid=$(((low + high) / 2))
        if [ "${arr[$mid]}" -eq "$target" ]; then
            echo "Target '$target' found at index: $mid"
            return 0
        elif [ "${arr[$mid]}" -lt "$target" ]; then
            low=$((mid + 1))
        else
            high=$((mid - 1))
        fi
    done

    echo "Target '$target' not found in the array."
    return 1
}

# Example usage
sorted_array=(1 2 3 4 5 6 7 8 9 10)
binary_search "${sorted_array[@]}" 7
