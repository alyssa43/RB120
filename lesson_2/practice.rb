class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    @first_name, @last_name = name.split
    @last_name = '' if @last_name == nil
  end

  def name
    @first_name + ' ' + @last_name
  end

  def name=(new_name)
    full_name = new_name.split
    @first_name = full_name[0]
    @last_name = full_name[1] if full_name.size > 1
  end

  def to_s
    name
  end
end

bob = Person.new("Robert")
p bob.name
p bob.first_name
p bob.last_name
bob.last_name = "Smith"
p bob.name

bob.name = "John Adams"
p bob.first_name
p bob.last_name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"