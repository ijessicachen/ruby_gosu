#SectorFive_3
require 'gosu'
require_relative 'player'
require_relative 'enemy'
#START:require_bullet
require_relative 'bullet'
#END:require_bullet
#START:require_explosion
require_relative 'explosion'
#END:require_explosion
#START:initialize
class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600
  #START:enemy_frequency
  ENEMY_FREQUENCY = 0.05
  #END:enemy_frequency
  def initialize
    super(WIDTH, HEIGHT)
    self.caption = "Sector Five"
    @player = Player.new(self)
    #START:enemy_init
    @enemies = []
    #END:enemy_init
    #START:bullets_init
    @bullets = []
    #END:bullets_init
    #START:explosions_init
    @explosions = []
    #END:explosions_init
  end
  #END:initialize
#START:update
  def update
    if button_down?(Gosu::KbLeft)
      @player.turn_left
    end
    if button_down?(Gosu::KbRight)
      @player.turn_right
    end
    if button_down?(Gosu::KbUp)
      @player.accelerate
    end
    @player.move
    #START:add_enemies
    if rand < ENEMY_FREQUENCY
      @enemies.push Enemy.new(self)
    end
    #END:add_enemies
    #START:enemy_update
    @enemies.each do |enemy|
      enemy.move
    end
    #END:enemy_update
    #START:enemy_update_and_remove
    @enemies.dup.each do |enemy|
      @enemies.delete enemy if enemy.y > HEIGHT +  enemy.radius
    end
    #END:enemy_update_and_remove
    #START:bullet_update
    @bullets.each do |bullet|
      bullet.move
    end
    #END:bullet_update
    #START:bullet_update_and_remove
    @bullets.dup.each do |bullet|
      @bullets.delete bullet if not bullet.onscreen?
    end
    #END:bullet_update_and_remove
    #START:collision
    #START:collision_with_explosion
    @enemies.dup.each do |enemy|
      @bullets.dup.each do |bullet|
        distance = Gosu.distance(enemy.x, enemy.y, bullet.x, bullet.y)
        if distance < enemy.radius + bullet.radius
          @enemies.delete enemy
          @bullets.delete bullet
    #END:collision
    #START_HIGHLIGHT
          @explosions.push Explosion.new(self, enemy.x, enemy.y)
    #END_HIGHLIGHT
    #END:collision_with_explosion     
            
    #START:collision
    #START:collision_with_explosion
        end
      end
    end 
    #END:collision
    #END:collision_with_explosion
    #START:explosion_remove
    @explosions.dup.each do |explosion|
      @explosions.delete explosion if explosion.finished
    end
    #END:explosion_remove
  end
#END:update
#START:button_down
  def button_down(id)
      if id == Gosu::KbSpace
        @bullets.push Bullet.new(self,  @player.x, @player.y, @player.angle)
      end
  end
#END:button_down
#START:draw
  def draw
    @player.draw
    #START:enemy_draw
    @enemies.each do |enemy|
      enemy.draw
    end
    #END:enemy_draw
    #START:bullet_draw
    @bullets.each do |bullet|
      bullet.draw
    end
    #END:bullet_draw
    #START:explosion_draw
    @explosions.each do |explosion|
      explosion.draw
    end
    #END:explosion_draw
  end

end

window = GameWindow.new
window.show