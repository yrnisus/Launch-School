require 'pry'

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

def display_hands_start(player, dealer)
  display_player_hand(player)
  display_dealer_hand_hidden(dealer)
end

def display_hands(player, dealer)
  display_player_hand(player)
  display_dealer_hand_full(dealer)
end

def display_hand(hand)
  msg = hand.map do |card|
    "[#{card}] "
  end.join
end

def display_player_hand(hand)
  prompt "Your cards: #{display_hand(hand)}"
  prompt "#{count_cards(hand)}"
end

def display_dealer_hand_hidden(hand)
  prompt "Dealer's cards:  [#{hand.first}] [?]"
end

def display_dealer_hand_full(hand)
  prompt "Dealer's cards: #{display_hand(hand)}"
  prompt "#{count_cards(hand)}"
end

def player_turn(player_hand, dealer_hand, deck)
  loop do
    prompt "(H)it or (S)tay?"
    input = gets.chomp
    if input.downcase.start_with?('h')
      player_hand << deal_card(deck)
      display_player_hand(player_hand)
    else
      break
    end

    if count_cards(player_hand) > 21
      prompt "Bust. You lose"
      break
    end
    system 'clear'
    display_hands_start(player_hand, dealer_hand)
  end
  # system 'clear'
  # dealer_turn(dealer_hand, deck)
  # display_hands(player_hand, dealer_hand)
end

def dealer_turn(hand, deck)
  total = count_cards(hand)
  loop do
    if total < 17
      hand << deal_card(deck)
      total = count_cards(hand)
    else
      break
    end
  end
end

def determine_winner(player_hand, dealer_hand)
  player_total = count_cards(player_hand)
  dealer_total = count_cards(dealer_hand)
  display_hands(player_hand, dealer_hand)

  if player_total > 21
    prompt "Dealer wins!"
    return nil
  elsif dealer_total > 21
     prompt "You win!"
    return nil
  end
  # neither player busted
  if player_total > dealer_total
    prompt "You win!"
  elsif player_total == dealer_total
    prompt "It's a tie!"
  else
    prompt "Dealer wins!"
  end

end

def count_cards(hand)
    total = 0
    hand.map do |card|
      if card.class == String
        total += FACE_CARDS_VALUES[card]
      else
        total += card
      end
    end
  total = handle_ace(total, hand.count("Ace")) if hand.include?("Ace")
  total
end

def handle_ace(total, aces)
  loop do
    if total > 21
      total -= 10
    end
    aces -= 1
    break if aces == 0
  end
  total
end


deck = initialize_deck
player_hand = []
dealer_hand = []

# gameplay start
loop do
  loop do
    2.times { player_hand << deal_card(deck) }
    2.times { dealer_hand << deal_card(deck) }
    break
  end
  display_hands_start(player_hand, dealer_hand)
  player_turn(player_hand, dealer_hand, deck)
  dealer_turn(dealer_hand, deck)
  determine_winner(player_hand, dealer_hand)
break
end