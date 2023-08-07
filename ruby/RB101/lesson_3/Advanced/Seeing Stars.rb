# Write a method that displays an 8-pointed star in an nxn grid, where n
# is an odd integer that is supplied as an argument to the method. The smallest
# such star you need to handle is a 7x7 grid.

# i: odd integer n
# o: 8 pointed star in n x n grid

# mm: what the fuck is an 8 sided star

# star(7)

# *  *  *
# * * *
#   ***
# *******
#   ***
# * * *
# *  *  *

# ds: strings

# algo:
# n is the size of the grid, n x n
# n is the height and width of the grid
# Starting with the middle row of the star should be n stars
# Each row from the center is 3 stars with a number of spaces between them
#   first row 0 spaces, 2nd row 1 space, etc etc

# create a method star that takes an odd integer n
# create a string object middle row with a number of stars and size equal to n

def star(n)
  mid = (n / 2) + 1
  arr = ["*" * n]
  1.upto(mid-1) do  |line|
    target = [mid-line, mid, mid+line]
    str = ""
    1.upto(n) do |x|
      str << (target.include?(x) ? "*" : " ")
    end
    arr << str
    arr.unshift(str)
  end
  arr
end

puts star(21)