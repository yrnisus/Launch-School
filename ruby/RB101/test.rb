require 'yaml'

data = YAML.load_file('chat_messages.yml')
messages_arr = data['message']

# messages.each do |message|
#   puts message['message']

# puts messages_arr['intro']
puts messages_arr

