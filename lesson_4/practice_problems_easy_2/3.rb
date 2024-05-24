# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the lookup chain for `Orange` and `HotSauce`

# => You can find the method lookup path by searching the ancestors of a specific class. You do this by invoking the `#ancestors` on the class of which you wish to find the method lookup path. For example, to find the method lookup chain for `Orange` we do:

Orange.ancestors # => [Orange, Taste, Object, Kernel, BasicObject]

# And, to find the method lookup chain for `HotSauce` we do:

HotSauce.ancestors # => [HotSauce, Taste, Object, Kernel, BasicObject]
