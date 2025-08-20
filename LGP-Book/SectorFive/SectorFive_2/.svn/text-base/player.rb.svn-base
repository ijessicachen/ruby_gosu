#SectorFive_2
#START:player_start
#START:rotation_speed
#START:acceleration
class Player
  ROTATION_SPEED = 3
#END:rotation_speed
#START_HIGHLIGHT
  ACCELERATION = 2
  FRICTION = 0.9
#END_HIGHLIGHT
#END:acceleration
#START:window
  def initialize(window)
    @x = 200
    @y = 200 
    @angle = 0
    @image = Gosu::Image.new('images/ship.png')
    @velocity_x = 0
    @velocity_y = 0
#START_HIGHLIGHT
    @radius = 20
    @window = window
#END_HIGHLIGHT
  end
#END:window
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
#START:turn_methods
  def turn_right
    @angle += ROTATION_SPEED
  end

  def turn_left
    @angle -= ROTATION_SPEED
  end
#END:turn_methods
#START:accelerate
  def accelerate
#START_HIGHLIGHT
    @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
    @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
#END_HIGHLIGHT
  end
  #END:accelerate
  #START:friction
  #START:move
  def move
    @x += @velocity_x
    @y += @velocity_y
  #END:move
  #START_HIGHLIGHT
  #START:move
    @velocity_x *= FRICTION
    @velocity_y *= FRICTION
  #END:move
  #END_HIGHLIGHT
  #END:friction
#START:move
#START_HIGHLIGHT
    if @x > @window.width - @radius
      @velocity_x = 0
      @x = @window.width - @radius
    end
    if @x < @radius
      @velocity_x = 0
      @x = @radius
    end
    if @y > @window.height - @radius
      @velocity_y = 0
      @y = @window.height - @radius
    end
#END_HIGHLIGHT

#START:friction
  end
#END:friction
#END:move
end
