class Enemy

  # get instance vars
  attr_reader :x, :y, :radius

  def initialize(window)
    @radius = 20
    # random x
    # maybe make the sidebar a var
    @x = rand(window.width - 50 - 2 * @radius) + @radius
    @y = 0
    @speed = rand(2.0..5.0)
    @image = Gosu::Image.new("images/enemy.png")
  end

  def move
    @y += @speed
  end

  def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end

end
