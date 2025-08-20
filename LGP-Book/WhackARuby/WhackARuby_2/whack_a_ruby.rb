
require 'gosu'

class WhackARuby < Gosu::Window
#START:playing_init
#START:start_time_init
  def initialize
    super(800,600)
    self.caption = 'Whack the Ruby!'
    @image = Gosu::Image.new('ruby.png')
    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 5
    @velocity_y = 5
    @visible = 0
    @hammer_image = Gosu::Image.new('hammer.png')
    @hit = 0  
    @score = 0
    @font = Gosu::Font.new(30)
#END:start_time_init
#START_HIGHLIGHT
#START:start_time_init
    @playing = true
#END:start_time_init
#END_HIGHLIGHT
#END:playing_init
  #START:start_time_init
  #START_HIGHLIGHT
    @start_time = 0
  #END_HIGHLIGHT
  
#START:playing_init
  end
#END:start_time_init
#END:playing_init
#START:update
  def update
#START_HIGHLIGHT
    if @playing 
#END_HIGHLIGHT
      @x += @velocity_x
      @y += @velocity_y
      @visible -= 1
      @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
      @velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height / 2 < 0
      @visible = 30 if @visible < -10 && rand < 0.01
      @time_left = (100 - ((Gosu.milliseconds - @start_time) / 1000))
#START_HIGHLIGHT
      @playing = false if @time_left < 0
    end
#END_HIGHLIGHT
  end
#END:update
#START:button_down
  def button_down(id)
#START_HIGHLIGHT
    if @playing
#END_HIGHLIGHT
      if id == Gosu::MsLeft
        if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
          @hit = 1
          @score += 5
        else
          @hit = -1
          @score -= 1
        end
      end
#END:button_down
    else
      if id == Gosu::KbSpace
        @playing = true
        @visible = -10
        @start_time = Gosu.milliseconds
        @score = 0
      end
#START:button_down
#START_HIGHLIGHT
    end
#END_HIGHLIGHT
  end
#END:button_down
#START:game_over
#START:game_over_2
  def draw
    if @visible > 0
      @image.draw(@x - @width / 2, @y - @height / 2, 1)
    end
    @hammer_image.draw(mouse_x - 40, mouse_y - 10, 1)
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end
    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
    @hit = 0
    @font.draw(@time_left.to_s, 20, 20, 2)
    @font.draw(@score.to_s, 700, 20, 2)
#END:game_over_2
#START_HIGHLIGHT
#START:game_over_2
    unless @playing
      @font.draw('Game Over', 300, 300, 3)
#END:game_over_2
#END_HIGHLIGHT
#END:game_over
#START:game_over_2
#START_HIGHLIGHT
      @font.draw('Press the Space Bar to Play Again', 175, 350, 3)
#END_HIGHLIGHT
#END:game_over_2
#START:game_over
#START_HIGHLIGHT
#START:game_over_2
      @visible = 20
#END:game_over_2
    end
#END_HIGHLIGHT
#START:game_over_2
  end
#END:game_over
#END:game_over_2
#START:empty_window
end

window = WhackARuby.new
window.show
#END:empty_window