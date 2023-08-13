LINE_LENGTH = 78
OFFSET = 2

def print_in_box(str)
  word_arr = []

  if str.size > LINE_LENGTH
    word_arr = format_word_wrap(str.chars)
  else
    word_arr << str
  end

  inner_width = [str.size + OFFSET, LINE_LENGTH].min
  border = "+#{"-"*inner_width}+"
  empty_line = "|#{" "*inner_width}|"

  p border
  p empty_line
  word_arr.each do |line|
    p "| #{line} |"
  end
  p empty_line
  p border
end

def format_word_wrap(str)
  word_wrap_arr = []
  loop do
    word_wrap_arr << str.slice!(0, LINE_LENGTH-OFFSET).join
    if str.size < LINE_LENGTH
      white_space = LINE_LENGTH - str.size - OFFSET
      word_wrap_arr << str.join.concat(" " * white_space)
      break
    end
  end
  word_wrap_arr
end

lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
print_in_box(lorem)
puts ""
print_in_box('To boldly go where no one has gone before.')