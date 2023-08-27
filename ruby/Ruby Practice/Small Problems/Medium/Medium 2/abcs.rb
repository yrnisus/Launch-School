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
  pairs = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

  pairs.none? do |pair|
    p pair.count(str.upcase)
  end
end

#   BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? do |block|
#     p block
#     p up_string.count(block)
#     up_string.count(block) >= 2
#   end
# end


p block_word?('BATCHO')
# p block_word?('BUTCH') == false
# p block_word?('jest') == true