def insertion_sort(arr):
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    return arr

# Example usage:
example_array = [22, 27, 16, 2, 18, 6]
sorted_array = insertion_sort(example_array)
print("Sorted array:", sorted_array)
