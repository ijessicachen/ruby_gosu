require 'gosu'

class WhackARuby < Gosu::Window
  # this is a subclass of Gosu::Window

  def initialize
    super(800, 600) #(x, y), units are pixels
    self.caption = '~ Whack a Ruby ~'

    @image = Gosu::Image.new('ruby.png')
    @x = 400
    @y = 300
    @width = 400 * 0.1 
    @height = 338 * 0.1 

    # I feel like this should be randomized within
    #  a range at some point, perhaps at the beginning
    #  then at every bounce
    @velocity_x = 5 
    @velocity_y = 5
  end

  # draw and update loop at 60 times per second

  def update
    # this basically animates

    # move the ruby 
    @x += @velocity_x
    @y += @velocity_y

    # bounce ruby off of walls
    @velocity_x *= -1 if @x + @width/2 > 800 || @x - @width/2 < 0
    @velocity_y *= -1 if @y + @height/2 > 600 || @y - @height/2 < 0
  end


  def draw
    # this is run automatically at window.show
    @image.draw(@x-@width/2, @y-@height/2, 1, 0.1, 0.1)
  end


end

window = WhackARuby.new
window.show
