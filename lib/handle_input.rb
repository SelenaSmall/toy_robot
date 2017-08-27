require_relative './actions/place'
require_relative './actions/move'
require_relative './actions/turn'
require_relative './actions/report'

# HandleInput class
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
    return Place.new(robot, table).perform(command) if PLACE.match?(command)

    return if robot.not_in_place?

    return Move.new(robot, table).perform if MOVE.match?(command)

    return Turn.new(robot).left if LEFT.match?(command)

    return Turn.new(robot).right if RIGHT.match?(command)

    return Report.new(robot).perform if REPORT.match?(command)

    # TODO: Exception handler
  end
end
