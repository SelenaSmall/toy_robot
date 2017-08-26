require_relative 'position'

# Robot Class
class Robot
  attr_reader :position

  def intialize
    @position = nil
  end

  # Place the robot
  def place(command)
    place = /^PLACE\s+\d+\s*,\s*\d+\s*$/

    if place.match?(command)
      command, x, y = command.tr(',', ' ').split

      Position.new(x.to_i, y.to_i)
    end
  end

  # Update the robot's position
  def update_robot(new_position)
    @position = new_position
  end

  # Check the robot has been placed
  def not_in_place?
    @position.nil?
  end
end
