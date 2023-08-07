require 'pry'
VALID_CHOICES = %w(rock paper scissors spock lizard)
VALID_SHORTENS = %w(r p s v l)

def prompt(message)
  puts("=> #{message}")
end

# def rock_win?(x, y)
#   (x == 'rock' && (y == 'scissors' || y == 'lizard'))
# end

# def paper_win?(x, y)
#   (x == 'paper' && (y == 'rock' || y == 'spock'))
# end

# def scissors_win?(x, y)
#   (x == 'scissors' && (y == 'paper' || y == 'lizard'))
# end

# def spock_win?(x, y)
#   (x == 'spock' && (y == 'rock' || y == 'scissors'))
# end

# def lizard_win?(x, y)
#   (x == 'lizard' && (y == 'spock' || y == 'paper'))
# end

def win?(x, y)
  winning_moves = {
    rock: %w(scissors lizard),
    paper: %w(rock spock),
    scissors: %w(paper lizard),
    spock: %w(rock scissors),
    lizard: %w(spock paper)
  }

    winning_moves[x.to_sym].include?(y)
    # puts winning_moves[:x].include?(y)



  # rock_win?(x, y) ||
  #   paper_win?(x, y) ||
  #   scissors_win?(x, y) ||
  #   spock_win?(x, y) ||
  #   lizard_win?(x, y)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def check_shorten(choice)
  VALID_SHORTENS.find_index { |x| x == choice }
end

player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("First to three wins!")
    prompt("Choose one: #{VALID_CHOICES.join(' ')}")
    choice = gets.chomp
    # check user input to see if it is the first letter of a valid choice
    shorten = check_shorten(choice)
    choice = VALID_CHOICES[shorten] if shorten

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Thats not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)
  player_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)
  puts "Player score - #{player_score} : Computer Score - #{computer_score}"
  if player_score == 3 || computer_score == 3
    puts player_score == 3 ? 'Player wins!' : "Computer wins!"
    break
  end
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end



# winning_moves = {
#   rock: %w(scissors lizard),
#   paper: %w(rock spock),
#   scissors: %w(paper lizard),
#   spock: %w(rock scissors),
#   lizard: %w(spock paper)
# }


# puts winning_moves[:rock].include?('spock')




