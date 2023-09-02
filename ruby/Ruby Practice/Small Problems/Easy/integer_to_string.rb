# base 16
# hex_hash = {
# }

NUMBERS = ('0'..'9').zip(0..9).to_h
LETTERS = ('a'..'f').zip(10..15).to_h
HEXADECIMALS = NUMBERS.merge(LETTERS)

p HEXADECIMALS

def string_to_integer(str)
  num_hash = ('0'..'9').zip(0..9).to_h
  value = str.chars.reduce(0) do |sum, char|
    10 * sum + num_hash[char]
  end
end

def string_to_signed_integer(string)
  integer = string_to_integer(remove_sign(string))
  string[0] == '-' ? -integer : integer
end

def remove_sign(string)
  ['+', '-'].include?(string[0]) ? string[1..] : string
end


# def hexadecimal_to_integer(str)
#   str.downcase.chars.inject(0) do |value, char|
#     value = 16 * value + HEXADECIMALS[char]
#   end
# end

p string_to_signed_integer("+565")
p string_to_signed_integer("-565")
# p hexadecimal_to_integer('4D9f') #== 19871
