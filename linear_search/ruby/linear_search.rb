def linear_search(array, target)
    array.each_with_index do |item, index|
      return index if item == target
    end
    nil # Return nil if the target is not found in the array
  end
  
  # Example usage
  array = [5, 3, 8, 2, 9, 1]
  target = 9
  
  result = linear_search(array, target)
  if result
    puts "Element found at index: #{result}"
  else
    puts "Element not found in the array."
  end  