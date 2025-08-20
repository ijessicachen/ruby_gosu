#START:empty_class
class Bullet
#END:empty_class
#START:initialize
#START:speed
SPEED = 5
#END:speed
  attr_reader :x, :y, :radius
  def initialize(window, x, y, angle)
    @x = x
    @y = y
    @angle = angle
    @image = Gosu::Image.new(window, 'images/bullet.png', false)
    @radius = 3
    @window = window
  end
#END:initialize

  def move
    @x += Gosu.offset_x(@angle, SPEED)
    @y += Gosu.offset_y(@angle, SPEED)
  end

  def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end

  def onscreen?
    right = @window.width + @radius
    left = -@radius
    top = -@radius
    bottom = @window.height + @radius
    @x > left and @x < right and @y > top and @y < bottom
  end
#START:empty_class
end
#END:empty_class