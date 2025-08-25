# TODO
# - Make WASD work (but you need to figure out
#   what those keys are in Gosu first
# - make the game end if enough enemy ships hit
#   your side
# - make you die if you hit an enemy ship or you
#   go to their side
# - make explosions kill enemies
# - make enemies fall at different speeds
# - have enemies shoot at the player, preferably
#   use the same class but make the bullets look
#   different so it isn't too confusing
# NOTES
# - a cool mechanic to add would be to have a 
#   gas level and/or heat level to prevent
#   spamming accel or turning if that becomes
#   a problem


require 'gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'
require_relative 'explosion'

class SectorFive < Gosu::Window

  WIND_W = 800
  WIND_H = 600
  # chance of an enemy appearing
  ENEM_FREQ = 0.01 

  def initialize
    super(WIND_W, WIND_H)
    self.caption = 'Sector Five'
    @player = Player.new(self)
    @enemies = []
    @bullets = []
    @explosions = []
  end

  def button_down(id)
    # bullet appears at each click of
    #  the space bar
    if id == Gosu::KbSpace
      @bullets.push Bullet.new(self, @player.x, @player.y, @player.angle)
    end
  end

  def draw
    @player.draw
    @enemies.each do |enemy|
      enemy.draw
    end
    @bullets.each do |bullet|
      bullet.draw
    end
    @explosions.each do |explosion|
      explosion.draw
    end
  end

  def update

    # button_down vs button_down? in md file
    #  under general documentation
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)

    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move

    # if an enemy appears
    if rand < ENEM_FREQ
      @enemies.push Enemy.new(self)
    end
    # move enemies
    @enemies.each do |enemy|
      enemy.move
    end

    # move bullets
    @bullets.each do |bullet|
      bullet.move
    end

    # check for collisions
    @enemies.dup.each do |enemy|
      @bullets.dup.each do |bullet|

        # we are comparing the centres
        distance = Gosu.distance(enemy.x, enemy.y, bullet.x, bullet.y)
        if distance < enemy.radius + bullet.radius
          @enemies.delete(enemy)
          @bullets.delete(bullet)
          @explosions.push(Explosion.new(self, enemy.x, enemy.y))
        end

      end
    end

    # remove if out of frame/event is over
    # (should use dupes which is why these
    #  are new loops)
    @enemies.dup.each do |enemy|
      # remove if out of frame
      if enemy.y-enemy.radius > 600
        @enemies.delete(enemy)
      end
    end
    @bullets.dup.each do |bullet|
      # remove it if out of frame
      if bullet.y+bullet.radius < 0 || bullet.x-bullet.radius > 800 || bullet.x+bullet.radius < 0 || bullet.y-bullet.radius > 600
        @bullets.delete(bullet)
      end
    end
    @explosions.dup.each do |explosion|
      if explosion.finished
        @explosions.delete(explosion)
      end
    end
    
  end

end

window = SectorFive.new
window.show
