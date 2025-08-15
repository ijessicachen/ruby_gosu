# TO-DO

require 'gosu'

class WhackARuby < Gosu::Window
  # this is a subclass of Gosu::Window

  def initialize

    super(800, 600) #(x, y), units are pixels
    self.caption = '~ Whack a Ruby ~'

    # GENERAL
    # negative or not
    @sign = Array.new(2)
    @sign[0] = -1
    @sign[1] = 1
    # edge separating game and other details
    @edge = 30
    # are you playing?
    @playing = true

    # RUBY
    @image = Gosu::Image.new('ruby.png')
    @x = rand(100..700)
    @y = rand(100..500)
    @width = 400 * 0.1 
    @height = 338 * 0.1 

    # initial randomized velocity
    #  between 3 and 5 so it's not too slow, 
    #  sign so it can be negative
    @velocity_x = rand(3.0..5.0) * @sign[rand(0..1)]
    @velocity_y = rand(3.0..5.0) * @sign[rand(0..1)]

    # make the ruby blink
    #  visible when > 0, invisible otherwise
    @visible = 0

    # HAMMER
    @hammer_img = Gosu::Image.new('hammer.png')

    # TEXT
    @font = Gosu::Font.new(20)
    @font2 = Gosu::Font.new(40)

    # INTERACTIONS
    @hit = 0
    @score = 0

  end

  def needs_cursor?
    # hide cursor (hammer will act as the cursor)
    false
  end

  def button_down(id)
    # detect mouse (or any key) clicks

    if @playing
      if (id == Gosu::MsLeft)
        if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
          @hit = 1 
          @score += 5
        else
          @hit = -1 
          @score -= 1
        end
      end
    end

  end

  # draw and update loop at 60 times per second

  def update
    # this basically animates

    if @playing

      # MOVE THE RUBY
      @x += @velocity_x
      @y += @velocity_y

      # bounce ruby off of walls and reandomize new velocity 
      #  new velocity should still be in the other direction
      # x wall
      if @x + @width/2 > 800 - @edge
        @velocity_x = rand(-5.0..-3.0)
        @velocity_y = rand(3.0..5.0) * @sign[rand(0..1)]
      elsif @x - @width/2 < 0 + @edge
        @velocity_x = rand(3.0..5.0)
        @velocity_y = rand(3.0..5.0) * @sign[rand(0..1)]
      end
      # y wall
      if @y + @height/2 > 600 - @edge
        @velocity_x = rand(3.0..5.0) * @sign[rand(0..1)]
        @velocity_y = rand(-5.0..-3.0)
      elsif @y - @height/2 < 0 + @edge
        @velocity_x = rand(3.0..5.0) * @sign[rand(0..1)]
        @velocity_y = rand(3.0..5.0)
      end

      # MAKE THE RUBY BLINK
      # chance to become visible for 30 frames after
      #  it has been invisible for at least 10 frames
      @visible -= 1
      @visible = 40 if @visible < -10 && rand < 0.01
      # theoretically makes it visible if invisible for longer
      #  then 3 seconds (no longer up to chance)
      @visible = 40 if @visible < -180

      # TIME LIMIT
      @time_left = (5 - (Gosu.milliseconds / 1000))
      # GAME OVER?
      @playing = false if @time_left < 0

    end
    
  end


  def draw
    # this is run automatically at window.show
    
    # ruby will only show if @visible > 0
    if @visible > 0
      @image.draw(@x-@width/2, @y-@height/2, 1, 0.1, 0.1)
    end

    # draw the hammer
    @hammer_img.draw(mouse_x - 35, mouse_y - 15, 1, 0.1, 0.1)

    # hit effects
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end

    # show when hit
    draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
    # border separating play zone
    white = Gosu::Color::WHITE
    border = 3
    draw_quad(0-border+@edge, 0-border+@edge, white, 800+border-@edge, 0-border+@edge, white, 800+border-@edge, 600+border-@edge, white, 0-border+@edge, 600+border-@edge, white)
    # play zone
    black = Gosu::Color::BLACK
    draw_quad(0+@edge, 0+@edge, black, 800-@edge, 0+@edge, black, 800-@edge, 600-@edge, black, 0+@edge, 600-@edge, black)

    @hit = 0 # reset hit

    # score 
    @font.draw_text("score: " + @score.to_s, 650, 4, 2)

    # time limit
    @font.draw_text("time (s): " + @time_left.to_s, 23, 4, 2)

    # game over message
    unless @playing
      @font2.draw_text('Game Over', 310, 280, 3)
      @visible = 20
    end

  end

end

window = WhackARuby.new
window.show
