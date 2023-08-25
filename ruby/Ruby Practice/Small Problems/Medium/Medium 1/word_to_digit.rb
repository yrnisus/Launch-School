=begin
Problem
Take a string containing numbers as the word
Replace the words that are numbers with their number value instead

Example
"This is five dollars" => "This is 5 dollars"
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Data Structure
Array

Algorithm
Change the input string into an array
Iterate through the input array
Check if each index of the array is an integer
If not continue to the next index
If it is an integer
replace the value of that index with the corresponding number


is_integer?(str)
Remove any punctuation from the str and store it to be readded
Check if the string is an integer


Code
=end

WORDS_HASH = {
  'one'=> '1', 'two'=> '2', 'three'=> '3',
  'four'=> '4', 'five'=> '5', 'six'=> '6',
  'seven'=> '7', 'eight'=> '8', 'nine'=> '9',
  'zero'=> '0'
  }

def word_to_digit(str)
  input_arr = str.split

  new_str = input_arr.map do |index|
    word = index.match(/\w*/).to_s
    if WORDS_HASH.key?(word)
      word = WORDS_HASH[word]
      p word
    end
    index.sub(/\w*/, word)
  end.join(' ')
  p new_str
end


p word_to_digit('Please call me at five five five one two three four. Thanks.')

sentence = "Please call me at 5 5 5 1 2 3 4. Thanks."
sentence2 = sentence.gsub(/(\d)\s(?=\d)/, '\1')
p sentence2