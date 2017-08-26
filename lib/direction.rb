# Direction
class Direction
  OPTIONS = %w[WEST NORTH EAST SOUTH].freeze

  def turn_right(direction)
    # Return unless the direction exists
    return unless OPTIONS.include?(direction)

    i = OPTIONS.index { |e| e == direction }

    # Find next value in array
    unless direction == OPTIONS.last
      i += 1

      return OPTIONS.fetch(i)
    end

    OPTIONS.first
  end

  def turn_left(direction)
    # Return if unless the direction exists
    return unless OPTIONS.include?(direction)

    i = OPTIONS.index { |e| e == direction }

    # Find next value in array
    unless direction == OPTIONS.first
      i -= 1

      return OPTIONS.fetch(i)
    end

    OPTIONS.last
  end
end
