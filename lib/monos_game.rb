java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.ImageBuffer
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.UnicodeFont
java_import org.newdawn.slick.SpriteSheet
java_import org.newdawn.slick.font.HieroSettings
java_import org.newdawn.slick.font.effects.ColorEffect
#java_import java.awt.Font
#java_import java.io.BufferedInputStream
#java_import java.io.IOException
#java_import java.io.FileInputStream
java_import org.newdawn.slick.Color

class MonosGame < BasicGame
  VIEWPORT_WIDTH = 800
  VIEWPORT_HEIGHT = 480
  PIXEL_SIZE = 4
  SCALED_WIDTH = VIEWPORT_WIDTH / PIXEL_SIZE
  SCALED_HEIGHT = VIEWPORT_HEIGHT / PIXEL_SIZE
  FULL_SCREEN = false
  
  def render(container, graphics)
    graphics.scale(PIXEL_SIZE, PIXEL_SIZE)
    #graphics.set_font(@font1)
    
    
    #pixels = ImageBuffer.new(SCALED_WIDTH, SCALED_HEIGHT)
    #
    #10000.times do
    #  pixels.setRGBA(rand(SCALED_WIDTH), rand(SCALED_HEIGHT), 255, 0, 0, 255)
    #end
    #
    #i = pixels.get_image(Image::FILTER_NEAREST)
    #@bg.draw(0, 0)
    #i.draw(0, 0)
    #
    #i.destroy
    #@bg.draw(0,0)
    #graphics.draw_string("DEF", 50, 50)
    
    
    @level.each_with_index do |row, y|
      row.each_with_index do |col, x|
        xpos = x * 8 + (@x_off * 8).to_i
        ypos = y * 8
        
        if xpos > -8 && xpos < container.width && ypos > -8 && ypos < container.height
          @tiles[col].draw(xpos, y * 8)
        end
      end
    end
    
    #@font1.draw_string(20, 20, "ABC")
  end
  
  def self.main
    app = AppGameContainer.new(new)
    app.set_display_mode(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, FULL_SCREEN)
    app.set_target_frame_rate 55.5
    app.set_always_render true
    app.set_show_fps true
    app.set_minimum_logic_update_interval 36
    #app.set_vsync true
    app.start
  end
  
  def initialize
    super("Monos")
  end
  
  def init(container)
    @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
    @tile_sheet = SpriteSheet.new(Image.new(RELATIVE_ROOT + 'data/tiles.png'), 8, 8)
    @tile_sheet.set_filter(Image::FILTER_NEAREST)
    @tiles = (0..5).map { |i| im = @tile_sheet.get_sub_image(i, 0); im.set_filter(Image::FILTER_NEAREST); im }

    #fis = FileInputStream.new(RELATIVE_ROOT + 'data/zara.ttf')
    #@base_font = Font.create_font(Font::TRUETYPE_FONT, BufferedInputStream.new(fis))
    #@font1 = TrueTypeFont.new(@base_font, false)
    
    #@font1 = UnicodeFont.new(RELATIVE_ROOT + 'data/zara.ttf', 16, false, false)
    #@font1.add_ascii_glyphs
    #@font1.get_effects.add(ColorEffect.new)
    #@font1.load_glyphs
    #@pixels = ImageBuffer.new(SCALED_WIDTH, SCALED_HEIGHT)
    
    @level = []
    
    100.times do
      sa = []
      100.times do
        sa << rand(3)
      end
      @level << sa
    end
    
    @x_off = -50.00
  end
  
  def update(container, delta)
    input = container.get_input  
    container.exit if input.is_key_down(Input::KEY_ESCAPE)
    
    @x_off += 0.004 * delta
    #@x_off = 0.0 if @x_off >= 1.0
  end
end