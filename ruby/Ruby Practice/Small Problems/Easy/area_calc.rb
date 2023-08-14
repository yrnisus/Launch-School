SQUARE_FEET_IN_METER = 10.7639
SQUARE_INCH_IN_FEET = 144
SQUARE_CENTIMETER_IN_FEET = 929
def calc_area
  length, width = get_input
  area = length * width.to_f
  puts "(#{(area).round(2)} square feet."
  puts "(#{(area*SQUARE_INCH_IN_FEET).round(2)} square inches)."
  puts "(#{(area*SQUARE_CENTIMETER_IN_FEET).round(2)} square centimeters)."
end

def get_input
  puts "Enter the length of the room in feet:"
  length = gets.chomp.to_i
  puts "Enter the width of the room in feet:"
  width = gets.chomp.to_i
  return length, width
end

calc_area