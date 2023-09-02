# Ruby program to print all combinations of balanced parentheses

# Function that prints all combinations of balanced parentheses
# open_count stores the count of opening parentheses
# close_count stores the count of closing parentheses
def print_parenthesis(str, pos, n, open_count, close_count)
  if close_count == n
      # Print the possible combinations
      puts str.join('')
      return
  else
      if open_count > close_count
          str[pos] = '}'
          print_parenthesis(str, pos + 1, n, open_count, close_count + 1)
      end
      if open_count < n
          str[pos] = '{'
          print_parenthesis(str, pos + 1, n, open_count + 1, close_count)
      end
  end
end

# Wrapper over print_parenthesis()
def generate_parenthesis(n)
  if n > 0
      str = Array.new(2 * n)
      p str
      print_parenthesis(str, 0, n, 0, 0)
  end
end

# Driver program
n = 3
generate_parenthesis(n)
