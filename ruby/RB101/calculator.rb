require 'yaml'
require "pry" # add this to use Pry
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result


# def write_message(message)
#   file = File.read('chat_messages.yml')
#     data.YAML.load(file) if(file)

#     data[:message] << message

#     File.write('chat_messages.yml', data.to_yaml)
# end

def read_messages
  data = YAML.load_file('chat_messages.yml')
  data['message']
end

def prompt(message)
  puts "=> #{message}"
end

# checks if integer
def integer?(input)
  # input is string
  input.to_i if input.to_i.to_s == input
end

def float?(input)
  # convert input to a float, and check if it's equal to the original input
  # this handles inputs with trailing or leading whitespace correctly
  if input.to_s.end_with?(".")
    input = input.chop.to_f.to_s
  end
  input.to_f if input.to_f.to_s == input
end

def valid_number?(input)
  input = integer?(input) || float?(input)
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

# MAIN
messages_arr = read_messages
prompt(messages_arr['intro'])

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages_arr['invalid_name'])
  else
    break
  end
end
prompt(messages_arr['name'] + "#{name}")

# main loop
loop do
  num1 = ''
  num2 = ''
  loop do
    prompt(messages_arr['first_number'])
    num1 = gets.chomp
    if valid_number?(num1)
      num1 = valid_number?(num1)
      break
    else
      prompt(messages_arr['invalid_number'])
    end
  end

  loop do
    prompt(messages_arr['second_number'])
    num2 = gets.chomp
    if valid_number?(num2)
      num2 = valid_number?(num2)
      break
    else
      prompt(messages_arr['invalid_number'])
    end
  end

binding.pry
#   operator_prompt = <<-MSG
# What operation would you like to perform
#     1) add
#     2) subtract
#     3) multiply
#     4) divide
#     MSG
  prompt(messages_arr['operator_prompt'])

  operator = ''

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages_arr['invalid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  # num1 = num1.to_i
  # num2 = num2.to_i

  result =  case operator
            when '1' then num1 + num2
            when '2' then num1 - num2
            when '3' then num1 * num2
            when '4' then num1.to_f / num2.to_f
            end

  prompt result

  prompt(messages_arr['repeat?'])
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
