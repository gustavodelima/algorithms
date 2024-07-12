#!/bin/bash

# Function to perform a linear search
linear_search() {
    local -n arr=$1
    local target=$2
    for (( i=0; i<${#arr[@]}; i++ )); do
        if [[ ${arr[$i]} -eq $target ]]; then
            echo "Element found at index $i"
            return 0
        fi
    done
    echo "Element not found"
    return 1
}

# Example array
numbers=(10 20 30 40 50 60 70 80 90 100)

# Element to search for
search_element=40

# Call the function
linear_search numbers $search_element
