require 'pry-byebug'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAME_LIMIT = 5
MIDDLE_SQUARE = 5
PLAYERS_ARRAY = ["Player", "Computer"]
GRID_SIZE = 3

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
  square = nil

  # offense
  WINNING_LINES.each do |line|
    square = find_potential_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_potential_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # center
  if !square && brd[MIDDLE_SQUARE] == INITIAL_MARKER
    square = MIDDLE_SQUARE
  end

  # random
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end


def find_potential_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  end
end

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

def get_turn_order
  prompt "Please choose who goes first: Player, Computer or Random"
  input = gets.chomp
  if input.downcase.start_with?('p')
    return "Player"
  elsif input.downcase.start_with?('c')
    return "Computer"
  end
  PLAYERS_ARRAY.sample
end

def place_piece!(board, current_player)
  if current_player.downcase == 'player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player.downcase == 'player' ? "Computer" : "Player"
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  current_player = get_turn_order
  loop do
    display_board(board)
    place_piece!(board, current_player)
    display_board(board)
    current_player = alternate_player(current_player)
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