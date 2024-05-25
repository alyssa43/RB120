# If we have a class such as the one below:

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix?

# Answer =>
# We could also prefix age with the `@` symbol. This is telling Ruby that we want to reference an instance variable and not create a new local variable. The new method definition would look like so:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    @age += 1
  end
end