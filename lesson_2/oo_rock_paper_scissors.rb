require 'pry'

class Move
  MOVES = %w(rock paper scissors lizard spock)

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (spock? && (other_move.scissors? || other_move.rock?)) ||
      (lizard? && (other_move.spock? || other_move.paper?))
  end

  def <(other_move)
    ((rock? && other_move.paper?) || other_move.spock?) ||
      ((paper? && other_move.scissors?) || other_move.lizard?) ||
      ((scissors? && other_move.rock?) || other_move.spock?) ||
      ((spock? && other_move.lizard?) || other_move.paper?) ||
      ((lizard? && other_move.rock?) || other_move.scissors?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      system 'clear'
      puts "=> Please enter your name:"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts 'Sorry, must enter a name.'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts '=> Please choose rock, paper, scissors, lizard, or spock:'
      choice = gets.chomp.downcase
      break if Move::MOVES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::MOVES.sample)
  end
end

module Displayable
  DISPLAY_SIZE = 80

  def center_text(text)
    puts text.center(DISPLAY_SIZE)
  end

  def prompt(text)
    puts "=> #{text}"
  end

  def display_border(text)
    width = text.length + 4
    horizontal = "-" * width
    vertical = "|#{(' ' * (width - 2))}|"

    center_text(horizontal)
    center_text(vertical)
    center_text("| #{text} |")
    center_text(vertical)
    center_text(horizontal)
  end

  def display_empty_line
    puts ''
  end

  def display_welcome_message
    system 'clear'
    center_text("---> Welcome to Rock, Paper, Scissors, Lizard, Spock! <---")
    center_text("The first to reach 10 points is the winner!")
    display_empty_line
  end

  def display_score_board
    center_text("SCOREBOARD")
    display_border("---> #{human.name}'s score: #{human.score} | #{computer.name}'s score: #{computer.score} | ties: #{@ties} <---")
  end

  def display_moves
    display_empty_line
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
    display_empty_line
  end

  def display_winner
    system 'clear'
    display_score_board
    display_moves

    if winner.nil?
      puts "It's a tie!"
    else
      puts "#{winner} won!"
    end

    display_empty_line
  end

  def display_final_score
    display_border("EXITING NOW...")
    sleep 2
    system 'clear'
    center_text("GAME OVER! THE FINAL SCORE IS:")
    display_empty_line
    display_score_board
    display_empty_line
    center_text("Congratulations, #{grand_winner}, you are the winner!") if grand_winner
  end

  def display_goodbye_message
    display_final_score
    center_text("---> Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye! <---")
    display_empty_line
  end
end

# Game Orchestration Engine
class RPSGame
  include Displayable
  attr_accessor :human, :computer, :ties, :winner, :grand_winner

  WINNING_SCORE = 10

  def initialize
    @human = Human.new
    @computer = Computer.new
    @ties = 0
  end

  def determine_winner
    @winner = if human.move > computer.move
                human.score += 1
                human.name
              elsif human.move < computer.move
                computer.score += 1
                computer.name
              else
                @ties += 1
              end
  end

  # def update_score
  #   if winner == human.name
  #     human.score += 1
  #     @winner = human.name
  #   elsif winner == computer.name
  #     computer.score += 1
  #     @winner = computer.name
  #   else
  #     @ties += 1
  #   end
  # end

  def grand_winner?
    if human.score == WINNING_SCORE
      @grand_winner = human.name
      return true
    elsif computer.score == WINNING_SCORE
      @grand_winner = computer.name
      return true
    end

    false
  end

  def next_round?
    prompt("Push any button to continue to the next round, or 'q' to quit.")
    answer = gets.chomp.downcase

    quit = quit_game? if answer.start_with?('q')

    return false if quit
    true
  end

  def quit_game?
    answer = ''

    loop do
      prompt("Are you sure you want to quit? (yes/no)")
      answer = gets.chomp.downcase
      break if answer.start_with?('y') || answer.start_with?('n')
      prompt("Invalid input, please enter either 'yes' or 'no'")
    end

    answer.start_with?('y')
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      determine_winner
      display_winner
      break if grand_winner?
      break unless next_round?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
