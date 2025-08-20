# TODO
#


class Player

  # constants
  ROT_SPEED = 3
  ACCEL = 2
  FRIC = 0.9

  def initialize(window)
    @x = 200
    @y = 200
    @vx = 0
    @vy = 0
    @angle = 0
    @radius = 20 

    @window = window
    @image = Gosu::Image.new('images/ship.png')
  end

  def draw
    # scale it down
    @image.draw_rot(@x, @y, 1, @angle)
  end

  # turn the ship
  def turn_right
    @angle += ROT_SPEED
  end
  def turn_left
    @angle -= ROT_SPEED
  end

  # accelerate
  def accelerate 
    # the offset methods help do the trig
    #  to figure out the x and y 
    #  components
    # I want to cap the velocity bc it
    #  ends up going way too fast but that
    #  just makes the pathing look wonky
    @vx += Gosu.offset_x(@angle, ACCEL)
    @vy += Gosu.offset_y(@angle, ACCEL)
  end

  # move
  def move
    @x += @vx
    @y += @vy

    # slows down like friction,
    #  pretending there's resistance in space
    @vx *= FRIC 
    @vy *= FRIC 

    # cannot go off screen sides or bottom
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
