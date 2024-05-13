# What output does this code print? Think about any undesirable effects occurring due to the invocation on line 18. Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
# class Pet 
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     @name.upcase!
#     "My name is #{name}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name # => Fluffy
# puts fluffy # => "My name is FLUFFY."
# puts fluffy.name # => FLUFFY
# puts name # => FLUFFY

# When we instatated our new `Pet` object called `fluffy` and passed our local variable `name` as the argument (and because that argument is a String), our `Pet` class variable `@name` and our local variable `name` are both referencing the same String object. Then when we invoke `puts fluffy` on line 18 we are invoking the `to_s` class method within the `Pet` class. Because within that method definition we first invoke the `String#upcase!` method on our class variable `@name`, we are then mutating the `@name` class variable to now reference an all uppercased string. And, beacuse our local variable `name` is also referencing the same String object, that local variable will also see that mutation. To fix this side effect from happening we can remove that line of code (line 18), and instead within the string to be returned on line 11, change it to `"My name is #{name.upcase}."`

# refactored solution:
class Pet 
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => Fluffy
puts fluffy # => My name is FLUFFY.
puts fluffy.name # => Fluffy
puts name # => Fluffy

# Further Exploration: What would happen in this case?
# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name # => 42
# puts fluffy # => My name is 42.
# puts fluffy.name # => 42
# puts name # => 43

# Why does this code work? => This works because when we instantiated our new `Pet` object on line 46 we passed an Integer as the argument. Within the `initialize` class method we are then assigning our class variable `@name` to reference the return value of invoking the `to_s` method on our `name` parameter which is the Integer 42. Meaning that our class variable `@name` is now referencing the string object `"42"`. Because of this reassignment, our `Pet` class variable `@name` and our local variable `name` are now referencing different objects.
