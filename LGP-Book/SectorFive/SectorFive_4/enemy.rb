
#START:init
class Enemy
#END:init
#START:speed
  SPEED = 4
#END:speed
  attr_reader :x, :y, :radius
#START:init
  def initialize(window)
    @y = 0
    @image = Gosu::Image.new('images/enemy.png')
    @radius = 20
    @x = rand(window.width - 2 * @radius) + @radius
  end
#END:init
#START:draw
  def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end
#END:draw
  def move
    @y += SPEED
  end
#START:init
end
#END:init