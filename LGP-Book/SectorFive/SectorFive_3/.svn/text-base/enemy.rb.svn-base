
#START:attr_reader
class Enemy
  SPEED = 4
  #START_HIGHLIGHT
  attr_reader :x, :y, :radius
  #END_HIGHLIGHT
  #END:attr_reader
  def initialize(window)
    @width = 40
    @height = 33
    @window = window
    @x = rand(@window.width - @width)
    @y = 0
    @image = Gosu::Image.new('images/enemy.png')
    @radius = 20
  end

  def draw
    @image.draw(@x - @width / 2, @y - @height / 2, 1)
  end

  def move
    @y += SPEED
  end
end