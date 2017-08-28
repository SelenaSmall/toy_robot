require_relative 'action'

# HandleInput class
class HandleInput
  attr_accessor :robot, :table, :action

  # Command Options
  PLACE   = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/
  ACTIONS = %w[MOVE LEFT RIGHT REPORT].freeze

  def initialize(robot, table, action)
    @robot = robot
    @table = table
    @action = action
  end

  # Interpret method
  # @param command [String]
  # @return Position
  def interpret(command)
    return unless command.match(PLACE) || ACTIONS.include?(command)

    return exec(action.place(command)) if command.match?(PLACE)
    return if robot.not_in_place?

    exec(next_position(robot.position, command))
  end

  private

  # Next position method
  # Find the robot's next position if an action was to be performed
  # @param position [Object]
  # @param command [String]
  # @return Position
  def next_position(position, command)
    action.public_send ACTIONS.detect { |e| e == command }.downcase, position
  end

  # Exec method
  # Update robot position if it's valid
  # @param position [Object]
  # @return Position
  def exec(position)
    return unless table.valid_position?(position)

    robot.update_robot(position)
  end
end
