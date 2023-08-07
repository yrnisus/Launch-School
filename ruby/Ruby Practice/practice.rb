# For example, the task is: You were given a natural number ‘number’.
# Return a string with all numbers from 1 to ‘number’ using recursion separating
# them by spaces.

# i: n
# o: a string with all numbers from 1 to n with a space separating them

# algo: write a method that takes a number n


def foo(num)
  exit if num > 10_000
  return num.to_s if num == 1

end

p foo(5)