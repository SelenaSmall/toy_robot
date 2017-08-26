# Direction
class Direction
  attr_reader :start_direction

  def initialize(start_direction)
    @start_direction = start_direction

    @directions_array = %w[WEST NORTH EAST SOUTH]
  end

  def turn_right(current_direction)
    puts 'turn right'

    # does the current direction exist?
    return unless @directions_array.include?(current_direction)

    i = @directions_array.index { |e| e == current_direction }

    unless current_direction == @directions_array.last
      i += 1

      new_direction = @directions_array.fetch(i)
      puts "New Direction: #{new_direction}"

      return new_direction
    end

    puts "New Direction: #{@directions_array.first}"
  end
end

direction = Direction.new('NORTH')

puts "Starting at #{direction.start_direction}"
current_direction = direction.start_direction

direction.turn_right(current_direction)
