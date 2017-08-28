# Action class
class Action
  # Place method
  # @param command [String]
  # @return Position
  def place(command)
    _command, x, y, f = command.tr(',', ' ').split

    Position.new(x.to_i, y.to_i, f)
  end

  # Move method
  # @param position [Object]
  # @return Position
  def move(position)
    y = position.y
    x = position.x
    f = position.f

    y += 1 if f.match?('NORTH')
    x += 1 if f.match?('EAST')
    y -= 1 if f.match?('SOUTH')
    x -= 1 if f.match?('WEST')

    Position.new(x, y, f)
  end

  # Left method
  # @param position [Object]
  # @return Position
  def left(position)
    Position.new(position.x, position.y, prev_option(position.f))
  end

  # Right method
  # @param position [Object]
  # @return Position
  def right(position)
    Position.new(position.x, position.y, next_option(position.f))
  end

  # Return method
  # @param position [Object]
  # @return nil
  def report(position)
    message = "Output: #{position.x},#{position.y},#{position.f} \n"
    $stdout.print message

    position
  end

  private

  OPTIONS = %w[WEST NORTH EAST SOUTH].freeze

  # Prev option method
  # Find previous value in the options array
  # @param direction [String]
  # @param options [Array]
  # @return previous direction
  def prev_option(direction)
    return unless OPTIONS.include?(direction)

    return OPTIONS.last if direction == OPTIONS.first

    i = OPTIONS.index { |e| e == direction }
    i -= 1

    OPTIONS.fetch(i)
  end

  # Next option method
  # Find next value in the options array
  # @param direction [String]
  # @param options [Array]
  # @return next direction
  def next_option(direction)
    return unless OPTIONS.include?(direction)

    return OPTIONS.first if direction == OPTIONS.last

    i = OPTIONS.index { |e| e == direction }
    i += 1

    OPTIONS.fetch(i)
  end
end
