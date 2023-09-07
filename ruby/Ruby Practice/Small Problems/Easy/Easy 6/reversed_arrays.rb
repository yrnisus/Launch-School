=begin
Reverse the order of elements in an array object in place
Rules: Cannot use reverse
Input: array
output: array (same object)

algorithm:
Take an array of elements as input
Create duplicate of the input array
Iterate through it backwards
Replace each element in input array with the element in duplicate array
Return array object

=end


def reverse!(arr)
  reverse_index = copy.size
  arr.map! do |ele|
    reverse_index -= 1
    arr[reverse_index]
  end
end

def reverse!(arr)
  reverse_index = copy.size
  arr.map do |ele|
    reverse_index -= 1
    arr[reverse_index]
  end
end


def reverse!(arr)
  right, left = -1, 0

  while left < arr.size / 2
    arr[left], arr[right] = arr[right], arr[left]
    left+=1
    right-=1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true