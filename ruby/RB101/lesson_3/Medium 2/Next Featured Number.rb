# Write a method that takes a single integer as an argument, and returns
# the next featured number that is greater than the argument. Return an error
# message if there is no next featured number.

# i: integer
# o: next featured integer greater than input

# A featured number (something unique to this exercise) is an odd number
# that is a multiple of 7, and whose digits occur exactly once each.
# So, for example, 49 is a featured number, but 98 is not (it is not odd),
# 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# mm:
# Take a number. Starting from that number increment by 1 and check if the value
# is a featured number. A featured number is divisible by 7 and does not have repeating
# digits.

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# ds: integer

# algo:
# Create a method featured and pass it an integer object as an argument
# Loop
# Increment the argument by one and check if it is a featured number
#   Is featured if divisible by 7 and does not have any repeating digits.
# Continue to loop until featured is true then return that number
# return an error message if there no next featured number

def featured(num)
  loop do
    num += 1
    return num if num.odd? && num % 7 == 0 && num.digits.size == num.digits.uniq.size
    break if num.digits.length >= 11
  end
   "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

