# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if i called the methods like shown below?

tv = Television.new
tv.manufacturer # => this method call will throw a `NameError` exception because there is not a method called `manufacturer` within the `Television class. We only have the `self.manufacturer` class which is a class method and can only be invoked from the `Television` class itself

tv.model # => This method call will execute the method logic within the `model` method located within the `Television` class

Television.manufacturer # => This method call will execute the method logic within the `self.manufacturer` class method located within the `Television` class

Television.model # => This method call will throw a `NameError` exception because there is not a class method called `self.model` within the `Television` class. When we invoke a method by using the class itself as the caller, we are telling Ruby that we want to invoke a class method, which in this case we haven't defined. 
