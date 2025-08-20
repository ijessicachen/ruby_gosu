# TODO
# - Make WASD work (but you need to figure out
#   what those keys are in Gosu first


require 'gosu'
require_relative 'player'

class SectorFive < Gosu::Window

  WIND_W = 800
  WIND_H = 600

  def initialize
    super(WIND_W, WIND_H)
    self.caption = 'Sector Five'
    @player = Player.new(self)
  end

  def draw
    @player.draw
  end

  def update
    # button_down vs button_down? in md file
    #  under general documentation
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)

    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move
  end

end

window = SectorFive.new
window.show
