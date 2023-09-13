=begin
For a given array, split it in half into two nested arrays [] => [[][]]
Rules:
If array is of odd size put the middle element into the first array
Return an empty array if there isn't an element for either the array of nested array

input: array
output: array of nested arrays

data structure; array

algorithm:
Get an array as input
Create an empty array result to contain the nested arrays
Divide the size of input array by 2. Round the result up.
  This gives you the correct number of elements for even or odd
Create an empty array and add first n elements to it
Add these to result array
Add remaining elements to an emty array
Add to result array
Return result array

=end

def halvsies(arr)
  counter = (arr.size / 2.0).ceil
  [arr[0...counter], arr[counter..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) #== [[], []]