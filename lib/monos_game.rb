java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.ImageBuffer
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer

class MonosGame < BasicGame
  VIEWPORT_WIDTH = 640
  VIEWPORT_HEIGHT = 480
  PIXEL_SIZE = 4
  
  def render(container, graphics)
    graphics.scale(PIXEL_SIZE, PIXEL_SIZE)
    graphics.set_anti_alias(false)

    @pixels = ImageBuffer.new(VIEWPORT_WIDTH / PIXEL_SIZE, VIEWPORT_HEIGHT / PIXEL_SIZE)
    @pixels.height.times do |y|
      @pixels.width.times do |x|
        @pixels.setRGBA(x, y, rand(2) == 0 ? 255 : 0, 0, 0, 255)
      end
    end
    
    img = Image.new(@pixels, Image::FILTER_NEAREST)
    graphics.draw_image(img, 0, 0)  #, VIEWPORT_WIDTH + 0.5, VIEWPORT_HEIGHT + 0.5, 0, 0, img.width, img.height)
  end
  
  def self.main
    app = AppGameContainer.new(new)
    app.set_display_mode(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, false)
    #app.set_target_frame_rate 60
    app.set_always_render true
    app.set_show_fps true
    #app.set_vsync true
    app.start
  end
  
  def initialize
    super("Monos")
  end
  
  def init(container)
    @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
    @once = false
  end
  
  def update(container, delta)
    input = container.get_input  
    container.exit if input.is_key_down(Input::KEY_ESCAPE)
  end
end