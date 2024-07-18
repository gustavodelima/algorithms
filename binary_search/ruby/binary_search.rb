def binary_search(array, target)
  low = 0
  high = array.length - 1
  
  while low <= high
    mid = (low + high) / 2
    guess = array[mid]
    
    if guess == target
      return mid  # Target found, return index
    elsif guess > target
      high = mid - 1  # Search in the left half
    else
      low = mid + 1  # Search in the right half
    end
  end
  
  return nil  # Target not found
end

# Example usage:
sorted_array = [1, 3, 5, 7, 9, 11, 13, 15]
target = 9

result = binary_search(sorted_array, target)
if result
  puts "Target found at index: #{result}"
else
  puts "Target not found in the array."
end
