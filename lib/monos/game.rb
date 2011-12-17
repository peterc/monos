module Monos
  class Game < BasicGame
    VIEWPORT_WIDTH = 800
    VIEWPORT_HEIGHT = 480
    PIXEL_SIZE = 4
    SCALED_WIDTH = VIEWPORT_WIDTH / PIXEL_SIZE
    SCALED_HEIGHT = VIEWPORT_HEIGHT / PIXEL_SIZE
    FULL_SCREEN = false
    
    def render(container, graphics)
      graphics.scale(PIXEL_SIZE, PIXEL_SIZE)
  
      @level.render(@tiles, @player.x * -1, @player.y * -1) 
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
    end
    
    def update(container, delta)
      input = container.get_input
      container.exit if input.is_key_down(Input::KEY_ESCAPE)      
      
      @player.process_input(input)
    end
    
    
    # Class methods
    
    def self.main
      app = AppGameContainer.new(new)
      app.set_display_mode(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, FULL_SCREEN)
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