=begin
Problem
For a given input string return a hash with three key value pairs. Each pair is
ratiio of letter case present in the string. String will always be atleast one
char.

input: string
output: hash with 3 pairs (lowercase: ratio, uppercase: ratio, neither: ratio)

Examples

Data Structure
Hash

Algorithm
Input string
Initialize a hash to store key value pairs
Iterate through the string determine the case at each char
Increment appropriate case
After completion change the value of each pair to the ratio of the final count
compared to the length of the overall string

=end

def calc_percentage(hash, size)
  hash.each do |key, value|
    hash[key] = (value / size * 100).round(1)
  end
end

def letter_percentages(str)
  case_hash = { "lowercase": 0.0, "uppercase": 0.0, "neither": 0.0}

  str.chars.each do |char|
    if char.match(/[A-Z]/)
      (case_hash[:uppercase] += 1)
    elsif char.match(/[a-z]/)
      case_hash[:lowercase] += 1
    else
      case_hash[:neither] += 1
    end
  end


  calc_percentage(case_hash, str.length)
end

p letter_percentages('abcdefGHI')

