class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def <=>(other_card)
    find_value <=> other_card.find_value
  end

  def ==(other_card)
    [@rank, @suit] == [other_card.rank, other_card.suit]
  end

  protected

  def find_value
    case @rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else @rank
    end
  end
end

class Deck < Card
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << [rank, suit]
      end
    end
    @deck.shuffle!
  end

  def create_new_deck
    RANKS.each do |rank|
      SUITS.each do |suit|
        

  def draw
    Deck.new if @deck.empty?
    @deck.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
# drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# drawn != drawn2 # Almost always.