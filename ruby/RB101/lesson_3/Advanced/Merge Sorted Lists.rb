# Write a method that takes two sorted Arrays as arguments, and returns a
# new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array.
# You must build the result array one element at a time in the proper order.
# Your solution should not mutate the input arrays.

# i: two sorted arrays
# o: one singular sorted array containing all of the elements of both args

# mm: Take two arrays. Iterate through both arrays comparing them element by element.
# The lower element gets pushed to the result array.

# ds: array

# algo:
# create a method merge that takes two sorted array objects as arguments
# create and initiate two variables that store the length of each array
#   this allows for arguments of different lengths
# loop
#   compare the value of each array.
#   push the lower value to the result array
#   iterate the index counter for that array
#   repeat until one index pushes its final element
#   push the remaining elements in the other array to the result array
#   return the result array

def merge(arr1, arr2)
  index2 = 0
  result = []

  arr1.each do |x|
    while index2 < arr2.size && arr2[index2] <= x
      result << arr2[index2]
      index2+=1
    end
  result << x
  end
  p index2
  result.concat(arr2[index2..-1])
end


# def merge(array1, array2)
#   index2 = 0
#   result = []

#   array1.each do |value|
#     while index2 < array2.size && array2[index2] <= value
#       result << array2[index2]
#       index2 += 1
#     end
#     result << value
#   end

#   result.concat(array2[index2..-1])
# end

p merge([1, 5, 9], [2, 6, 8])
# p merge([1, 1, 3], [2, 2])
# p merge([], [1, 4, 5])
# p merge([1, 4, 5], [])