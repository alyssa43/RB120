# Which of these two classes would create objects that would have an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Answer =>
# The `Pizza` class is the only class of these two classes that can create objects that will have an instance variable. We know this because within the `initialize` method definition of the `Pizza` class, we are assigning the instance variable `@name`. While within the `Fruit` class' `initialize` method definition we are assigning a method local variable called `name`. We can see this difference because instance variables begin with `@`.
# Another way to tell of an obects instance variables, is to invoke the `#instance_variables` method on the object. It will return an array of all the instance variables avaialable to the calling object. This looks like so:

favorite_fruit = Fruit.new("strawberry")
favorite_pizza = Pizza.new("cheese")

p favorite_fruit.instance_variables # => []
p favorite_pizza.instance_variables # => [:@name]