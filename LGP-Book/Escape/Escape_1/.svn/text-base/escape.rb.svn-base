#START:init
#START:require_boulder
#START:require_platform
#START:require_chip
#START:require_wall
#START:require_moving_platform
require 'gosu'
require 'chipmunk'
#END:require_moving_platform
#END:init
#END:require_platform
#END:require_chip
#END:require_wall
#START_HIGHLIGHT
#START:require_platform
#START:require_chip
#START:require_wall
#START:require_moving_platform
require_relative 'boulder'
#END:require_moving_platform
#END:require_wall
#END:require_chip
#END:require_platform
#END_HIGHLIGHT
#END:require_boulder
#START:require_platform
#START_HIGHLIGHT
#START:require_chip
#START:require_wall
#START:require_moving_platform
require_relative 'platform'
#END:require_moving_platform
#END:require_wall
#END:require_chip
#END_HIGHLIGHT
#END:require_platform
#START:require_wall
#START_HIGHLIGHT
#START:require_chip
#START:require_moving_platform
require_relative 'wall'
#END:require_moving_platform
#END:require_chip
#END_HIGHLIGHT
#END:require_wall
#START:require_chip
#START_HIGHLIGHT
#START:require_moving_platform
require_relative 'chip'
#END:require_moving_platform
#END_HIGHLIGHT
#END:require_chip
#START:require_moving_platform
#START_HIGHLIGHT
require_relative 'moving_platform'
#END_HIGHLIGHT
#END:require_moving_platform

#START:gravity
#START:init
#START:boulder_frequency
class Escape < Gosu::Window
#END:boulder_frequency
#END:init
#START_HIGHLIGHT
#START:boulder_frequency
  DAMPING = 0.90
  GRAVITY = 400.0
#END:boulder_frequency
#END_HIGHLIGHT
#END:gravity
#START:boulder_frequency
#START_HIGHLIGHT
  BOULDER_FREQUENCY = 0.01
#END_HIGHLIGHT
#END:boulder_frequency
#START:gravity
#START:init
  attr_reader :space
#START:boulder_init
#START:add_platforms
#START:init_end
#START:add_chip
  def initialize
    super(800,800)
    self.caption = 'Escape'
#END:gravity
#END:boulder_init
#END:add_platforms
#END:init_end
#END:add_chip
#START_HIGHLIGHT
#START:add_platforms
#START:boulder_init
#START:gravity
#START:init_end
#START:add_chip
    @game_over = false
    @space = CP::Space.new
    @background = Gosu::Image.new('images/background.png', tileable: true)
#END:add_chip
#END:init_end
#END:gravity
#END:boulder_init
#END:add_platforms
#END_HIGHLIGHT
#START:gravity
#END:init
#START_HIGHLIGHT
#START:add_platforms
#START:boulder_init
#START:init_end
#START:add_chip
    @space.damping = DAMPING
    @space.gravity = CP::Vec2.new(0.0, GRAVITY)
#END:add_chip
#END:init_end
#END:boulder_init
#END:add_platforms
#END_HIGHLIGHT
#END:gravity
#START:boulder_init
#START_HIGHLIGHT
#START:add_platforms
#START:init_end
#START:add_chip
    @boulders = []
#END:add_chip
#END:init_end
#END:add_platforms
#END_HIGHLIGHT
#END:boulder_init
#START:add_platforms
#START_HIGHLIGHT
#START:init_end
#START:add_chip
    @platforms = make_platforms
#END:add_chip
#END:init_end
#END_HIGHLIGHT
#END:add_platforms

#START:init_end
#END:init_end
#START:add_walls
#START:init_end
#START:add_chip
    @floor = Wall.new(self, 400,810,800,20)
    @left_wall = Wall.new(self, -10, 400, 20,800)
    @right_wall = Wall.new(self, 810,470,20,660)
#END:init_end
#END:add_chip
#END:add_walls
#START:add_chip
#START_HIGHLIGHT
#START:init_end
    @player = Chip.new(self,70,700)
#END:init_end
#END_HIGHLIGHT
#END:add_chip
#START:init_end
#START_HIGHLIGHT
    @sign = Gosu::Image.new('images/exit.png')
    @font = Gosu::Font.new(40)
#END_HIGHLIGHT
#START:init
#START:gravity
#START:add_platforms
#START:boulder_init
#START:add_chip
  end
#END:add_chip
#END:init_end
#END:boulder_init
#END:add_platforms
#END:gravity
#END:init
#START:more_platforms
#START:make_platforms
  def make_platforms
    platforms = []
    platforms.push Platform.new(self,150,700)
    platforms.push Platform.new(self,320,650)
    platforms.push Platform.new(self,150,500)
    platforms.push Platform.new(self,470,550)
#END:make_platforms
#START_HIGHLIGHT
    platforms.push MovingPlatform.new(self,580,600,70,:vertical)
    platforms.push Platform.new(self,320,440)
    platforms.push Platform.new(self,600,150)
    platforms.push Platform.new(self,700,450)
    platforms.push Platform.new(self,580,300)
    platforms.push MovingPlatform.new(self,190,330,50,:vertical)
    platforms.push MovingPlatform.new(self,450,230,70,:horizontal)
    platforms.push Platform.new(self,750,140)
    platforms.push Platform.new(self,700,700)
#END_HIGHLIGHT
#START:make_platforms
    return platforms
  end
#END:make_platforms
#END:more_platforms
#START:draw
#START:draw_platforms
#START:draw_chip
#START:draw_end
  def draw
    @background.draw(0,0,0)
    @background.draw(0,529,0)
    @boulders.each do |boulder|
      boulder.draw
    end
#END:draw_end
 #END:draw 
 #END:draw_chip
#START_HIGHLIGHT
#START:draw_chip
#START:draw_end
    @platforms.each do |platform|
      platform.draw
    end
#END:draw_end
#END:draw_chip
#END_HIGHLIGHT
#END:draw_platforms
 #START:draw_chip 
 #START_HIGHLIGHT
 #START:draw_end
    @player.draw
#END:draw_end
 #END_HIGHLIGHT
#END:draw_chip   
#START:draw_end
#START_HIGHLIGHT
    @sign.draw(650,30,1)
    if @game_over == false
      @seconds = (Gosu.milliseconds / 1000).to_i
      @font.draw("#{@seconds}", 10,20,3,1,1,0xff00ff00)
    else
      @font.draw("#{@win_time/1000}", 10,20,3,1,1,0xff00ff00)
      @font.draw("Game Over",200, 300, 3,2,2,0xff00ff00)
    end
    #END_HIGHLIGHT
 #START:draw  
 #START:draw_platforms 
 #START:draw_chip
  end
#END:draw_end
#END:draw_chip
#END:draw_platforms
#END:draw
#START:update
#START:add_boulders
#START:game_over
  def update
    unless @game_over
      10.times do 
        @space.step(1.0/600)
      end
#END:game_over
#END:update
#START_HIGHLIGHT
#START:game_over
      if rand < BOULDER_FREQUENCY 
        @boulders.push Boulder.new(self, 200 + rand(400), -20)
      end
#END:game_over
#END_HIGHLIGHT
#END:add_boulders
  #START:check_footing
  #START:game_over
      @player.check_footing(@platforms + @boulders)
  #END:game_over
  #END:check_footing
  #START:move_platforms
  #START:game_over
      @platforms.each do |platform|
        platform.move if platform.respond_to?(:move)
      end
  #END:game_over
  #END:move_platforms
      #START:run
      #START:game_over
      if button_down?(Gosu::KbRight)
    	  @player.move_right
      elsif button_down?(Gosu::KbLeft)
        @player.move_left
      else
        @player.stand
      end
      #END:game_over
      #END:run
      #START:game_over
      #START_HIGHLIGHT
      if @player.x > 820
        @game_over = true
        @win_time = Gosu.milliseconds
      end
      #END_HIGHLIGHT
      #START:update
#START:add_boulders
    end   
  end
  #END:game_over
#END:add_boulders
#END:update
#START:jump

  def button_down(id)
    if id == Gosu::KbSpace
      @player.jump
    end
    if id == Gosu::KbQ
      close
    end
  end
#END:jump
#START:init
end

window = Escape.new
window.show
#END:init