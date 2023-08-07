require 'pry'

def rotate_array(arr)
  [arr[1..-1], arr[0]].flatten
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_ints(num)
  rotate_array(num.digits).join
end

# input: integer
def rotate_rightmost_digits(num, digits_selected)
  arr = num.digits.reverse
  split_arr = arr.partition.with_index { |_, i| i < arr.size-digits_selected }
  [split_arr.first, rotate_array(split_arr.last)].join.to_i
end

# i: multi-digit int
# o: maximum rotation of the input int
# maximum rotation is defined as
# 735291 => 352917 (rotation one)
# 352917 => 329175 (lock the first digit, 5 to end rotation 2)
# 329175 => 321759 (lock first 2 digit, 9 to end, rotation 3)
# 321759 => 321597 (lock first 3 digit, 7 to end, rotation 4)
# 321597 => 321579 (lock first 4 digits, 9 to end, rotation 5) (maximum rotation)

# rotate the entire int, then every iteration rotate one less digit, number of
# rotations will be 1 less than the length of the int, rotating last digit by itself
# does nothing




def max_rotation(num)
  counter = num.digits.size
  while counter > 1 do
    num = rotate_rightmost_digits(num, counter)
    counter-=1
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845


# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_string('hello world')
# p rotate_ints(12345)

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917