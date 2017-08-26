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
    place = /^PLACE\s+\d+\s*,\s*\d+\s*$/
    move = /^MOVE$/
    left = /^LEFT$/
    right = /^RIGHT$/
    report = /^REPORT$/

    if place.match?(command)
      command, x, y = command.tr(',', ' ').split

      position = @robot.place(x.to_i, y.to_i)

      # Only update robot if the position is valid on the table
      robot.update_robot(position) if @table.valid_position?(position.x, position.y)

      puts "CMD: #{command} #{position.x},#{position.y}"

      return "#{command} #{position.x},#{position.y}" unless robot.not_in_place?
          end

    # PLACE is the only valid command unless robot is in place
    return if robot.not_in_place?

    puts 'moving' if move.match?(command)

    puts 'turn left' if left.match?(command)

    puts 'turn right' if right.match?(command)

    puts 'reporting' if report.match?(command)
  end
end
