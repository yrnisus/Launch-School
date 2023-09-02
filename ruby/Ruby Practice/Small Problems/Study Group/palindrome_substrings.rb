# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []


=begin
input: string
output: array of substrings
rules:
      Explicit reqs:
      - palindromes are case sensitive

      -implicit reqs:
      - substrings must be unique but can share letters "bcddcb" "cddc" "dd"
      - Return an empty array of no palindromes found
      - Return an empty array if empty string

=end


def palindrome_substrings(str)
  result = []
  substring_arr = substrings(str)
  substring_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result.empty? ? [] : result
end

# def substrings(str)
#   substrings = []
#   (0...str.size).each do |letter_index|
#     (letter_index...str.size).each do |counter|
#       substrings << str[letter_index..counter] if counter - letter_index >= 1
#     end
#   end
#   substrings
# end

def substrings(str)
  result = []
  (0..str.size-2).each do |starting_index|
    (2..str.size - starting_index).each do |num_chars|
      result << str[starting_index, num_chars]
    end
  end
  result
end


def is_palindrome?(substring)
  substring == substring.reverse
end



=begin
  substrings method algorithm
  input: string
  output: array of substrings in given string
    requirements: must atleast length of 2

    - Initialze an empty array substrings
    - Need two indexes
        one for the outer loop to select letter
        one for inner loop to control length of substring

    - Outer index: Create a range from 0 to size of string - 1
        For each value in range
        initialize a counter equal to 1
      - push substring to substring array from outer index to counter
        Increment counter by 1
=end




p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []