=begin
Problem: Return the duplicate value from an array of unique numbers
Rules: Only one value is duplicated, the rest are unique

input: array
output: int

ds: hash? waste of memory
array: sliding window of prev elements

algorithm:
Hash version
Create an empty hash
Iterate through input array
For each element if it doesn't exist in hash add as a key
If it already exists thats your duplicate, return num

Array: Sliding window
one index pointer, start at 1
For each element in array
Check if the array from the beginning to index contains the current value
If it does return the number
else next

=end


# def find_dup(arr)
#   index = 1
#   loop do
#     return arr[index] if arr[0..index-1].include?(arr[index])
#     index+=1
#     break if index >= arr.size
#   end
# end

# def find_dup(arr)
#   hash = {}
#   arr.each do |num|
#     return num if hash.key?(num)
#     hash[num] = true
#   end
# end

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73