#START:init
class Camera
  attr_reader :x_offset,:y_offset

  def initialize(window, space_height, space_width)
    @window = window
    @space_height = space_height
    @window_height = window.height
    @space_width = space_width
    @window_width = window.width
    @x_offset_max = space_width - @window_width
    @y_offset_max = space_height - @window_height
  end
#END:init
#START:view
  def view
    @window.translate(-@x_offset, -@y_offset) do 
      yield
    end
  end
#END:view
#START:center_on
  def center_on(sprite, right_margin, bottom_margin)
    @x_offset = sprite.x - @window_width + right_margin
    @y_offset = sprite.y - @window_height + bottom_margin
    @x_offset = @x_offset_max if @x_offset > @x_offset_max
    @x_offset = 0 if @x_offset < 0
    @y_offset = @y_offset_max if @y_offset > @y_offset_max
    @y_offset = 0 if @y_offset < 0
  end
#END:center_on
#START:shake
  def shake
    @x_offset += rand(9) - 4
    @y_offset += rand(9) - 4
  end
#END:shake
#START:init
end
#END:init