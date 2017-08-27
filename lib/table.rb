# Table class
class Table
  attr_reader :x, :y

  def initialize(x = 5, y = 5)
    @x = (0..(x - 1))
    @y = (0..(y - 1))
  end

  # Valid Position method
  # @params position [Object]
  # @return Boolean
  def valid_position?(position)
    @x.cover?(position.x) && @y.cover?(position.y)
  end
end
