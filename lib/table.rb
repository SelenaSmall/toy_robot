# Table Class
class Table
  def initialize(x = 5, y = 5)
    @x = x
    @y = y
  end

  # Validate x & y axis are within 5x5 area
  def valid_position?(x, y)
    valid_x?(x) && valid_y?(y)
  end

  private

  def valid_x?(x)
    x >= 0 && x <= @x - 1
  end

  def valid_y?(y)
    y >= 0 && y <= @y - 1
  end
end
