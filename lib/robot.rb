require_relative 'position'

# Robot Class
class Robot
  attr_reader :position

  def intialize
    @position = nil
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
