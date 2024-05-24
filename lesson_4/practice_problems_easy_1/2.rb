# If we have a `Car` class and a `Truck` class and we want to be able to `go_fast`, how can we add the ability for them to `go_fast` using the module `Speed`? How can you check if your `Car` or `Truck` can now go fast?

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Answer => 
# To add the ability to `go_fast` to the `Car` and `Truck` classes we can mix in the `Speed` module to both classes. We do so by adding `include Speed` to each class. We can check if the a specific class has the ability to `go_fast` by instantiating a new object for the specific class and then calling the `go_fast` method on the instantiated object. If the object can `go_fast`, we will see the appropriate output; otherwise a `NameError` exception for an "undefined method called go_fast" will be returned. The correctly refactored code looks like so:

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

my_car = Car.new
my_truck = Truck.new

my_car.go_fast # => I am a Car and going super fast!
my_truck.go_fast # => I am a Truck and going super fast!