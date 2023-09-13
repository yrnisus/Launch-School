def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge(arr1, arr2)
  index1, index2 = 0, 0
  res = []

  if arr1.empty?
    return arr2
  elsif arr2.empty?
    return arr1
  end

  while index1 < arr1.size && index2 < arr2.size
    if arr1[index1] <= arr2[index2] 
      res << arr1[index1]
      index1+=1
    else
      res << arr2[index2]
      index2+=1
    end

    if index1 == arr1.size
      res.concat([index2..-1])
    elsif index2 == arr2.size
      res.concat(arr1[index1..-1])
    end
  end

  res
end



p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]