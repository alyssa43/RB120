# If we have this code:

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

# What happens in each of the following cases:

# Case 1 =>
hello = Hello.new
hello.hi # => Hello will be output

# Case 2 => 
hello = Hello.new
hello.bye # => NameError exception for an undefined method named `bye`

# Case 3 => 
hello = Hello.new
hello.greet # => ArgumentError exception because `greet` is being called with 0 arguments, when it should have 1 argument

# Case 4 =>
hello = Hello.new
hello.greet("Goodbye") # => Goodbye will be output

# Case 5 =>
Hello.hi # => NameError exception for an undefined class mathod name `hi`