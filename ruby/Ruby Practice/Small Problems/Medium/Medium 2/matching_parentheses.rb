=begin
Problem: Given a string ensure all of the parentheses in the string are properly
balanced. IE The number of right paren exceeds the number of currently open paren

input: string
output: true false

exampples:

data structure: integer

algo:
Take an input string
Iterate through said string checking the value of each char
Two counters, left and right, to keep track of the number of open parentheses
If the value of right exceeds left return false
If left and right are not equal when iteration complete return false
otherwise return true

=end


def balanced?(str)
  pairs = %w([] {} "" '').each { |pair| [pair] }
  pairs.all? do |pair|
    left, right = 0, 0
    str.chars.each do |char|
      return false if right > left

      if char == pair[0]
        left += 1
      elsif char == pair[1]
        right += 1
      end
    end
    left == right
  end
end

p balanced?('What [is"] this?') #== true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
# p balanced?('What ())(is() up') == false