def count_vowel_substrings(str)
  vowels = ['a', 'e', 'i', 'o', 'u']
  substrings = []
  inner_counter = 0
  string_arr = str.chars

  string_arr.each.with_index do |char, index|
    inner_counter = index + 1
    if !vowels.include?(char)
      next
    else
      # vowel
      loop do
        break if inner_counter >= string_arr.size
        if !vowels.include?(string_arr[inner_counter])
          break
        else
          substrings << string_arr[index..inner_counter].join if vowel_substring?(string_arr[index..inner_counter], vowels)
          inner_counter += 1
        end
      end
    end
  end
  substrings.size
end

def vowel_substring?(str, vowels)
  vowels.all? { |vowel| str.include?(vowel) }
end

# Test case
puts count_vowel_substrings("cuaieuouac") # Output: 7
