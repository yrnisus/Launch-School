# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument. You may
# assume that the Array contains at least 2 elements.

# i: array
# o: return the same array bubble sorted

# mm: Take an array. At each value of the array iterate through the remainder of the
# array and check if the current value is greater than that of the next element. If
# so swap the elements. Continue until no swaps are made.

# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


# ds: arrays

# algo:
# Create a method bubble_sort
# Pass it an array of values
# Loop through the array
#   For the current element of the array check if the value is greater than that
#   of the next element
#   If it is swap them,
#   Else go to the next index and continue the comparison
# Return the array when no more swaps have been made.

def bubble_sort!(arr)
  loop do
    swapped = false
  1.upto(arr.length-1) do |x|
    next if arr[x-1] <= arr[x]
    arr[x], arr[x-1] = arr[x-1], arr[x]
    swapped = true
    end
    break unless swapped
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)




