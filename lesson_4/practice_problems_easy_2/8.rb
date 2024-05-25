# If we have this class:

# class Game
#   def play
#     "Start the game!"
#   end
# end

# # And another class:

# class Bingo
#   def rules_of_play
#     # rules of play
#   end
# end

# What can we add to the `Bingo` class to allow it to inherit the `play` method from the `Game` class?

# Answer => 
# If we add `< Game` after `class Bingo` that will allow the `Bingo` class to inherit from the `Game` class. It would leave us with this code:

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
