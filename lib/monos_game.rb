java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer

class MonosGame < BasicGame
  VIEWPORT_WIDTH = 640
  VIEWPORT_HEIGHT = 480
  
  def render(container, graphics)
    @bg.draw(0, 0)
    graphics.draw_string("MONOS (ESCAPE TO EXIT)", 8, 450)
  end
  
  def self.main
    app = AppGameContainer.new(new)
    app.set_display_mode(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, false)
    app.set_target_frame_rate 120
    app.set_always_render true
    app.set_show_fps true
    app.start
  end
  
  def initialize
    super("ArrowGame")
  end
  
  def init(container)
    @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
  end
  
  def update(container, delta)
    input = container.get_input  
    container.exit if input.is_key_down(Input::KEY_ESCAPE)
  end
end