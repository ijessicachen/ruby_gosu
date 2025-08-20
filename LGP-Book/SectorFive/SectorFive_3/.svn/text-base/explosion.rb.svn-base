#START:class
#START:attr_reader
class Explosion
#END:class
#START_HIGHLIGHT
  attr_reader :finished
#END_HIGHLIGHT
#END:attr_reader
#START:initialize
  def initialize(window, x, y)
    @x = x
    @y = y
    @radius = 30
    @images = Gosu::Image.load_tiles('images/explosions.png', 60, 60)
    @image_index = 0
    @finished = false
  end
#END:initialize
#START:draw
  def draw
    if @image_index < @images.count
      @images[@image_index].draw(@x - @radius, @y - @radius, 2)
      @image_index += 1
    else
      @finished = true
    end
  end
#END:draw
#START:class
end
#END:class
