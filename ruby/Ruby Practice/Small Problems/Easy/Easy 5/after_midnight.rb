MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(num)
  minutes = num % MINUTES_PER_DAY
  "%02d" % (minutes / 60) + ":%02d" % (minutes % 60)
end

def get_minutes(str)
  arr = str.split(":")
  minutes = arr.first.to_i * MINUTES_PER_HOUR + arr.last.to_i
end

def after_midnight(str)
  minutes = get_minutes(str)
  (minutes == 1440) ? 0 : minutes
end

def before_midnight(str)
  (MINUTES_PER_DAY - get_minutes(str)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0


# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"