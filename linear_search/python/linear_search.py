def linear_search(arr, target):
    """
    This function performs a linear search on an array.
    
    Parameters:
    arr (list): The list of elements to search through.
    target (any): The target value to search for.

    Returns:
    int: The index of the target if found, otherwise -1.
    """
    for i in range(len(arr)):
        if arr[i] == target:
            return i
    return -1

# Example usage:
elements = [5, 3, 7, 1, 9, 8]
target_value = 7

# Perform the search
index = linear_search(elements, target_value)

# Output the result
if index != -1:
    print(f"Target found at index {index}")
else:
    print("Target not found")
