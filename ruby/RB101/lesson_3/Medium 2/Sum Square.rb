# Write a method that computes the difference between the square
# of the sum of the first n positive integers and the sum of the squares of
# the first n positive integers.

# i: integer
# o: difference between sum squared and square sum

# mm: Get an integer. Sum all of the numbers from 1 to n then square. Then
# square each number then sum and subtract.

# ds: int, array

# algo: create a method sum_square_difference
# pass it a number n
# create a range of all from 1 to n
# Sum range and square it.
# Square each number in the range, then sum
# subtract first number from the second and return the difference.


def sum_square_difference(n)
  arr = (1..n).to_a
  arr.sum ** 2 - arr.map { |x| x ** 2}.sum
end


p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150