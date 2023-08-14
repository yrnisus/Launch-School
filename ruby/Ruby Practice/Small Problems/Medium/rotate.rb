
def rotate(num)
  num[1..-1] + [num[0]]
end

def rotate_rightmost_digits(num, digit)
  arr = num.digits.reverse
  num = arr[-digit]
  arr.sort_by { |x| x == num ? 1 : 0 }.join.to_i
end

def max_rotation(num)
  digits = num.to_s.size
  digits.downto(2) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

=begin
algo:
-convert the number to an array in the same order
-Until you've reached the maximum rotation loop rotations
  -First loop rotate first digit to the end
  -Second rotate the 2nd digit to the end

=end



p max_rotation(735291) #== 321579
# p max_rotation(3) #== 3
# p max_rotation(35) #== 53
# p max_rotation(105) #== 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) #== 7_321_609_845