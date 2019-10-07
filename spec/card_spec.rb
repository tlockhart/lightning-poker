require 'set'
require 'card'

# RSpec.describe 'a playing card' do

# Stub out all the things we don't want to test in a card method (constructor, number of arguments, etc)
# Provide reasonable defaults as needed, allowing us to override only the things we care about
describe Card do
    # puting the method inside the describe block scopes it to just these examples
    def card(params = {})
        defaults = {
            suit: :hearts,
            rank: 7,
        }
        #  Create a new card with the defaults
        # Splat object dereferencing
        # Card.new(**defaults.merge(params))
        Card.build(*defaults.merge(params).values_at(:suit, :rank))
    end
    it 'has suit' do
        # override the suit parameters from stubbed out method, instead of class
        # Test does not require rank
        # raise unless card(suit: :spades).suit == :spades
        expect(card(suit: :spades).suit).to be(:spades)
    end
    it 'has a rank' do
        # override the rank parameters from stubbed out method, instead of class
        # Test does not require suit
        raise unless card(rank: 4).rank == 4
    end
    # Test
    context 'equality' do
        # memoized alternative to subject ||=, which assigns a variable if it has not been assigned, also equivalent to let(:subject)
        subject { card(suit: :spades, rank: 4) }

        # Extract out subject to return a default instead of repeating
        # def subject
        #     @subject ||= card(suit: :spades, rank: 4)  
        # end
        
        describe 'comparing against self' do
            # Extract out other to return a default instead of repeating
            # def other
            #     # @other ||= card(suit: :spades, rank: 4)   
            # end

            # memoized alternative to ||=, which assigns a variable if it has not been assigned 
            let(:other) {card(suit: :spades, rank: 4)}

            it 'is equal' do
                # raise unless subject == other
                expect(subject).to eq(other)
            end
            it 'is hash equal' do
                # raise unless Set.new([subject, other]).size == 1
                expect(Set.new([subject, other]).size).to eq(1)
            end
        end
        # Shared Examples can be included in mult places like a module
        shared_examples_for 'an unequal card' do
            it 'is not equal' do
                # raise unless subject != other
                expect(subject).not_to eq(other)
            end
            it 'is not hash equal to a card of differing suit' do
                # raise unless Set.new([subject, other]).size ==2
                expect(Set.new([subject, other]).size).to eq(2)
            end
        end
        describe 'comparing to a card of different suit' do
            # memoized alternative to ||=, which assigns a variable if it has not been assigned
            let(:other) {card(suit: :hearts, rank: 4)}
            
            # Extract out other to return a default instead of repeating
            # def other
                # @other ||= card(suit: :hearts, rank: 4)
            # end

            # include shared examples
            it_behaves_like 'an unequal card'
        end
        describe 'comparing to a card of different rank' do
            # memoized alternative to ||=, which assigns a variable if it has not been assigned
            let(:other) {card(suit: :spades, rank: 5)}
            
            # Extract out other to return a default instead of repeating
            # def other
            #     @other ||= card(suit: :spades, rank: 5)    
            # end

            # include shared examples
            it_behaves_like 'an unequal card'
        end
    end
    
    describe 'a jack' do
        it 'ranks higher than a 10' do
            # suite is irrelevant to our rank test
            lower = card(rank: 10)
            higher = card(rank: :jack)

            raise unless higher.rank > lower.rank
        end
    end
    describe 'a queen' do
        it 'ranks higher than a 10' do
            # suite is irrelevant to our rank test
            lower = card(rank: 10)
            higher = card(rank: :queen)

            raise unless higher.rank > lower.rank
        end
    end
    describe 'a king' do
        it 'ranks higher than a 10' do
            # suite is irrelevant to our rank test
            lower = card(rank: 10)
            higher = card(rank: :king)

            raise unless higher.rank > lower.rank
        end
    end
end