# def fibonacci(n)
#   return 1 if n <= 2
#   num1, num2 = 1, 1
#   new_num = 0
#   (n-2).times do |_|
#     new_num = num1 + num2
#     num1 = num2
#     num2 = new_num
#   end
#   new_num
# end

def fibonacci_last(n)
  first, last = 1, 1
  3.upto(n) do
    first, last = [last % 10, (first + last) % 10]
  end
  last
end


p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4