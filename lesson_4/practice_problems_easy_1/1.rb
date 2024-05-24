# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belond to?
# 1. true
# 2. "hello"
# 3. [1, 2, 3, "happy days"]
# 4. 142

# Answer => 
# All of them are objects. It is commonly said that "everything in Ruby is an object". Although, this is not technically true, most things are objects. Some things that are not objects would be methods, blocks, and if/else statements. To find out what class an object belongs to, we simply invoke the `#class` method on the object in question. The calling object's class will be the return value. Like so:

true.class                    # => TrueClass
"hello".class                 # => String
[1, 2, 3, "happy days"].class # => Array
142.class                     # => Integer