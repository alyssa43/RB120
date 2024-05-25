# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    # rules of play
  end
end

# What would happen if we added a `play` method to the `Bingo` class, keeping in mind that there is already a method of this name in the `Game` class that the `Bingo` class inherits from.

# Answer =>
# If there was a `play` method within the `Bingo` class, anytime `Bingo.play` is invoked Ruby would use that method within the `Bingo` class instead of the one in the `Game` class (unless it specifically calls `super` somewhere within it's method definition). This happens because of the method lookup chain. First the current class will be checked for the method that was invoked, if it was not found it will then search in the next class up the mehtod lookup chain. In this case, the next class would be the superclass `Game`.