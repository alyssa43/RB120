# In the last question we had a module called `Speed` which contained a `go_fast` method. We included this module in the `Car` class as shown below:

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

# When we called the `go_fast` method from an instance of the `Car` class (as shown below) you might have noticed that the `string` printed when we go fast includes the name of the type of vehicle we are using. How is this done?

small_car = Car.new
small_car.go_fast

# Answer =>
# This is done by interpolating the return value of calling the `#class` method on `self` into the string to be output when `go_fast` is invoked. By using the `self` keyword we are wanting to get the class of the current object that is calling the `go_fast` method, which in this case is the object `small_car` which is an object instantiated from the `Car` class. That is why in this code we see `Car` is the string interpolated into our output.