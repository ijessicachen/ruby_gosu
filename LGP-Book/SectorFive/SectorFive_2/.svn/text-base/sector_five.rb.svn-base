#SectorFive_2
#START:require
require 'gosu'
require_relative 'player'
#START_HIGHLIGHT
require_relative 'enemy'
#END_HIGHLIGHT
#END:require
#START:initialize
class SectorFive < Gosu::Window
#START_HIGHLIGHT
  WIDTH = 800
  HEIGHT = 600
#END_HIGHLIGHT
#START:enemy_init
  def initialize
#END:enemy_init
#START_HIGHLIGHT
#START:enemy_init
    super(WIDTH,HEIGHT)
#END:enemy_init
#END_HIGHLIGHT
#START:enemy_init
    self.caption = 'Sector Five'
    @player = Player.new(self)
#END:initialize
#START_HIGHLIGHT
    @enemy = Enemy.new(self)
#END_HIGHLIGHT
#START:initialize
  end
#END:enemy_init
#END:initialize
#START:enemy_update
  def update
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)
    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move
    #START_HIGHLIGHT
    @enemy.move
    #END_HIGHLIGHT
  end
 #END:enemy_update
 #START:enemy_draw
  def draw
    @player.draw
#START_HIGHLIGHT
    @enemy.draw
#END_HIGHLIGHT
  end
  #END:enemy_draw
end

window = SectorFive.new
window.show
