# create an array to act as circular buffer
# 0 index will be used for oldest element
# 2 index will be used for newest element

# start with an array of all nils
# [nil, nil, nil]
# add first element (1)
# [1, nil, nil]

# add second element (2)
# [1, 2, nil]

# remove and return oldest element
# 1
# [nil, 2, nil]
# shift 2 into 0 index spot
# [2, nil, nil]

# buffer empty [nil, nil, nil]
  # => `put` will replace `nil` at 0 index
  # => `get` will return 0 index object (`nil`)

# buffer full [1, 2, 3]
  # => `put` will replace 0 index object
  # => `get` will return 0 index ojbect (1)

# buffer partially full:
  # [1, nil, nil]
  # [1, 2, nil]

# [1, 2, 3]
# say we want to add `4`
# [4, 2, 3] => this is not what we want
# [2, 3, 4] => this IS what we want
# So if buffer is full we will add object to end of buffer and remove first object from buffer

class CircularBuffer
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
  end

  def put(added_item)
    if full?
      @buffer << added_item
      @buffer.shift
    else
      index = find_empty_spot
      @buffer[index] = added_item
    end
  end

  def get
    @buffer << nil # Keeps buffer size intact
    @buffer.shift
  end

  def to_s
    @buffer.to_s
  end

  private 

  def full?
    @buffer.none?(nil)
  end

  def find_empty_spot
    @buffer.index(nil)
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1


buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil
