# We have an `Oracle` class and a `RoadTrip` class that inherits from the `Oracle` class:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
p trip.predict_the_future

# Answer =>
# This code will return a String that says "You will " concatenated with one of the strings from the array within the `choices` method definition from inside the `RoadTrip` class. Meaning we will get one of three possible strings:
# => "You will visit Vegas" 
# => "You wil fly to Fiji"
# => "You will romp in Rome"
# This happens because, when `choices.sample` is invoked Ruby first checks in the class of the calling object (which in this case is the RoadTrip class) for the `choices` method. If it is not found within that class it will then check in the next class up (which in this case is the superclass `Oracle`).