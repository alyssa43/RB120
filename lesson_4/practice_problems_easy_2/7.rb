# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the `@@cats_count` variable does and how it works. WHat code would you need to write to test your theory?

# Answer =>
# The `@@cats_count` variable is a class variable that will keep track of the total number of Cat objects that have been instantiated. It does this by incrementing the value of the `@@cats_count` by 1 each time `Cat.new` is invoked because of how the `initialize` method is defined within the `Cat` class. To test how this code works we could first make sure the `@@cats_count` class variable is equal to `0` before instatiating any `Cat` objects by calling:

p Cat.cats_count # => 0

# we can then instantiate a new `Cat` object and again output the value of the `@@cats_count` class variable. We can continue repeating this a few times to ensure it's working as planned. It would look something like this:

Cat.new('calico')
p Cat.cats_count # => 1

Cat.new('siamese')
p Cat.cats_count # => 2

Cat.new('maine coon')
p Cat.cats_count # => 3