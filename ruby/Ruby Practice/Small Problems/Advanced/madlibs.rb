WORDS = {
  "[noun]" => %w(unicorn wizard dragon forest knight),
  "[verb]" => %w(dance sing explore paint laugh),
  "[verb_ing]" => %w(dancing singing exploring painting laughing),
  "[plural_noun]" => %w(rainbows butterflies secrets treasures dreams),
  "[adjective]" => %w(sparkling enchanting mysterious playful breathtaking),
  "[day_of_week]" => %w(Monday Friday Wednesday Saturday Sunday),
  "[adverb]" => %w(joyfully carefully silently swiftly playfully),
  "[animal]" => %w(owl fox rabbit squirrel dolphin)
}

  # text.match(/\[(.*?)\]/).to_s

def generate_madlib(file)
  file_data = File.read(file)
  file_data.gsub(/\[\w*\]/) do |match|
      WORDS[match].sample
  end

end

def get_word
  result = []
  WORDS.each do |key, value|
    value[rand(value.size)]
  end
end


puts generate_madlib('madlibs_text.txt')

