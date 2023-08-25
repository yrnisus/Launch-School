=begin
Problem:
A range of switches from 1 to n. Each switch begins in the off position.
-First pass: Turn toggle every switch
-Subsequent passes:
  Starting switch moves to the right by one each loop
  Toggle the switches that are MULTIPLES OF THE CURRENT INDEX
Return the switches that are turned on

Examples

(5) = [1,4]
(10) = [1,4,9]

Data Structure
Array of objects

input: integer number n
output: array of indexes of "on" switches

Algorithm
Create a collection of switches from 1 to input n
Loop through the collection n times
Toggle all switches that are a multiple of the current index
Select all of the switches that are toggled on
Return the collection of on switches

Code
=end

def lights(n)
  hsh = {}
  (1..n).each do |index|
    hsh[index] = false
  end

  (1..n).each do |index|
    hsh.keys.each do |key|
       hsh[key] = !hsh[key] if key % index == 0
    end
  end
  hsh.select { |k,v| v == true }.keys
end

def new_lights(n)
  result = []
  1.upto(n) do |i|
    result << i if perfect_square?(i)
  end
  result
end

def perfect_square?(number)
  sqrt = Math.sqrt(number)
  sqrt.to_i == sqrt
end



p new_lights(4)