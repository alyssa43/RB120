# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

# class BeesWax
#   def initialize(type)
#     @type = type
#   end

#   def type
#     @type
#   end

#   def type=(t)
#     @type = t
#   end

#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end

# Answer =>
# To simplify this code we can invoke the `attr_accessor` method and pass it the instance variable `type` as the argument in the beginning of our code. By doing this we can eliminate the `type` and `type=` methods. Doing this should look like so:

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end