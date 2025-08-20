#START:empty_window
#START:class
require 'gosu'

class WhackARuby < Gosu::Window
#END:class
#START:initialize_1
#START:initialize_image
#START:position
#START:width
#START:velocity
#START:visible_init
#START:hammer_init
#START:hit_init
#START:score_init
  def initialize
    super(800, 600)
    self.caption = 'Whack the Ruby!'
#END:score_init
#END:empty_window
#END:position
#END:width
#END:velocity
#END:visible_init
#END:hammer_init
#END:hit_init
#START_HIGHLIGHT
#START:hit_init
#START:hammer_init
#START:visible_init
#START:velocity
#START:width
#START:position
#START:score_init
    @image = Gosu::Image.new('ruby.png')
#END:score_init
#END:position
#END:width
#END:velocity
#END:visible_init
#END:hammer_init
#END:hit_init
#END_HIGHLIGHT
#START:position
#END:initialize_image
#START_HIGHLIGHT
#START:hit_init
#START:hammer_init
#START:visible_init
#START:velocity
#START:width
#START:score_init
    @x = 200
    @y = 200
#END:score_init
#END:width
#END:velocity
#END:visible_init
#END:hammer_init
#END:hit_init
#END_HIGHLIGHT
#START:width
#END:position
#START_HIGHLIGHT
#START:hit_init
#START:hammer_init
#END:visible_init
#START:velocity
#START:score_init
    @width = 50
    @height = 43
#END:score_init
#END:velocity
#END:visible_init
#END:hammer_init
#END:hit_init
#END_HIGHLIGHT
#END:width
#START:velocity
#START_HIGHLIGHT
#START:hit_init
#START:hammer_init
#START:visible_init
#START:score_init
    @velocity_x = 5
    @velocity_y = 5
#END:score_init
#END:visible_init
#END:hammer_init
#END:hit_init
#END_HIGHLIGHT
#END:velocity
#END:initialize_1
#START:visible_init
#START_HIGHLIGHT
#START:hit_init
#START:hammer_init
#START:score_init
    @visible = 0
#END:score_init
#END:hammer_init
#END:hit_init
#END_HIGHLIGHT
#END:visible_init
#START:hammer_init
#START_HIGHLIGHT
#START:hit_init
#START:score_init
    @hammer_image = Gosu::Image.new('hammer.png')
#END:score_init
#END:hit_init
#END_HIGHLIGHT
#END:hammer_init
#START:hit_init
#START_HIGHLIGHT
#START:score_init
    @hit = 0
#END:score_init
#END_HIGHLIGHT
#END:hit_init
#START:score_init
#START_HIGHLIGHT
    @font = Gosu::Font.new(30)
    @score = 0
#END_HIGHLIGHT
#END:score_init
#START:position
#START:initialize_image
#START:initialize_1
#START:empty_window
#START:width
#START:velocity
#START:visible_init
#START:hammer_init
#START:hit_init
#START:score_init
  end
#END:score_init
#END:hit_init
#END:hammer_init
#END:visible_init
#END:velocity
#END:width
#END:initialize_1
#END:empty_window
#END:position
#END:initialize_image
#START:update_1
#START:update_2
#START:visible_update
#START:time_left
  def update
    @x += @velocity_x
    @y += @velocity_y
#END:time_left
#END:update_1
#END:visible_update
#START_HIGHLIGHT
#START:visible_update
#START:time_left
    @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
    @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0
#END:time_left
#END:visible_update
#END_HIGHLIGHT
#END:update_2
#START:visible_update
#START_HIGHLIGHT
#START:time_left
    @visible -= 1
    @visible = 30 if @visible < -10 && rand < 0.01
#END:time_left
#END_HIGHLIGHT
#END:visible_update
#START:time_left
#START_HIGHLIGHT
    @time_left = (100 - (Gosu.milliseconds / 1000))
#END_HIGHLIGHT
#END:time_left
#START:update_1
#START:update_2
#START:visible_update
#START:time_left
  end
#END:time_left
#END:visible_update
#END:update_1
#END:update_2
#START:button_down
#START:button_down_with_score
  def button_down(id)
    if (id == Gosu::MsLeft)
      if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
        @hit = 1
#END:button_down
#START_HIGHLIGHT
        @score += 5
#END_HIGHLIGHT
#START:button_down
      else
        @hit = -1
#END:button_down
#START_HIGHLIGHT
        @score -= 1
#END_HIGHLIGHT
#START:button_down
      end
    end
  end
#END:button_down
#END:button_down_with_score
  #START:visible_draw
  #START:draw
  #START:hammer_draw
  #START:draw_quad
  #START:score_draw
  #START:time_draw
  def draw
  #END:time_draw
  #END:score_draw
  #END:draw
  #END:hammer_draw
  #END:visible_draw
  
  #START:hammer_draw
  #START:visible_draw
  #START:score_draw
  #START:time_draw
    if @visible > 0
    #START:draw
      @image.draw(@x - @width / 2, @y - @height / 2, 1)
    #END:draw
    end
    #END:time_draw
    #END:score_draw
    #END:visible_draw
    #END:draw_quad
    #START_HIGHLIGHT
    #START:draw_quad
    #START:score_draw
    #START:time_draw
    @hammer_image.draw(mouse_x - 40, mouse_y - 10, 1)
    #END:time_draw
    #END:score_draw
    #END:draw_quad
    #END_HIGHLIGHT
    #END:hammer_draw
    #START:draw_quad
    #START_HIGHLIGHT
  #START:score_draw
  #START:time_draw
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end
    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
    @hit = 0
  #END:time_draw
  #END:score_draw
  #END_HIGHLIGHT
  #END:draw_quad
    #START:score_draw
    #START_HIGHLIGHT
    @font.draw(@score.to_s, 700, 20, 2)
    #END_HIGHLIGHT
    #END:score_draw

    #START:time_draw
    #START_HIGHLIGHT
    @font.draw(@time_left.to_s, 20, 20, 2)
    #END_HIGHLIGHT
    #END:time_draw

  #START:draw
  #START:visible_draw
  #START:hammer_draw
  #START:draw_quad
  #START:score_draw
  #START:time_draw
  end
  #END:time_draw
  #END:score_draw
  #END:draw_quad
  #END:hammer_draw
  #END:draw
  #END:visible_draw
#START:empty_window
#START:class
end
#END:class

window = WhackARuby.new
window.show
#END:empty_window
