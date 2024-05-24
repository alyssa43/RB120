# What is the default return value of `to_s` when invoked on an object? Where could you go to find out if you want to be sure?

# Answer =>
# The default return value of invoking the `#to_s` method on an object is a string representing the calling object. It prints the calling object's class and an encoding of the object id. You can find this out by going to the `Object#to_s` Ruby docs.
