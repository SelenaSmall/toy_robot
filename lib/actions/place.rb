class Place
  attr_reader :robot, :table

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def perform(command)
    _command, x, y, f = command.tr(',', ' ').split

    position = Position.new(x.to_i, y.to_i, f)

    robot.update_robot(position) if table.valid_position?(position.x, position.y)
  end
end
