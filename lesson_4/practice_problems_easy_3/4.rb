# Given the class below, if we created a new instance of the class and then called `to_s` on that instance we would get something like "#<Cat:0x007ff39b356d30>"

# class Cat
#   def initialize(type)
#     @type = type
#   end
# end

# How could we go about changing the `to_s` output on this method to look like this: "I am a tabby cat" ? (This is assuming the "tabby" is the `type` we passed in during initiailzation).

# Answer =>
# To get our desired output we need to override the `to_s` method by defining our own method called `to_s` within the `Cat` class that has the return value of the String we wish to output when a `Cat` object is the argument of a `puts` method invocation. Our code should look like so:

class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat."
  end
end

ollie = Cat.new("tabby")
puts ollie # => I am a tabby cat.