require_relative 'action'

# HandleInput class
class HandleInput
  attr_accessor :robot, :table, :action

  # Command Options
  PLACE   = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/
  MOVE    = /^MOVE$/
  LEFT    = /^LEFT$/
  RIGHT   = /^RIGHT$/
  REPORT  = /^REPORT$/

  def initialize(robot, table, action)
    @robot = robot
    @table = table
    @action = action
  end

  # Interpret method
  # @param command [String]
  # @return Position
  def interpret(command)
    return exec(action.place(command)) if PLACE.match?(command)

    return if robot.not_in_place?

    return exec(action.move(robot.position)) if MOVE.match?(command)

    return exec(action.left(robot.position)) if LEFT.match?(command)

    return exec(action.right(robot.position)) if RIGHT.match?(command)

    return action.report(robot.position) if REPORT.match?(command)
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
