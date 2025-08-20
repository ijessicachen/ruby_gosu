#START:player_start
class Player
#START:v_init
  def initialize(window)
    @x = 200
    @y = 200 
    @angle = 0
    @image = Gosu::Image.new('images/ship.png')
#END:player_start
#START_HIGHLIGHT
    @velocity_x = 0
    @velocity_y = 0
#END_HIGHLIGHT

#START:player_start
  end
#END:v_init
#END:player_start
#START:draw
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
#END:draw
#START:rotate
  def turn_right
    @angle += 3
  end
  def turn_left
    @angle -= 3
  end
#END:rotate
#START:accelerate
  def accelerate
    @velocity_x += Gosu.offset_x(@angle, 2)
    @velocity_y += Gosu.offset_y(@angle, 2)
  end
#END:accelerate
#START:move
  def move
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= 0.9
    @velocity_y *= 0.9
  end
  #END:move
  #START:player_start
end
#END:player_start