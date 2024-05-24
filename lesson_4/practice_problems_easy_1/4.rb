# If we have a class `AngryCat` how do we create a new instance of this class?

# The `AngryCat` class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# Answer =>
# We can create a new instance of a class by instantiating a new object. We do this by invoking the `#new` method on the class we are wanting to instantiate. In this case that would mean invoking the `#new` method on the class `AngryCat`. And, depending on how the class is defined, you may or may not have to pass in an argument (however, in this case we do not). This would look like:

AngryCat.new