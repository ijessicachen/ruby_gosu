#START:empty_window
#START:require_player
require 'gosu'
#END:empty_window
#START_HIGHLIGHT
require_relative 'player'
#END_HIGHLIGHT
#END:require_player
#START:empty_window
class SectorFive < Gosu::Window
#START:player_init
  def initialize
    super(800, 600)
    self.caption = "Sector Five"
#END:empty_window
#START_HIGHLIGHT
    @player = Player.new(self)
#END_HIGHLIGHT

#START:empty_window
  end
#END:empty_window
#END:player_init
#START:update
#START:accelerate
  def update
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)
#END:update
#START_HIGHLIGHT
    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move
#END_HIGHLIGHT

#START:update
  end
#END:accelerate
#END:update
#START:draw
  def draw
    @player.draw
  end
#END:draw
#START:empty_window
end
window = SectorFive.new
window.show
#END:empty_window