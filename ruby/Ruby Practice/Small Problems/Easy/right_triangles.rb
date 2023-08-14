def triangle(num, modification = false)
  if modification == 'reverse'
    format_str = '*%{spaces}%{stars}'
  else
    format_str = '%{spaces}%{stars}*'
  end

  (0...num).each do |line_counter|
    offset = num - line_counter
    output = format(format_str, spaces: ' ' * offset, stars: '*' * line_counter)
    puts output
  end
end

# def triangle(num, modification = false)
#   (1..num).each do |line_counter|
#     offset = num - line_counter
#     spaces = ' ' * offset
#     stars = '*' * line_counter
#     output = if modification == 'reverse'
#               "#{stars}#{spaces}"
#             elsif modication
#             else
#               "#{spaces}#{stars}"
#             end
#     puts output
#   end
# end



triangle(5, 'reverse-upsidedown')
triangle(9)