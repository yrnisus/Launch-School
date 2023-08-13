SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def initialize_deck
  deck = SUITS.product(VALUES).shuffle
end

def deal_card(deck)
  deck.pop
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_hand(active_player, hand)
  msg = "-#{active_player}: "
  msg += hand.map do |card|
    format_card(card)
  end.join("-")
  prompt msg
end

def format_card(card)
    "#{card.last}#{card.first}"
end

# def get_suit(suit)
#   case suit
#     when "C" then return "Clubs"
#     when "H" then return "Hearts"
#     when "S" then return "Spades"
#     when "D" then return "Diamonds"
#   end
# end

def start_message
  prompt "Welcome to Twenty-One!"
end

def count_cards(hand)
  hand.map do |card|
    p card
  end
end

# game loop
loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deal_card(deck)
    dealer_hand << deal_card(deck)
  end
  start_message
  display_hand("Player", player_hand)
# Play again
  break
end