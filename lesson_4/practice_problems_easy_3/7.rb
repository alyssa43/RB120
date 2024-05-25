# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialization(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I wasnt to turn on the light with a brightness level of super high and a color of green"
  end
end

# Answer =>
# Within the class method `self.information` we have an explicit `return` of a String that is not neccessary. Because it is the one and only line of code within that method defintion, we can remove the explicit `return` because the String will be returned implicitly as the last (and only) line of code within the method definition.