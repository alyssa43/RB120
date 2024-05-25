# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call `Hello.hi` we get an error message. How would you fix this?

# Answer =>
# We get a NameError exception because calling `Hello.hi` is telling ruby we want to invoke a class method called `hi` within the `Hello` class, and we do not have a class method called `hi` within the `Hello` class. To fix this we need to instantiate a new `Hello` class object by calling `Hello.new`, and then call the `hi` method on that return value. Like so:

Hello.new.hi
# OR
hi = Hello.new
hi.hi

# OR we could change the `hi` method to a class method like so:

class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

Hello.hi
