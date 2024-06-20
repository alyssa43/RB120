class GuessingGame
  attr_accessor :secret_num, :guesses_remaining
  def initialize(min_num, max_num)
    @min_num = min_num
    @max_num = max_num
    @secret_num = rand(@min_num..@max_num)
    @guesses_remaining = Math.log2(max_num - min_num).to_i + 1
    @users_guess = ""
  end

  def play
    loop do 
      display_remaining_guesses
      loop do
        user_input_guess
        break if valid_guess?

      end

      display_result
      break if user_won? || @guesses_remaining == 0
    end

    display_winner
  end

  private

  def display_remaining_guesses
    puts "You have #{@guesses_remaining} guess remaining."
  end

  def user_input_guess
    puts "Enter a number between #{@min_num} and #{@max_num}:"
    loop do
      @users_guess = gets.to_i
      break if valid_guess?
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
    puts ""
    @guesses_remaining -= 1
  end

  def valid_guess?
    (@min_num..@max_num).include?(@users_guess)
  end

  def display_result
    result = if user_won?
      "That's the number!"
    elsif @users_guess > @secret_num
      "Your guess is too high."
    else
      "Your guess is too low."
    end
    puts result
  end

  def user_won?
    @users_guess == @secret_num
  end

  def display_winner
    puts ""
    if user_won?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
