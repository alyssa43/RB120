require 'pry'

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

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
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (rock? && other_move.lizard?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.scissors?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (paper? && other_move.spock?) ||
      (spock? && other_move.rock?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?) ||
      (lizard? && other_move.rock?) ||
      (spock? && other_move.lizard?) ||
      (scissors? && other_move.spock?) ||
      (lizard? && other_move.scissors?) ||
      (paper? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (rock? && other_move.spock?)
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
      break if Move::VALUES.include?(choice)
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
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  WINNING_SCORE = 10
  DISPLAY_SIZE = 80

  attr_accessor :human, :computer, :ties, :winner, :grand_winner

  def initialize
    @human = Human.new
    @computer = Computer.new
    @ties = 0
  end

  def center_text(text)
    puts text.center(DISPLAY_SIZE)
  end

  def prompt(text)
    puts "=> #{text}"
  end

  def display_empty_line
    puts ''
  end

  def display_welcome_message
    system 'clear'
    center_text("---> #{human.name}, welcome to Rock, Paper, Scissors, Lizard, Spock! <---")
    center_text("The first to reach 10 points is the winner!")
    display_empty_line
  end

  def display_goodbye_message
    center_text("---> Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye! <---")
    display_empty_line
  end

  def display_score_board
    center_text("SCOREBOARD")
    center_text("---> #{human.name}'s score: #{human.score} | #{computer.name}'s score: #{computer.score} | ties: #{@ties} <---")
  end
    
  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    system 'clear'
    display_score_board
    display_empty_line
    display_moves
    display_empty_line

    if winner.nil?
      puts "It's a tie!"
    else
      puts "#{winner} won!"
    end

    display_empty_line
  end

  def display_final_score
    system 'clear'
    center_text("GAME OVER! THE FINAL SCORE IS:")
    display_empty_line
    display_score_board
    display_empty_line
    center_text("Congratulations, #{grand_winner}, you are the winner!") if grand_winner
  end

  def determine_winner
    if human.move > computer.move
      @winner = human.name
    elsif human.move < computer.move
      @winner = computer.name
    else
      @winner = nil
    end
  end

  def update_score
    if winner == human.name
      human.score += 1
    elsif winner == computer.name
      computer.score += 1
    else
      @ties += 1
    end
  end

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
    puts "=> Push any button to continue to the next round, or 'q' to quit."
    answer = gets.chomp.downcase

    quit = quit_game? if answer.start_with?('q')

    return false if quit
    return true
  end

  def quit_game?
    answer = ''

    loop do
      puts "=> Are you sure you want to quit? (yes/no)"
      answer = gets.chomp.downcase
      break if answer.start_with?('y') || answer.start_with?('n')
      puts "Invalid input, please enter either 'yes' or 'no'"
    end

    answer.start_with?('y')
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      determine_winner
      update_score
      #display_moves
      display_winner
      #display_score_board
      #binding.pry
      break if grand_winner?
      break unless next_round?
    end
    display_final_score
    display_goodbye_message
  end
end

RPSGame.new.play