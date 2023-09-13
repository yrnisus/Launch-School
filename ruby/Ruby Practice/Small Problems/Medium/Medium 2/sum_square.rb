=begin
Problem:
Find the sum of the first n positive integers and square it
Find the sum of the squares of the first n positive integers
Subtract sum of squares from square of sums

algo:
Receive an integer n as input
Create a range from 1 to n
Two variables: sum_squared and squared_sum
For each value in the range
  sum_squared += num
  squared_sum += num**2
After iteration complete sum_squared**2
return sum_squared - squared_sum
=end

def sum_square_difference(num)
  sum_squared, squared_sum = 0, 0
  (1..num).each do |value|
    sum_squared += value
    squared_sum += value ** 2
  end
  (sum_squared**2) - squared_sum
end



p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150