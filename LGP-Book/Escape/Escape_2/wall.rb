class Wall
  def initialize(window, x, y, width, height)
  	space = window.space
  	@x = x
  	@y = y
    @width = width
    @height = height
  	@body = CP::Body.new_static()
  	@body.p = CP::Vec2.new(x,y)
  	@bounds = [CP::Vec2.new(-width / 2, -height / 2),
               CP::Vec2.new(-width / 2, height / 2),
               CP::Vec2.new(width / 2, height / 2),
               CP::Vec2.new(width / 2, -height / 2)]
  	@shape = CP::Shape::Poly.new(@body, @bounds, CP::Vec2.new(0, 0))
    @shape.u = 0.7
    @shape.e = 0.2
    space.add_shape(@shape)
  end
end