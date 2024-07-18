def selection_sort(arr)
  n = arr.length
  # One by one move boundary of unsorted subarray
  for i in 0...n-1
    # Find the minimum element in the unsorted array
    min_index = i
    for j in (i+1)...n
      if arr[j] < arr[min_index]
        min_index = j
      end
    end
    # Swap the found minimum element with the first element
    arr[i], arr[min_index] = arr[min_index], arr[i]
  end
  arr
end

# Example usage:
array = [64, 25, 12, 22, 11]
sorted_array = selection_sort(array)
puts "Sorted array: #{sorted_array}"
