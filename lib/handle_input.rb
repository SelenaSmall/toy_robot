# HandleInput
class HandleInput
  attr_accessor :robot, :table

  # Command Options
  PLACE = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/
  MOVE = /^MOVE$/
  LEFT = /^LEFT$/
  RIGHT = /^RIGHT$/
  REPORT = /^REPORT$/

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # Interpret user Command
  def interpret(command)
    return exec(robot.place(command)) if PLACE.match?(command)

    return if robot.not_in_place?

    return exec(robot.move(robot.position)) if MOVE.match?(command)

    return exec(robot.left(robot.position)) if LEFT.match?(command)

    return exec(robot.right(robot.position)) if RIGHT.match?(command)

    return robot.report(robot.position) if REPORT.match?(command)

    # TODO: Exception handler
  end

  # Update robot position if it's valid
  def exec(position)
    return unless table.valid_position?(position)

    robot.update_robot(position)
  end
end
