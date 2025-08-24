# TODO
# - Make WASD work (but you need to figure out
#   what those keys are in Gosu first


require 'gosu'
require_relative 'player'
require_relative 'enemy'

class SectorFive < Gosu::Window

  WIND_W = 800
  WIND_H = 600

  def initialize
    super(WIND_W, WIND_H)
    self.caption = 'Sector Five'
    @player = Player.new(self)
    @enemy = Enemy.new(self)
  end

  def draw
    @player.draw
    @enemy.draw
  end

  def update
    # button_down vs button_down? in md file
    #  under general documentation
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)

    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move

    # move the enemy
    @enemy.move
  end

end

window = SectorFive.new
window.show
