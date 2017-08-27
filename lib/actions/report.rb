class Report
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def perform
    message = "Output: #{robot.position.x},#{robot.position.y},#{robot.position.f} \n"
    $stdout.print message
  end
end
