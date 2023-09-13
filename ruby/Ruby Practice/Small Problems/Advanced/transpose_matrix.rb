def transpose(arr)
  res = []
  n = arr.size
  num_columns = arr[0].size

  num_columns.times do |column|
    temp = []
    n.times do |row|
      temp << arr[row][column]
    end
    res << temp
  end
  res
end

# def transpose(arr)
#   res = []
#   n = arr.size
#   arr.map.with_index do |_, column|
#     arr.map.with_index do |_, row|
#       arr[row][column]
#     end
#   end
# end

# def transpose(arr)
#   res = []
#   (0...arr.size).each do |column|
#     temp = (0...arr.size).map do |row|
#       arr[row][column]
#     end
#     res << temp
#   end
#   res
# end

# def transpose!(arr)
#   copy = arr.map(&:clone)
#   p arr[0].object_id
#   p copy[0].object_id

#   (0...arr.size).each do |column|
#     arr.size.times do |row|
#       arr[column][row] = copy[row][column]
#     end
#   end
#   arr
# end




p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]