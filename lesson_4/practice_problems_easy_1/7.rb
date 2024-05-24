# if we have a class such as the below one:

class Cat 
  attr_accessor :type, :age 

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the `make_one_year_older` method we have used `self`.
# What does `self` refer to here?

# Answer => 
# By calling `self.age` within the `make_one_older` method definition
# we are telling Ruby that we are calling an instance variable, in this
# case we are calling `self.age` as a setter method for `@age`. `self`
# here is refering to the calling objects own self.