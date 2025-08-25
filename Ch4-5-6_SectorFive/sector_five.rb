# TODO
# - Make WASD work (but you need to figure out
#   what those keys are in Gosu first
# - possibly slow down explosion frame rate
# - have enemies shoot at the player, preferably
#   use the same class but make the bullets look
#   different so it isn't too confusing
# - sometimes the explosions stay on the screen
#   when the game ends and other times it 
#   follows through, just make whatever one you
#   do consistent
# - instead of nerfing movement let's nerf 
#   bullets. I should introduce bullet packs to
#   incentivize movement and stop spam.
# - on the topic of bullet packs, maybe also 
#   add hearts you can get to get more hearts
# NOTES
# - maybe switch hearts into long rectangles
#   to make it look better visually
# - maybe make a win condition be hitting 
#   enough enemy ships
# - maybe introduce a potential boss at the
#   end

require 'gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'
require_relative 'explosion'

class SectorFive < Gosu::Window

  WIND_W = 800
  SIDEBAR = 50
  WIND_H = 600
  # chance of an enemy appearing
  ENEM_FREQ = 0.007 

  def initialize
    super(WIND_W+SIDEBAR, WIND_H)
    self.caption = 'Sector Five'

    @player = Player.new(self)
    @enemies = []
    @bullets = []
    @explosions = []

    # this is prob the beginning of scenes
    @end = false

    # other features
    @heart = Gosu::Image.new("images/heart.png")
    @heart_num = 10
    @font = Gosu::Font.new(10)
    @enem_sign = Gosu::Image.new("images/enemy.png")
    @enem_count = 0
    @bul_sign = Gosu::Image.new("images/bullet.png")
    @bul_left = 50
  end

  def button_down(id)
    # bullet appears at each click of
    #  the space bar
    if id == Gosu::KbSpace
      if @bul_left > 0
        @bullets.push Bullet.new(self, @player.x, @player.y, @player.angle)
        @bul_left -= 1
      end
    end 
  end

  # helper methods
  
  def clean_up()

    # remove if out of frame/event is over
    # (should use dupes which is why these
    #  are new loops)
    @enemies.dup.each do |enemy|
      # remove if out of frame
      if enemy.y-enemy.radius > 600
        @enemies.delete(enemy)
        @heart_num -= 1
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

  def collisions()

    # check for enemy collisions
    @enemies.dup.each do |enemy|

      # with the player's ship
      distance = Gosu.distance(enemy.x, enemy.y, @player.x, @player.y)
      if distance < enemy.radius + @player.radius
        @enemies.delete(enemy)
        @explosions.push(Explosion.new(self, enemy.x, enemy.y, @end))
        @explosions.push(Explosion.new(self, @player.x, @player.y, @end))
        @end = true
      end

      # with bullets
      @bullets.dup.each do |bullet|
        # we are comparing the centres
        distance = Gosu.distance(enemy.x, enemy.y, bullet.x, bullet.y)
        if distance < enemy.radius + bullet.radius
          @enemies.delete(enemy)
          @bullets.delete(bullet)
          @explosions.push(Explosion.new(self, enemy.x, enemy.y, @end))
          @enem_count += 1
        end
      end

      # with other explosions
      @explosions.dup.each do |exp|
        distance = Gosu.distance(enemy.x, enemy.y, exp.x, exp.y)
        if distance < enemy.radius + exp.radius
          @enemies.delete(enemy)
          @explosions.push(Explosion.new(self, enemy.x, enemy.y, @end))
        end
        # check for collisions between player and explosions
        distance = Gosu.distance(exp.x, exp.y, @player.x, @player.y)
        if distance < exp.radius + @player.radius
          @explosions.push(Explosion.new(self, @player.x, @player.y, @end))
          @end = true
        end
      end

    end

  end

  # DRAW AND UPDATE

  def draw

    if !@end
      @player.draw
    end
    @enemies.each do |enemy|
      enemy.draw
    end
    @bullets.each do |bullet|
      bullet.draw
    end
    @explosions.each do |explosion|
      explosion.draw
    end

    # line to separate play zone
    white = Gosu::Color::WHITE
    draw_quad(800, 0, white, 802, 0, white, 802, 600, white, 800, 600, white)

    # hearts to track enemy ships
    #  hitting our "mothership"
    for i in 1..@heart_num do
      @heart.draw(820, 595-i*15, 1)
    end
    # NEED TO ADD COUNT VARIABLES
    # count for enemies
    @enem_sign.draw(815, 10, 1, 0.5, 0.5)
    @font.draw_text(@enem_count.to_s, 820, 30, 1)
    # count for bullets
    @bul_sign.draw(821, 50, 1)
    @font.draw_text(@bul_left.to_s, 820, 60, 1)

  end

  def update

    if !@end
      # button_down vs button_down? in md file
      #  under general documentation
      @player.turn_left if button_down?(Gosu::KbLeft)
      @player.turn_right if button_down?(Gosu::KbRight)

      @player.accelerate if button_down?(Gosu::KbUp)
      @player.move
      # do not go out top of frame
      if @player.y < 0
        @explosions.push(Explosion.new(self, @player.x, @player.y, @end))
        @end = true
      end

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

      # collisions
      collisions()

      # clean up arrays
      clean_up()

      # no more hearts
      if @heart_num <= 0
        @explosions.push(Explosion.new(self, @player.x, @player.y, @end))
        @end = true
      end
      
    end

  end

end

window = SectorFive.new
window.show
