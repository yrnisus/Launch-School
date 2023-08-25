def longest_sentence(file)
  hash = {}
  line_counter = 0
  file_data = File.read(file).split((/\.|\?|!/))
  file_data.each do |line|
    hash[line_counter] = line.split.count
    line_counter += 1
  end
  hash.values.max
end

p longest_sentence('text.txt')