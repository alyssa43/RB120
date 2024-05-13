class Banner
  def initialize(message, *length)
    @message = message
    @banner_size = ((length[0] < @message.size) ? @message.size : (length[0] - 4))
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + ("-" * @banner_size) + "-+"
  end

  def empty_line
      "| " + (" " * @banner_size) + " |"
  end

  def message_line
    spaces = " " * ((@banner_size - @message.size) / 2)
    "| #{spaces}#{@message}#{spaces} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 40)
puts banner


banner = Banner.new('', 10)
puts banner

