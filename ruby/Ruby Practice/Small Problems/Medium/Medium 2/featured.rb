=begin
Find the next featured number greater than the input num. If there arent any
return invalid.

input: int
output: integer or invalid

A featured number:
  Multiple of 7
  Odd number
  Each digit appears only once

algorithm:

Loop until featured number is found.
Add 7 to cur_num
Check if the num is a featured number
If true return the num, else continue
return error message if num is > 10 billion



=end

def featured(num)
  loop do
    num += 1
    break if num % 7 == 0
  end

  loop do
    return num if num.odd? && num.digits.size == num.digits.uniq.count
    num += 7
    break if num > 10_000_000_000
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


