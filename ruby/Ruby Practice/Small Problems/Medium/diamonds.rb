=begin
Problem
Write a program that draws a diamond in an n x n grid.
The diamond must be 4 sided.
n will always be an odd integer.

Examples

1 = *

3 =   *
     ***
      *

5 =   *
     ***
    *****
     ***
      *

Data Structure
Array?

Algorithm

Loop
Starting with 1 draw a line of stars equal to the the next odd integer
Continue until the number of stars is equal to n
Exit loop

Draw lines of stars starting with next smallest


Create an collection of odd integer values up to before n.



Code


=end


# # new solution
# def diamond(n)
#   counter = 1
#   increase = true
#     loop do
#       break if counter <= 0 && !increase
#       offset = " " * ((n - counter) / 2)
#       puts "#{offset}#{"*" * counter}#{offset}"
#       if increase
#         counter+=2
#       else
#         counter-=2
#       end
#       increase = !increase if counter == n
#     end
# end

# # original solution
def create_diamond(n)
  arr = []                # Initialize an empty array to hold the diamond pattern lines.
  num_chars = n           # Initialize the number of characters in the middle row of the diamond.

  arr << "*" * num_chars  # Add the first line of the diamond pattern (all asterisks) to the array.

  loop do
    num_chars -= 2        # Decrement the number of characters by 2 for the upper and lower rows.
    arr.unshift("*" * num_chars)  # Prepend a line of asterisks to the array for the upper part.
    arr.push("*" * num_chars)     # Append a line of asterisks to the array for the lower part.
    break if num_chars == 1       # Break the loop when the number of characters reaches 1.
  end

  arr                      # Return the array containing the diamond pattern lines.
end

def display_diamond(arr, n)
  arr.each { |x| puts x.center(n) }  # Center-align and print each line of the diamond pattern.
end

def diamond(n)
  display_diamond(create_diamond(n), n)  # Call the functions to create and display the diamond.
end

# instructor
# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) do |distance|
#     p distance
#     print_row(grid_size, distance)
#   end
#   # 1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end



diamond(5)
# diamond(9)