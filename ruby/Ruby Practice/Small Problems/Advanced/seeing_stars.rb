=begin
Problem:
Draw a 8 sided star in an n by n grid
Rules: smallest size is n = 7
input: integer
output: text pattern of a star

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

n numbers of row of n width
each row other than middle consists of 3 stars and whitespace
outer most and middle row have stars on the first and last column
Need n -1 / 2 rows (upperhalf - middle - lowerhalf)
upper and lower half are mirrr copies

ds: strings

algorithm:
Problem: Generate the rows
Find the number of rows num_rows (n-1/2)
Create an array of size num_rows
initialize whitespace variable at 0



**ROW**
Each row has 3 stars and whitespace
Number of white space increases by 2 per row from the center


Problem: Output the rows (array)
for each element of array output to screen
For each element in the arrow except the middle row output in reverse


=end

# input number of rows
# array of rows
def create_stars_array(n)
  return "Error" if n < 7 || n.even?

  star = "*"
  arr = [star * n]
  rows = (n - 1) / 2
  padding = (n - 3) / 2
  whitespace = 0

  rows.times do |_|
    str = "#{' ' * padding}#{star}#{' ' * whitespace}#{star}#{' ' * whitespace}#{star}#{' ' * padding}"
    arr.unshift(str)
    arr << str
    padding -= 1
    whitespace += 1
  end
  arr
end

def print_star(arr)
  arr.each { |ele| puts ele }
end

def star(n)
  print_star(create_stars_array(n))
end


star(15)