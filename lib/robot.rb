require_relative 'position'

# Robot
class Robot
  attr_reader :position

  def intialize
    @position = nil
  end

  def place(command)
    _command, x, y, f = command.tr(',', ' ').split

    Position.new(x.to_i, y.to_i, f)
  end

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

  def left(position)
    Position.new(position.x, position.y, prev_option(position.f))
  end

  def right(position)
    Position.new(position.x, position.y, next_option(position.f))
  end

  def report(position)
    message = "Output: #{position.x},#{position.y},#{position.f} \n"
    $stdout.print message
  end

  def update_robot(new_position)
    @position = new_position
  end

  def not_in_place?
    @position.nil?
  end

  private

  OPTIONS = %w[WEST NORTH EAST SOUTH].freeze

  def prev_option(direction)
    return unless OPTIONS.include?(direction)

    return OPTIONS.last if direction == OPTIONS.first

    i = OPTIONS.index { |e| e == direction }
    i -= 1

    OPTIONS.fetch(i)
  end

  def next_option(direction)
    return unless OPTIONS.include?(direction)

    return OPTIONS.first if direction == OPTIONS.last

    i = OPTIONS.index { |e| e == direction }
    i += 1

    OPTIONS.fetch(i)
  end
end
