class Explosion

  attr_reader :finished

  def initialize (window, x, y)
    # the whole image is 240 x 240, each
    #  "frame" is 60x60 (wxh)
    @x = x
    @y = y
    @radius = 30
    @images = Gosu::Image.load_tiles('images/explosions.png', 60, 60)
    @image_index = 0
    @finished = false
  end

  def draw

    if @image_index < @images.count
      @images[@image_index].draw(@x-@radius, @y-@radius, 2)
      @image_index += 1
    else
      @finished = true
    end
    
  end

end
