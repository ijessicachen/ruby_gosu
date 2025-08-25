# TODO
# - I still feel there should be a way
#   to cap the speed at some point bc
#   this ship goes way too fast
# NOTES

class Player

  # constants
  ROT_SPEED = 5
  ACCEL = 2
  FRIC = 0.9

  # get instance vars
  attr_reader :x, :y, :angle, :radius

  def initialize(window)
    @radius = 20 
    @x = 400
    @y = 570
    @vx = 0
    @vy = 0
    @angle = 0

    @force = false
    @left = false
    @right = false

    @window = window
    @ships = Gosu::Image.load_tiles('images/ships.png', 45, 34)
  end

  def draw

    # different scenarios for how the ship is moving
    # CHECK IF YOU GOT THE DIRECTIONS RIGHT
    
    # weird cases (maybe make this impossible later)
    if @force && @left && @right
      @ships[5].draw_rot(@x, @y, 1, @angle)
    elsif @right && @left
      @ships[5].draw_rot(@x, @y, 1, @angle)

    # move and turn
    elsif @force && @left
      @ships[4].draw_rot(@x, @y, 1, @angle)
    elsif @force && @right
      @ships[3].draw_rot(@x, @y, 1, @angle)

    # turn
    elsif @left
      @ships[2].draw_rot(@x, @y, 1, @angle)
    elsif @right
      @ships[1].draw_rot(@x, @y, 1, @angle)

    # move
    elsif @force
      @ships[0].draw_rot(@x, @y, 1, @angle)

    # still or slowing
    else
      @ships[5].draw_rot(@x, @y, 1, @angle)
    end

    @force = false
    @left = false
    @right = false

  end

  # turn the ship
  def turn_right
    @angle += ROT_SPEED
    @right = true
  end
  def turn_left
    @angle -= ROT_SPEED
    @left = true
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
    @force = true
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
