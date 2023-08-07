arr = [
  [3, 4, 1],
  [9, 7, 5]
  ]


def rotate90(arr)
  columns = arr[0].size-1
  rows = arr.size - 1
  # columns.downto(0).map { |x| p x}
  0.upto(columns).map { |i| rows.downto(0).map { |j| arr[j][i]}}
end


p rotate90(arr)