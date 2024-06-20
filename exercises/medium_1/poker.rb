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

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    create_new_deck
  end

  def draw
    create_new_deck if @deck.empty?
    @deck.pop
  end

  private

  def create_new_deck
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end
end

class PokerHand
  def initialize(deck)
    @hand = new_hand(deck)
    @hand_ranks = []
    @hand_suits = []

    @hand.each do |card|
      @hand_ranks << card.rank
      @hand_suits << card.suit
    end
  end

  def print
    @hand.each do |card|
      puts card
    end
  end

  def evaluate
    if    royal_flush?     then 'Royal flush'
    elsif straight_flush?  then 'Straight flush'
    elsif four_of_a_kind?  then 'Four of a kind'
    elsif full_house?      then 'Full house'
    elsif flush?           then 'Flush'
    elsif straight?        then 'Straight'
    elsif three_of_a_kind? then 'Three of a kind'
    elsif two_pair?        then 'Two pair'
    elsif pair?            then 'Pair'
    else 'High card'
    end
  end

  private

  def new_hand(deck)
    hand = []
    5.times { hand << deck.draw }
    hand.sort_by(&:find_value)
  end

  def n_of_a_kind(number)
    @hand_ranks.any? { |rank| @hand_ranks.count(rank) == number }
  end

  def royal_flush?
    flush? && @hand_ranks == [10, "Jack", "Queen", "King", "Ace"]
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    n_of_a_kind(4)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    @hand_suits.uniq.count == 1
  end

  def straight?
    @hand_ranks == Deck::RANKS[Deck::RANKS.index(@hand_ranks[0]), 5]
  end

  def three_of_a_kind?
    n_of_a_kind(3)
  end

  def two_pair?
    @hand_ranks.uniq.select { |rank| @hand_ranks.count(rank) == 2 }.count == 2
  end

  def pair?
    n_of_a_kind(2)
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'