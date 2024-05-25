# If i have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# Answer =>
# The `self.manufacturer` method is the class method, and we know this because it is prefaced with `self`. Prefacing a method with `self` is how we define a class method. To call this method we use the class itself as the caller which in this case is `Television`, it would look like so:

Television.manufacturer