=begin

Problem: Find the number of friday the 13s in a given year. Year must be greater than
1752

Examples:

Data structure: date

algorithm:
Initialize a date object with the given year
initialize a counter to 0
Create an array of each 13th of the month for that year
check each 13th for day of week, if friday increment counter
return counter

=end

require 'date'

def friday_13th(year)
  counter = 0
  1.upto(12) do |month|
    counter += 1 if date_obj = Date.new(year, month, 13).friday?
  end
  counter
end

require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) { |month| count +=1 if (Date.new(year, month, 13)).wday == 5 }
  count
end



p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2