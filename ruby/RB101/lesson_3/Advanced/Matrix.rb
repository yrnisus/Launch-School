def transpose(arr)
    arr.map.with_index do |_, index|
      arr.map {|row| row[index]}
    end
end

def transpose(arr)
  rows = arr.length
  columns = arr[0].length
  new_arr = Array.new(columns) { Array.new(rows) }
  # 0 - 1 - 2 - 3
  0.upto(rows-1) do  |x|
    0.upto(columns-1) do |y|
    new_arr[y][x] = arr[x][y]
    end
  end
  new_arr
end



p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]