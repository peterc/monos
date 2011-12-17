module Monos
  class Game < BasicGame
    
    def render(container, graphics)
      graphics.scale(Monos::PIXEL_SIZE, Monos::PIXEL_SIZE)
  
      @bg.draw(0, 0)
      @level.render(@tiles, @player.actual_x * -1, @player.actual_y * -1) 
      @player.render
    end
    

    
    def initialize
      super("Monos")
    end
    
    def init(container)
      @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
      
      @tile_sheet = SpriteSheet.new(Image.new(RELATIVE_ROOT + 'data/tiles.png'), 8, 8)
      @tiles = (0..5).map { |i| im = @tile_sheet.get_sub_image(i, 0); im.set_filter(Image::FILTER_NEAREST); im }

      @player = Player.new(@tiles[3])
      @level = Level.new
      
      container.get_input.enable_key_repeat(0, 50)
      
      @sound = Sound.new(RELATIVE_ROOT + 'data/heal.ogg')
      @sound.play
    end
    
    def update(container, delta)
      input = container.get_input
      container.exit if input.is_key_down(Input::KEY_ESCAPE)      
      
      @player.tick
      @player.process_input(input)
    end
    
    
    # Class methods
    
    def self.main
      app = AppGameContainer.new(new)
      app.set_display_mode(Monos::VIEWPORT_WIDTH, Monos::VIEWPORT_HEIGHT, Monos::FULL_SCREEN)
      app.set_always_render true
      app.set_show_fps true
      app.set_smooth_deltas true
      app.set_vsync true
      app.start
    end
    
    def self.start
      main
    end
  end
end