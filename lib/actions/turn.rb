class Turn
  attr_reader :robot

  OPTIONS = %w[WEST NORTH EAST SOUTH].freeze

  def initialize(robot)
    @robot = robot
  end

  def left
    robot.position.f = prev_option(robot.position.f)

    robot.update_robot(robot.position)
  end

  def right
    robot.position.f = next_option(robot.position.f)

    robot.update_robot(robot.position)
  end

  private

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
