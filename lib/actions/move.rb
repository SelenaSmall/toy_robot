class Move
  attr_reader :robot, :table

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def perform
    case robot.position.f
    when 'NORTH'
      y = robot.position.y
      y += 1
      position = Position.new(robot.position.x, y, robot.position.f)

      robot.update_robot(position) if table.valid_position?(robot.position.x, position.y)
    when 'EAST'
      x = robot.position.x
      x += 1

      position = Position.new(x, robot.position.y, robot.position.f)

      robot.update_robot(position) if table.valid_position?(position.x, robot.position.y)
    when 'SOUTH'
      y = robot.position.y
      y -= 1
      position = Position.new(robot.position.x, y, robot.position.f)

      robot.update_robot(position) if table.valid_position?(robot.position.x, position.y)
    when 'WEST'
      x = robot.position.x
      x -= 1

      position = Position.new(x, robot.position.y, robot.position.f)

      robot.update_robot(position) if table.valid_position?(position.x, robot.position.y)
    end
  end
end
