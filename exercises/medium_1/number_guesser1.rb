class GuessingGame
  def initialize
    @guesses_remaining = 7
    @correct_number = rand(1..100)
    @user_guess = ""
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
    puts "Enter a number between 1 and 100:"
    loop do
      @user_guess = gets.to_i
      break if valid_guess?
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
    puts ""
    @guesses_remaining -= 1
  end

  def valid_guess?
    (1..100).include?(@user_guess)
  end

  def display_result
    result = if user_won?
      "That's the number!"
    elsif @user_guess > @correct_number
      "Your guess is too high."
    else
      "Your guess is too low."
    end
    puts result
  end

  def user_won?
    @user_guess == @correct_number
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

game = GuessingGame.new
game.play
