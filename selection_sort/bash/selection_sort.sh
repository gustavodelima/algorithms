#!/bin/bash

# Function to perform selection sort
selection_sort() {
    arr=("$@")
    len=${#arr[@]}

    for ((i = 0; i < len; i++)); do
        # Find the minimum element in the unsorted portion of the array
        min_index=$i
        for ((j = i + 1; j < len; j++)); do
            if ((arr[j] < arr[min_index])); then
                min_index=$j
            fi
        done

        # Swap the found minimum element with the first element
        temp=${arr[i]}
        arr[i]=${arr[min_index]}
        arr[min_index]=$temp
    done

    echo "Sorted array:"
    echo "${arr[@]}"
}

# Read array from command line
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide a list of integers."
    exit 1
fi

# Call the function with command line arguments
selection_sort "$@"
