# Direction
class Direction
  def initialize
    @options_array = %w[WEST NORTH EAST SOUTH]
  end

  def turn_right(direction)
    # Return if unless the direction exists
    return unless @options_array.include?(direction)

    i = @options_array.index { |e| e == direction }

    # Find next value in array
    unless direction == @options_array.last
      i += 1

      return @options_array.fetch(i)
    end

    @options_array.first
  end
end
