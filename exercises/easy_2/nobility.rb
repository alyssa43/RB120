module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat 
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  include Walkable
  attr_reader :name

  private

  def gait
    "runs"
  end
end

class Noble < Person
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    title + ' ' + super
  end

  private 

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
p mike.walk # => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk # => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk # => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
p byron.walk # => "Lord Byron struts forward"
