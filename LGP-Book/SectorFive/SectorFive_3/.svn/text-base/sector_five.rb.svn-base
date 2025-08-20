#SectorFive_3
#START:require_bullet
require 'gosu'
require_relative 'player'
require_relative 'enemy'
#START_HIGHLIGHT
require_relative 'bullet'
#END_HIGHLIGHT
#END:require_bullet
#START:require_explosion
require_relative 'explosion'
#END:require_explosion
#START:initialize
#START:enemy_frequency
class SectorFive < Gosu::Window
  WIDTH = 800
  HEIGHT = 600
  #START_HIGHLIGHT
  ENEMY_FREQUENCY = 0.05
  #END_HIGHLIGHT
  #END:enemy_frequency
  #START:enemy_init
  #START:bullets_init
  #START:explosions_init
  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Sector Five'
    @player = Player.new(self)
    #END:explosions_init
    #END:bullets_init
    #START_HIGHLIGHT
    #START:bullets_init
    #START:explosions_init
    @enemies = []
    #END:explosions_init
    #END:bullets_init
    #END_HIGHLIGHT
    #END:enemy_init
    #START:bullets_init
    #START_HIGHLIGHT
    #START:explosions_init
    @bullets = []
    #END:explosions_init
    #END_HIGHLIGHT
    #END:bullets_init
    #START:explosions_init
    #START_HIGHLIGHT
    @explosions = []
    #END_HIGHLIGHT
    #END:explosions_init
  #START:enemy_init
  #START:bullets_init
  #START:explosions_init
  end
  #END:explosions_init
  #END:bullets_init
  #END:enemy_init
  #END:initialize
#START:update
#START:add_enemies
#START:enemy_update
#START:bullet_update
#START:collision
#START:collision_with_explosion
#START:explosion_remove
#START:enemy_remove
#START:bullet_remove
  def update
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)
    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move
  #END:bullet_remove
  #END:enemy_remove
  #END:explosion_remove
  #END:collision_with_explosion
  #END:collision
  #END:enemy_update
  #END:bullet_update
    #START_HIGHLIGHT
  #START:bullet_update
  #START:enemy_update
  #START:collision
  #START:collision_with_explosion
  #START:explosion_remove
  #START:enemy_remove
  #START:bullet_remove
    if rand < ENEMY_FREQUENCY
      @enemies.push Enemy.new(self)
    end
  #END:bullet_remove
  #END:enemy_remove
  #END:explosion_remove
  #END:collision_with_explosion
  #END:collision
  #END:bullet_update
  #END:enemy_update
    #END_HIGHLIGHT
    #END:add_enemies
    #START:enemy_update
    #START_HIGHLIGHT
    #START:bullet_update
    #START:collision
    #START:collision_with_explosion
    #START:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
    @enemies.each do |enemy|
      enemy.move
    end
    #END:bullet_remove
    #END:enemy_remove
    #END:explosion_remove
    #END:collision_with_explosion
    #END:collision
    #END:bullet_update
    #END_HIGHLIGHT
    #END:enemy_update
    #START:bullet_update
    #START_HIGHLIGHT
    #START:collision
    #START:collision_with_explosion
    #START:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
    @bullets.each do |bullet|
      bullet.move
    end
    #END:bullet_remove
    #END:enemy_remove
    #END:explosion_remove
    #END:collision_with_explosion
    #END:collision
    #END_HIGHLIGHT
    #END:bullet_update
    #START:collision
    #START_HIGHLIGHT
    #START:collision_with_explosion
    #START:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
    @enemies.dup.each do |enemy|
      @bullets.dup.each do |bullet|
        distance = Gosu.distance(enemy.x, enemy.y, bullet.x, bullet.y)
        if distance < enemy.radius + bullet.radius
          @enemies.delete enemy
          @bullets.delete bullet
    #END:bullet_remove
    #END:enemy_remove
    #END:explosion_remove
    #END:collision_with_explosion
    #END_HIGHLIGHT
    #END:collision
    #START:collision_with_explosion
    #START_HIGHLIGHT
    #START:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
          @explosions.push Explosion.new(self, enemy.x, enemy.y)
    #END:bullet_remove
    #END:enemy_remove
    #END:explosion_remove
    #END_HIGHLIGHT
    #END:collision_with_explosion        
    #START:collision
    #START_HIGHLIGHT
    #START:collision_with_explosion
    #START:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
        end
      end
    end 
    #END:bullet_remove
    #END:enemy_remove
    #END:explosion_remove
    #END:collision_with_explosion
    #END_HIGHLIGHT
    #END:collision
    #END:collision_with_explosion
    #START:explosion_remove
    #START_HIGHLIGHT
    #START:enemy_remove
    #START:bullet_remove
    @explosions.dup.each do |explosion|
      @explosions.delete explosion if explosion.finished
    end
    #END:bullet_remove
    #END:enemy_remove
    #END_HIGHLIGHT
    #END:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
    #START_HIGHLIGHT
    @enemies.dup.each do |enemy|
      if enemy.y > HEIGHT + enemy.radius
        @enemies.delete enemy 
      end
    end
    @bullets.dup.each do |bullet|
      @bullets.delete bullet unless bullet.onscreen?
    end
    #END_HIGHLIGHT
    #END:bullet_remove
    #START:add_enemies
    #START:enemy_update
    #START:bullet_update
    #START:collision
    #START:collision_with_explosion
    #START:explosion_remove
    #START:enemy_remove
    #START:bullet_remove
  end
  #END:bullet_remove
  #END:enemy_remove
  #END:explosion_remove
  #END:collision_with_explosion
  #END:collision
  #END:bullet_update
  #END:enemy_update
  #END:add_enemies
#END:update
#START:button_down
  def button_down(id)
      if id == Gosu::KbSpace
        @bullets.push Bullet.new(self, @player.x, @player.y, @player.angle)
      end
  end
#END:button_down
#START:draw
#START:enemy_draw
#START:bullet_draw
#START:explosion_draw
  def draw
    @player.draw
#END:explosion_draw
#END:bullet_draw
   #START_HIGHLIGHT
#START:bullet_draw
#START:explosion_draw
    @enemies.each do |enemy|
      enemy.draw
    end
#END:explosion_draw
#END:bullet_draw
   #END_HIGHLIGHT
    #END:enemy_draw
    #START:bullet_draw
    #START_HIGHLIGHT
    #START:explosion_draw
    @bullets.each do |bullet|
      bullet.draw
    end
    #END:explosion_draw
    #END_HIGHLIGHT
    #END:bullet_draw
    #START:explosion_draw
    #START_HIGHLIGHT
    @explosions.each do |explosion|
      explosion.draw
    end
    #END_HIGHLIGHT
    #END:explosion_draw
    #START:enemy_draw
    #START:bullet_draw
    #START:explosion_draw
  end
  #END:explosion_draw
  #END:bullet_draw
    #END:enemy_draw

end

window = SectorFive.new
window.show