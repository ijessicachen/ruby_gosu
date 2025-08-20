class Player

  ROTATION_SPEED = 3
  ACCELERATION = 2
  FRICTION = 0.9

  attr_reader :x, :y, :angle, :radius

  def initialize(window)
    @x = 200
    @y = 200 
    @angle = 0
    @image = Gosu::Image.new('images/ship.png')
    @velocity_x = 0
    @velocity_y = 0
    @radius = 20
    @window = window
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
#START:rotate
  def turn_right
    @angle += ROTATION_SPEED
  end

  def turn_left
    @angle -= ROTATION_SPEED
  end
#END:rotate
#START:accelerate
  def accelerate
    @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
    @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
  end
#END:accelerate
#START:move
  def move
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= FRICTION
    @velocity_y *= FRICTION
    if @x > @window.width - @radius
      @vx = 0
      @x = @window.width - @radius
    end
    if @x < @radius
      @vx = 0
      @x = @radius
    end
    if @y > @window.height - @radius
      @vy = 0
      @y = @window.height - @radius
    end
  end
end