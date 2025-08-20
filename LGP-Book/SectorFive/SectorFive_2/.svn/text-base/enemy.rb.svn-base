
#START:init
#START:speed
class Enemy
#END:init
#START_HIGHLIGHT
  SPEED = 4
#END_HIGHLIGHT
#START:init
  def initialize(window)
    @radius = 20
    @x = rand(window.width - 2 * @radius) + @radius
    @y = 0
    @image = Gosu::Image.new('images/enemy.png') 
  end
#END:speed
#END:init
#START:draw
  def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end
#END:draw
#START:move
  def move
    @y += SPEED
  end
#END:move
#START:init
end
#END:init