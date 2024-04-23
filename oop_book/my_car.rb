class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c 
    @model = m 
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
    current_speed
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
    current_speed
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
    current_speed
  end

  def spray_paint(color)
    self.color = color
    puts "Painting you car #{self.color}"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} mpg"
  end

  def to_s 
    "This car is a #{year} #{color} #{@model}."
  end
end

alyssa_car = MyCar.new(2015, "white", "suburban")
# puts alyssa_car.color
# puts alyssa_car.year
# alyssa_car.spray_paint("black")
# puts alyssa_car.color

# MyCar.gas_mileage(13, 351)

puts alyssa_car