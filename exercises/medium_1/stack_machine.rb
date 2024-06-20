require 'pry'

class MyCustomError < StandardError
  def initialize(command)
    @token = command
  end

  def to_s
    "Invalid token: #{@token}"
  end

  def empty_stack
    puts "Empty Stack!"
  end
end

class Minilang < MyCustomError
  OPERATIONS = {'ADD' => :+, 'SUB' => :-, 'MULT' => :*, 'DIV' => :/, 'MOD' => :%}
  COMMANDS = ['PUSH', 'POP', 'PRINT']

  def initialize(commands)
    @commands = commands
    @register = 0
    @stack = []
  end

  def eval
    @commands.split.each do |command|
      if !valid_command?(command)
        puts MyCustomError.new(command)
        break
      elsif is_integer?(command)
        place_in_register(command)
      elsif OPERATIONS.keys.include?(command)
        perform_operation(command)
      elsif command == 'PRINT'
        print_register
      elsif command == 'PUSH'
        push_to_stack
      elsif command == 'POP' && @stack.empty?
        empty_stack
        break
      elsif command == 'POP'
        pop_from_stack
      end
    end
  end

  private

  def print_register
    puts @register
  end

  def push_to_stack
    @stack.push(@register)
  end

  def pop_from_stack
    @register = @stack.pop
  end

  def perform_operation(operation)
    @register = [@register, @stack.pop].inject(OPERATIONS[operation])
  end

  def place_in_register(value)
    @register = value.to_i
  end

  def valid_command?(command)
    is_integer?(command) || OPERATIONS.keys.include?(command) || COMMANDS.include?(command)
  end

  def is_integer?(string)
    string.to_i.to_s == string
  end
end

Minilang.new('PRINT').eval
# 0
puts ""

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15
puts ""

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8
puts ""

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5
puts ""

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!
puts ""

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6
puts ""

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12
puts ""

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB
puts ""

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8
puts ""

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
puts ""

# given a string of commands:
# if integer => place value of integer in the @register (DO NOT MODIFY STACK)
# if OPERATION => POP value from stack and perform operation, store result in @register
# if PUSH => push the @register value onto the stack, leave the value in @register
# if POP => remove the topmost item from @stack and place in @register
# if PRINT => Print the @register value