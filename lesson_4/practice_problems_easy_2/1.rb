# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end
  
  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# Answer =>
# This code will return a String that says "You will " concatenated with one of the strings from the array within the `choices` method definition. Because we invoked the `Array#sample` method on the `choices` method (and because the `choices` method returns an Array), we will get a random element from the calling Array. Meaning we will get one of three possible strings:
# => "You will eat a nice lunch" 
# => "You wil take a nap soon"
# => "You will stay at work late"