class Bullet
  SPEED = 5
  # get instance vars
  attr_reader :x, :y, :radius

  def initialize(window, x, y, angle)
    @x = x
    @y = y
    @direction = angle
    @image = Gosu::Image.new('images/bullet.png')
    @radius = 3
    @window = window
  end

  def move
    @x += Gosu.offset_x(@direction, SPEED)
    @y += Gosu.offset_y(@direction, SPEED)
  end

  def draw
    # can change colour for when you do enemy bullets?
    col = 0xffffffff
    @image.draw_mod(@x - @radius, @y - @radius, 0, 1, 1, col, col, col, col)
  end

end
