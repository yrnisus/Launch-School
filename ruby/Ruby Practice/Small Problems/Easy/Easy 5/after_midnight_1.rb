require 'date'

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
DAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
DAY_VALUES = (0..6).to_a
DAY_HASH = DAY_VALUES.zip(DAYS).to_h

# original problem
def time_of_day(num)
  minutes = num % MINUTES_PER_DAY
  "%02d" % (minutes / 60) + ":%02d" % (minutes % 60)
end

def get_minutes(str)
  arr = str.split(":")
  arr.first.to_i * MINUTES_PER_HOUR + arr.last.to_i
end

# Date
def time_of_day(num)
  while num < 0
    num += MINUTES_IN_DAY
  end
  minutes = num % MINUTES_IN_DAY
  time = Date.today.to_time + (minutes * 60)
  format('%02d:%02d', time.hour, time.min)
end

# Time
def time_of_day(num)
  while num < 0
    num += MINUTES_IN_DAY
  end
  minutes = num % MINUTES_IN_DAY
  time = Time.new(0) + (minutes * 60)
  format('%02d:%02d', time.hour, time.min)
end

# Day of the week
# sunday morning midnight is 0
def time_of_day(num)
  day = 0

  while num < 0
    num += MINUTES_IN_DAY
    day -= 1
  end

  while day < 0
    day += 7
  end
  hours, minutes = (num % MINUTES_IN_DAY).divmod(60)

  "#{DAY_HASH[day]} #{format('%02d:%02d', hours, minutes)}"
end


p time_of_day(-4231) #== "00:35"

=begin

algorithm:
Date.to_time converts to time object. Can directly add number of minutes
=end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"