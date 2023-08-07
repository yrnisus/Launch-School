# Write two methods: one that takes a Rational number as an argument, and
# returns an Array of the denominators that are part of an Egyptian Fraction
# representation of the number, and another that takes an Array of numbers in
# the same format, and calculates the resulting Rational number. You will need
# to use the Rational class provided by Ruby.

# method one:
# i: rational number
# o: array of the denominators that are part of an egyptian fraction

# method two:
# i: array of the denominators that are part of an egyptian fraction
# o: rational number

# mm: Convert a rational number to an egyptian fraction. Then write a method that
# converts the egyptian fraction back to a rational number.

# ex: egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# ds: array

# algo:
# A Rational Number is any number that can be represented as the result
# of the division between two integers, e.g., 1/3, 3/2, 22/7, etc.

# create a method egyptian that accepts a ruby Rational object
# loop while numerator is not 1
# i == 1
# num - 1/i
# i++
# push the current value of i to a result array
# turn the array


require 'pry'

# def egyptian(num)
#   arr = []
#   i = (num >= 1 ? 1 : 2)
#   loop do
#     num = num - Rational(1, i)
#     arr << i
#     i+=1;
#     if (num * num.denominator).abs.to_i == 1 && num.denominator != 1
#       next if arr.include?(num.denominator)
#       arr << num.denominator
#       break
#     end
#   end
#   arr
# end

def egyptian(num)
  arr = []
  i = 1
  loop do
    if num - Rational(1, i) >= 0
      arr << i
      num -= Rational(1, i)
    end
    break if num.zero?
     i += 1
  end
  arr
end

def unegyptian(arr)
  (arr.map{ |x| Rational(1,x)}).inject(:+)
end

egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

