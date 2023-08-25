=begin
Problem
Write a program to mimic a stack and register language.
n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value

Definitions
  Stack: An array of values that works on a first in first out basis.
  Register: current value (not a part of the stack)

Examples
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

Data Structure
Array

Input: string
Output: The result of whatever commands are input

Algorithm
Initialize an array to contain the stack.
Initialize the register to 0.
Split the input string into an array
Iterate through the array performing the action at each index



Code
=end

def minilang(str)
  input_arr = str.split
  stack_arr = []
  register = 0

  input_arr.each do |input|
    if is_integer?(input)
      register = input.to_i
    else
      case input.upcase
      when "PUSH" then stack_arr << register
      when "ADD" then register += stack_arr.pop
      when "SUB" then register -= stack_arr.pop
      when "MULT" then register *= stack_arr.pop
      when "DIV" then register /= stack_arr.pop
      when "MOD" then register = register % stack_arr.pop
      when "POP" then register = stack_arr.pop
      when "PRINT" then puts register
      end
    end
  end
end

def is_integer?(value)
  value.to_i.to_s == value
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)