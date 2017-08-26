require_relative 'direction'
require_relative 'position'

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

    # PLACE
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

    # LEFT
    if left.match?(command)
      # Turn left and update the robots direction
      robot.position.f = Direction.new.turn_left(robot.position.f)

      robot.update_robot(robot.position)

      puts "New position #{robot.position.x},#{robot.position.y},#{robot.position.f}"
    end

    # RIGHT
    if right.match?(command)
      # Turn right and update the robots direction
      robot.position.f = Direction.new.turn_right(robot.position.f)

      robot.update_robot(robot.position)

      puts "New position #{robot.position.x},#{robot.position.y},#{robot.position.f}"
    end

    # MOVE
    if move.match?(command)
      case robot.position.f
      when 'NORTH'
        robot.position.y += 1
      when 'EAST'
        robot.position.x += 1
      when 'SOUTH'
        robot.position.y -= 1
      when 'WEST'
        robot.position.x -= 1
      end

      robot.update_robot(robot.position)
      puts "New position #{robot.position.x},#{robot.position.y},#{robot.position.f}"
    end

    puts 'reporting' if report.match?(command)
  end
end
