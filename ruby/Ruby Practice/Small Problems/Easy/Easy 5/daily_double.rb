=begin
Problem: Squeeze a string without using the #squeeze method. Remove concurrent duplicate letters
Rule: Can't use #squeeze
Return the string if no duplicates, return empty string if empty
Input: string
output: string

data structure: string

Algo:
Take a string as input
Create a two pointers, left and right

Left will indicate the last unique index
Right will check each letter for duplicates
If right is not equal to left then it is a unique letter
increment left by 1
assign element at right to index left
If right == left then we have a duplicate
increment right by 1

ddaaiillyy ddoouubbllee'
left d right d right + 1
left d right d right + 1
left d right a


Return a substring of 0 to left

For each char in the string

=end

def crunch(str)
  return str if str.size < 2

  left, right = 0, 0
  loop do
    if str[left] != str[right]
      left += 1
      str[left] = str[right]
    end

    right += 1
    break if right == str.size
  end
  str[0..left]
end

def crunch(str)
  str.chars.chunk { |char| char}.map(&:first).join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

