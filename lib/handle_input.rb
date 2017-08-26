# HandleInput class
class HandleInput
  attr_accessor :robot, :table

  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # Interpret user Command
  def interpret(command)
    # Valid command patterns
    # TODO: Add direction to place command
    place = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/
    move = /^MOVE$/
    left = /^LEFT$/
    right = /^RIGHT$/
    report = /^REPORT$/

    if place.match?(command)
      command, x, y, f = command.tr(',', ' ').split

      position = @robot.place(x.to_i, y.to_i, f)

      # Only update robot if the position is valid on the table
      robot.update_robot(position) if @table.valid_position?(position.x, position.y)

      puts "CMD: #{command} #{position.x},#{position.y},#{position.f}"

      puts 'placed!' unless robot.not_in_place?
      return "#{command} #{position.x},#{position.y},#{position.f}" unless robot.not_in_place?
    end

    # PLACE is the only valid command unless robot is in place
    return if robot.not_in_place?

    puts 'moving' if move.match?(command)

    puts 'turn left' if left.match?(command)

    puts 'turn right' if right.match?(command)

    puts 'reporting' if report.match?(command)
  end
end
