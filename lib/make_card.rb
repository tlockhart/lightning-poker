# require 'card'
require_relative 'card'

card1 = Card.new(suit: :spades, rank: 9)

puts "#{card1.suit}, #{card1.rank}"