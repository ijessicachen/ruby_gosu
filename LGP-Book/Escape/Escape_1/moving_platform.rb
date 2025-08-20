#START:init
class MovingPlatform
  FRICTION = 0.7
  ELASTICITY = 0.8
  SPEED_LIMIT = 40
  attr_reader :body,:width,:height
#START:direction
#START:shape
  def initialize(window, x, y, range, direction)
    space = window.space
    @window = window
    @x_center = x
    @y_center = y
    @direction = direction
    @range = range
    @body = CP::Body.new(50000, 100.0 / 0)
    @width = 96
    @height = 16
    @body.v_limit = SPEED_LIMIT
    #END:shape
  #END:init
  #START_HIGHLIGHT
  #START:shape
    if @direction == :horizontal
      @body.p = CP::Vec2.new(x + range + 100, y)
      @move = :right
    else
      @body.p = CP::Vec2.new(x, y + range + 100)
      @move = :down
    end
  #END:shape
  #END_HIGHLIGHT
  #END:direction
  #START:shape
  #START_HIGHLIGHT
    bounds = [CP::Vec2.new(-48, -8), 
               CP::Vec2.new(-48, 8), 
               CP::Vec2.new(48, 8), 
               CP::Vec2.new(48, -8)]
    shape = CP::Shape::Poly.new(@body, bounds, CP::Vec2.new(0, 0))
    shape.u = FRICTION
    shape.e = ELASTICITY
    space.add_body(@body)
    space.add_shape(shape)
    @image = Gosu::Image.new('images/platform.png')
    @body.apply_force(CP::Vec2.new(0, -20000000), CP::Vec2.new(0, 0))
  #END_HIGHLIGHT
#START:init
#START:direction
  end
#END:direction
#END:shape
#END:init
#START:draw
  def draw
    @image.draw_rot(@body.p.x, @body.p.y , 0, 1)
  end
#END:draw
#START:move_horizontal_right
#START:move_horizontal_left
#START:move_vertical_down
  def move
    case @direction
    when :horizontal
      if @body.p.x > @x_center + @range && @move == :right
        @body.reset_forces
        @body.apply_force(CP::Vec2.new(0, -20000000), CP::Vec2.new(0, 0))
        @body.apply_force(CP::Vec2.new(-20000000, 0), CP::Vec2.new(0, 0))
        @move = :left
  #END:move_horizontal_right
  #END:move_vertical_down
  #START_HIGHLIGHT
  #START:move_vertical_down
      elsif @body.p.x < @x_center - @range && @move == :left
        @body.reset_forces
        @body.apply_force(CP::Vec2.new(0, -20000000), CP::Vec2.new(0, 0))
        @body.apply_force(CP::Vec2.new(20000000, 0), CP::Vec2.new(0, 0))
        @move = :right
  #START:move_horizontal_right
      end
  #END:move_horizontal_right
      @body.p.y = @y_center
  #END:move_vertical_down
  #END_HIGHLIGHT
  #END:move_horizontal_left
  #START:move_vertical_down
  #START_HIGHLIGHT
  #START:move_vertical_up
    when :vertical
      if @body.p.y > @y_center + @range && @move == :down
        @body.reset_forces
        @body.apply_force(CP::Vec2.new(0, -25000000), CP::Vec2.new(0, 0))
        @move = :up
  #END:move_vertical_up
  #END_HIGHLIGHT
  #END:move_vertical_down
  #START:move_vertical_up
  #START_HIGHLIGHT
      elsif @body.p.y < @y_center - @range && @move == :up
        @body.reset_forces
        @body.apply_force(CP::Vec2.new(0, -15000000), CP::Vec2.new(0, 0))
        @move = :down
      end
      @body.p.x = @x_center
  #END_HIGHLIGHT
      #START:move_vertical_down
    end
    #END:move_vertical_up
    #START:move_horizontal_left
   #START:move_horizontal_right
  end
  #END:move_vertical_down
  #END:move_horizontal_left
  #END:move_horizontal_right
  #START:init
end
#END:init