#START:empty_class
#START:speed
#START:initialize
#START:attr_reader
class Bullet
#END:initialize
#END:speed
#END:empty_class
#END:attr_reader
#START:speed
#START_HIGHLIGHT
#START:attr_reader
SPEED = 5
#END:attr_reader
#END_HIGHLIGHT
#END:speed
#START:attr_reader
#START_HIGHLIGHT
attr_reader :x, :y, :radius
#END_HIGHLIGHT
#END:attr_reader
#START:initialize
  def initialize(window, x, y, angle)
    @x = x
    @y = y
    @direction = angle
    @image = Gosu::Image.new('images/bullet.png')
    @radius = 3
    @window = window
  end
#END:initialize
#START:move
def move
    @x += Gosu.offset_x(@direction, SPEED)
    @y += Gosu.offset_y(@direction, SPEED)
end
#END:move
#START:draw
def draw
  @image.draw(@x - @radius, @y - @radius, 1)
end
#END:draw
#START:onscreen
  def onscreen?
    right = @window.width + @radius
    left = -@radius
    top = -@radius
    bottom = @window.height + @radius
    @x > left and @x < right and @y > top and @y < bottom
  end
#END:onscreen
#START:empty_class
#START:initialize
end
#END:initialize
#END:empty_class