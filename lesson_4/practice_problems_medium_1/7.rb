# How could you change the method name below so that the method name is more clear and less repetitive?

# class Light
#   attr_accessor :brightness, :color

#   def inititalize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end

#   def light_status
#     "I have a brightness level of #{brightness} and a color of #{color}"
#   end
# end

# Answer =>
# When naming methods within a class, you should avoid using the class name in the method. This is because it's unneccessary and repetitive. For example with the above code, if we invoked the `light_status` method it is essentially like writing: `my_light.light_status`

# The more appropriate name for the `light_status` method would be to simple change it to `status` like so:

class Light
  attr_accessor :brightness, :color

  def inititalize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end
end
