# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

=begin

Problem
Get the longest alphabetical substring from the input substring. If lengths are
equal return the first one.

input: string
output: string

Example
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'

Data Structure
Array

Algo
1 Receive an input string
"abctde"

1.5 Variables
  substring ength counter
  left index pointer
  right index pointer
  substring

2 Iterate through the characters of the string

3 On first character, skip to the next
  a => next
  length counter + 1

4 Check if the current character is greater or equal to the previous string
  b >= a ?

  4.T True branch
    length counter + 1
    right index pointer + 1
    go to next character

  4.F false branch
    check if current substring size is greater than prev best
      if yes replace substring with substring[left..right]
      set left to right

  5 return substring
=end

require 'byebug'

# byebug

def longest(str)
  longest_substring = ""
  cur_substring = ""
  prev_char = str[0]
  str.chars.each.with_index do |char, index|

    if char >= prev_char
      cur_substring << char
    else
      cur_substring = char
    end

    if cur_substring.size > longest_substring.size
      longest_substring = cur_substring
    end
    prev_char = char
  end
  longest_substring
end



p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

