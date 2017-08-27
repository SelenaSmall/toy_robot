require_relative 'position'

# Robot class
class Robot
  attr_reader :position

  def intialize
    @position = nil
  end

  # Update Robot method
  # @param new_position [Object]
  # @return Position
  def update_robot(new_position)
    @position = new_position
  end

  # Not In Place method
  # @return Boolean
  def not_in_place?
    @position.nil?
  end
end
