def bubble_sort(array)
    n = array.length
    loop do
      swapped = false
      (n-1).times do |i|
        if array[i] > array[i+1]
          array[i], array[i+1] = array[i+1], array[i]
          swapped = true
        end
      end
      break unless swapped
    end
    array
  end
  
  # Example usage
  numbers = [4, 2, 5, 3, 1]
  sorted_numbers = bubble_sort(numbers)
  puts sorted_numbers
  