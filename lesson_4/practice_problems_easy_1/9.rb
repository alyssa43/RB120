# If we have the class below, what would you need to call to create a new instance of this class:

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# => Answer
# To create a new instance of the `Bag` class we would need to invoke the `#new` method on the class `Bag` and pass in two arguments. The first argument is to reference the instance variable `@color`, and the second argument is to reference the instance variable `@material`. It would look this so:

Bag.new("browm", "leather")