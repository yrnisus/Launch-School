require 'pry'

=begin
You start with a normal 52-card deck consisting of the 4 suits
(hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end


=begin

=end

# CARDS_ARRAY = { '1': 1, '2': 2, '3': 3,
#                 '4': 4, '5': 5, '6': 6,
#                 "7": 7, "8": 8, '9': 9,
#                 '10': 10, "Jack": 10, 'Queen': 10,
#                 'King': 10, 'Ace': 11
# }

CARDS_ARRAY = (2..10).to_a + ["Jack", "Queen", "King", "Ace"]
FACE_CARDS_VALUES = {
  "Jack"=> 10, "Queen"=> 10,
  "King"=> 10, "Ace"=> 11
  }

def initialize_deck
  deck = {
    :heart => [],
    :club => [],
    :spade => [],
    :diamond => []
  }

  deck.keys.each do |key, value|
    deck[key] = CARDS_ARRAY.dup
  end
  deck
end

def deal_card(deck)
  suit = deck.keys.sample
  card = deck[suit].sample
  deck[suit].delete(card)
  card
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_hands(player, computer)
  display_player_hand(player)
  prompt "Computer Hand - #{computer.sample}"
end

def display_player_hand(hand)
  total = 0
  msg = hand.map do |card|
    if card.class == String
      total += FACE_CARDS_VALUES[card]
    else
      total += card
    end
    "[#{card}] "
  end.join
  prompt "Player Hand: #{msg}"
  prompt "#{total}"
end

def player_turn(player_hand, deck)
  loop do
    puts ""
    prompt "(H)it or (S)tay?"
    input = gets.chomp
    if input.downcase.start_with?('h')
      player_hand << deal_card(deck)
      prompt "#{player_hand}"
    else
      break
    end
  end
  prompt "Your total is num"
end


deck = initialize_deck
player_hand = []
computer_hand = []

# gameplay start
loop do
  loop do
    2.times { player_hand << deal_card(deck) }
    2.times { computer_hand << deal_card(deck) }
    break
  end
  display_hands(player_hand, computer_hand)
  player_turn(player_hand, deck)
  p player_hand
break
end