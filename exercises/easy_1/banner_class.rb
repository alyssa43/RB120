class Banner
  MAX_WIDTH = 80

  def initialize(message, width=0)
    @message = message
    @width = (width < @message.size) || (width > MAX_WIDTH) ? @message.size : width - 4
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + ("-" * @width) + "-+"
  end

  def empty_line
      "| " + (" " * @width) + " |"
  end

  def message_line
    spaces = " " * ((@width - @message.size) / 2)
    "| #{spaces}#{@message}#{spaces} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 90)
puts banner


banner = Banner.new('', 10)
puts banner

