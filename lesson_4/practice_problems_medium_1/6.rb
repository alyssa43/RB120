# If we have these two methods in the `Computer` class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# Answer =>
# There is no difference in the way this code works. In the top code example within the `show_template` method we are calling the `template` getter method that Ruby created when we added `attr_accessor :template`. And in the bottom code example, when we use `self.template` we are telling Ruby that we are calling a method called `template`. They are essentially the same thing. When invoking a getter method within a class it isn't required to add `self` before the method, however for a setter method it is required.
