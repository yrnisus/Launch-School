def fibonacci(n)
  return 1 if n == 1
  return 0 if n <= 0
  fibonacci(n-1) + fibonacci(n-2)
end


p fibonacci(40)