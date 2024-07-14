def insertion_sort(array)
  for i in 1...(array.length)
    key = array[i]
    j = i - 1
    
    # Move elements of array[0..i-1], that are greater than key,
    # to one position ahead of their current position
    while j >= 0 and array[j] > key
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = key
  end
  array
end

# Example usage
arr = [12, 11, 13, 5, 6]
sorted_array = insertion_sort(arr)
puts "Sorted array: #{sorted_array}"
