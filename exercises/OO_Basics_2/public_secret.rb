class Person
  attr_accessor :secret
end

# OR

# class Person
#   attr_reader :secret
#   attr_writer :secret
# end

# OR

# class Person
#   def initialize
#   end

#   def secret
#     @secret
#   end

#   def secret=(secret)
#     @secret = secret
#   end
# end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret