# def triangle(*args)
#   args.sort!
#   return :invalid if args.any? { |x| x <= 0} || (args[0..1].inject(:+) <= args[-1])
#   # valid triangle
#   return case args.uniq.size
#     when 1 then :equilateral
#     when 2 then :isosceles
#     when 3 then :scalene
#   end
# end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid


def triangle(*args)
  if args.inject(:+) != 180 || args.any? { |x| x <= 0}
    return :invalid
  else
    if args.all? { |x| x < 90}
      return :acute
    elsif args.any? { |x| x == 90}
      return :right
    elsif args.one? { |x| x > 90 }
      return :obtuse
    end
  end
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid