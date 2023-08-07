# p: Write a method that returns the number of friday the 13ths in a year.
# Assume year is greater than 1752.

# i: year as four digit integer
# o: integer count

# mm: Take a year. Check for all occurances of friday the 13th in that year.
# Return the count

# e: friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

# ds: date, integer

# algo:
# Create a method friday_13th that takes a year as an integer
# create a new date object from the year as an integer
# create a new variable count to store the integer count
# Check the 13th of each month to determine if it was a friday
# If true increment count by one
# return the count

require 'date'

def friday_13th(year)
  count = 0
  1.upto(12) { |month| count +=1 if (Date.new(year, month, 13)).wday == 5 }
  count
end

def five_fridays(year)
  count = 0
  1.upto(12) do |month|
    friday_count = 0
    d = Date.new(year, month, 1)
    # A range of the first day of the month to the last day of the month
    # counts up the number of fridays in a month
    d.upto(d.next_month.prev_day) { |x| friday_count +=1 if x.wday == 5}
  count +=1 if friday_count == 5
  end
  count
end


p five_fridays(2023)