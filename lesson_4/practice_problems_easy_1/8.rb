# If we have a class such as the one below:

class Cat
  @@cat_counts = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cat_counts += 1
  end

  def self.cat_counts
    @@cat_counts
  end
end

# In the name of the `cats_count` method we have used `self`. What does `self` refer to in this context?

# Answer =>
# To define a class method within a class we must add `self.` before the method name. Which is what we did here, we have used `self` to create a class method called `cat_counts`. In this context, `self` is referring to the current class (which in this case is `Cat`). It is created like this so we can use the class to call the `cat_counts` method, like so:

Cat.cat_counts
