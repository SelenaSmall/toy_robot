# Table Class
class Table
  attr_reader :x, :y

  def initialize(x = 5, y = 5)
    @x = (0..(x - 1))
    @y = (0..(y - 1))
  end

  # Validate x & y axis are within 5x5 area
  def valid_position?(x, y)
    @x.cover?(x) && @y.cover?(y)
  end
end
