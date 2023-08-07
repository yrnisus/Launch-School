def merge_sort(arr)
  return arr if arr.size == 1
  mid = arr.length / 2
  p arr1 = arr[0...mid]
  p arr2 = arr[mid..-1]

  merge(merge_sort(arr1), merge_sort(arr2))
end



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
  result.concat(arr2[index2..-1])
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# conclusion:
# Take an array of elements
# Recursively split them into two seperate arrays until the length of each array
# is one then return that array
# merge the two resulting arrays