# TODO
# NOTES
# - transitions are not the smoothest
#   but they're good enough for me

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

    @force = 0
    @left = 0
    @right = 0

    @window = window
    @image = Gosu::Image.new('images/ship.png')
    @image_m = Gosu::Image.new('images/move-ship.png')
    @image_l = Gosu::Image.new('images/left-ship.png')
    @image_r = Gosu::Image.new('images/right-ship.png')
    @image_ml = Gosu::Image.new('images/move-left-ship.png')
    @image_mr = Gosu::Image.new('images/move-right-ship.png')
  end

  def draw

    # different scenarios for how the ship is moving
    # CHECK IF YOU GOT THE DIRECTIONS RIGHT
    
    # weird cases (maybe make this impossible later)
    if @force == 1 && @left == 1 && @right == 1
      @image.draw_rot(@x, @y, 1, @angle)
    elsif @right == 1 && @left == 1
      @image.draw_rot(@x, @y, 1, @angle)

    # move and turn
    elsif @force == 1 && @left == 1
      @image_ml.draw_rot(@x, @y, 1, @angle)
    elsif @force == 1 && @right == 1
      @image_mr.draw_rot(@x, @y, 1, @angle)

    # turn
    elsif @left == 1
      @image_l.draw_rot(@x, @y, 1, @angle)
    elsif @right == 1
      @image_r.draw_rot(@x, @y, 1, @angle)

    # move
    elsif @force == 1
      @image_m.draw_rot(@x, @y, 1, @angle)

    # still or slowing
    else
      @image.draw_rot(@x, @y, 1, @angle)
    end

    @force = 0
    @left = 0
    @right = 0

  end

  # turn the ship
  def turn_right
    @angle += ROT_SPEED
    @right = 1
  end
  def turn_left
    @angle -= ROT_SPEED
    @left = 1
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
    @force = 1
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
