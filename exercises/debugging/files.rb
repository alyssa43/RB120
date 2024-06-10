class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

# The problem here is that the constant is out of scope of the `blog_post` objects scope. Because the constant `FORMAT` is being called on line 19 within the `File` class, it will search lexically. Meaning it will first search within the current `File` class, and because it does not find it there it will then search in the next class up. Because `MarkdownFile` inherits from `File` and not the other way around, it never searches there and therefore is not found.
# We can fix this by referencing the `FORMAT` constant by referncing the class of `self` before `FORMAT`, like so:

"#{name}.#{self.class::FORMAT}"
