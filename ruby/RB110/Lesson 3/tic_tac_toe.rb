require 'pry-byebug'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAME_LIMIT = 5

# rubocop:disable Metrics/MethodLength
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end


# returns array of empty squares
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  threat = computer_detect_threat(brd)
  if threat
    square = threat.join.to_i
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def computer_detect_threat(brd)
  threats = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
       threats << line.select { |square| brd[square] == INITIAL_MARKER }
    end
  end
  threats.sample
end

# def computer_detect_threat(brd)
#   WINNING_LINES.each do |line|
#     if brd.values_at(*line).count(PLAYER_MARKER) == 2
#       return line.select { |square| brd[square] != PLAYER_MARKER}
#     else
#       return nil
#     end
#   end
# end


def prompt(msg)
  puts "=> #{msg}"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimiter = ', ', word = 'or')
  return arr.join(" #{word} ") if arr.size <= 2
  counter = 0
  msg = []
  loop do
    msg << "#{arr[counter]}#{delimiter}"
    counter+=1
    if counter == arr.size - 1
        msg << ("#{word} #{arr[-1]}")
        break
    end
  end
  msg.join(" ")
end


player_score = 0
computer_score = 0

loop do
  board = initialize_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    if winner == "Player"
      player_score +=1
    else
      computer_score +=1
    end
  else
    prompt "It's a tie!"
  end
  if player_score >= GAME_LIMIT || computer_score >= GAME_LIMIT
    system 'clear'
    prompt "Game over. The #{winner} was the first to #{GAME_LIMIT} games."
    prompt "Player score: #{player_score} - Computer score: #{computer_score}"
    prompt " "
    break
  end
  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Goodbye'
