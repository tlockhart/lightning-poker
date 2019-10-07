# require 'card'

# # RSpec.describe 'a playing card' do

# # Stub out all the things we don't want to test in a card method (constructor, number of arguments, etc)
# # Provide reasonable defaults as needed, allowing us to
# describe Card do
#     def card(params = {})
#         default = {

#         }
#     end
#     it 'has suit' do
#         raise unless Card.new(suit: :spades, rank: 4).suit == :spades
#     end
#     it 'has a rank' do
#         raise unless Card.new(suit: :spades, rank: 4).rank == 4
#     end

#     describe 'a jack' do
#         it 'ranks higher than a 10' do
#             lower = Card.new(suit: :spades, rank: 10)
#             higher = Card.new(suit: :spades, rank: :jack)

#             raise unless higher.rank > lower.rank
#         end
#     end
#     describe 'a queen' do
#         it 'ranks higher than a 10' do
#             lower = Card.new(suit: :spades, rank: 10)
#             higher = Card.new(suit: :spades, rank: :queen)

#             raise unless higher.rank > lower.rank
#         end
#     end
#     describe 'a king' do
#         it 'ranks higher than a 10' do
#             lower = Card.new(suit: :spades, rank: 10)
#             higher = Card.new(suit: :spades, rank: :king)

#             raise unless higher.rank > lower.rank
#         end
#     end
# end