# LETTERS = ("a".."z").to_a + (("A".."Z").to_a)

# def word_sizes(str)
#   hsh = {}
#   str.split.each do |word|
#     hsh[word.size] = hsh[word.size].to_i + 1
#   end
#   hsh
# end

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hash|
    letter_count = word.scan(/[A-Za-z]/).count
    hash[letter_count] += 1
  end
end

def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) do |word, hash|
    letter_count = (word.delete('^A-Za-z')).size
    hash[letter_count] += 1
  end
end



p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}