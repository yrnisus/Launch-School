=begin
Problem: Determine if you can spell a word using only one instance of the letter
pairs provided.

input: string
output: boolean true false

Examples: block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

Data Structure:
array. remove the index when the letter is used

algorithm:
Create a collection of the letter pairs
Iterate through the input string
At each char in the string determine if the letter is available in the collection
If yes remove the pair from the collection
  go to next letter of the string
If false
  return false

=end


def block_word?(str)
  pairs = [["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"], ["G", "T"],
  ["R", "E"], ["F", "S"], ["J", "W"], ["H", "U"], ["V", "I"], ["L", "Y"],
  ["Z", "M"]]
  used_pairs = []

  str.chars.each do |char|
    pairs.each do |pair|
      if pair.first == char.upcase || pair.last == char.upcase
        if used_pairs.include?(pair)
          return false
        else
          used_pairs << pair
          next
        end
      end
    end
  end
  true
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true