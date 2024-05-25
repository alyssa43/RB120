# When objects are created they are a separate realization of a particular class.
# Given the class below, how do we create two different instances of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hissss!!!"
  end
end

# Answer =>
# To create two different instances of the `AngryCat` class we must instantiate two new `AngryCat` objects. We do this by invoking the `new` method on our `AngryCat` class and pass in the age and name as arguments. Like so:

ollie = AngryCat.new(2, "Ollie")
daphne = AngryCat.new(5, "Daphne")

p ollie #<AngryCat:0x000000010c59c6c8 @age=2, @name="Ollie">
p daphne #<AngryCat:0x000000010c59c5b0 @age=5, @name="Daphne">

# We can see here that we now have two different instances of `Angry_cat` with their own different states.
