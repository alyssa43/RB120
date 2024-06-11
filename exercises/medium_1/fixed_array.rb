class FixedArray
  attr_reader :array

  def initialize(array_length)
    @array = [nil] * array_length
  end

  def [](index)
    if valid_index?(index)
      @array[index]
    else
      IndexError
    end
  end

  def []=(index, new_value)
    @array[index] = new_value
  end

  def to_a
    @array
  end

  def to_s
    @array.to_s
  end

  def valid_index?(index)
    index < @array.length 
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

puts fixed_array[6]

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end