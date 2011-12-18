module Monos
  class GameplayState < BasicGameState
    def getID; 0; end
    
    def render(container, sbg, graphics)
      #graphics.scale(Monos::PIXEL_SIZE, Monos::PIXEL_SIZE)
  
      @bg.draw(0, 0, Monos::VIEWPORT_WIDTH, Monos::VIEWPORT_HEIGHT, 0, 0, 640, 480)
      graphics.set_color(Color.white)
      graphics.draw_string(@player.actual_x.to_s, 400, 8)
      
      @level.render(@tiles[0], @player.actual_x * -1 + 8, @player.actual_y * -1 + 6) 
      @player.render
      
      graphics.set_color(Color.new(0, 40, 80))
      #graphics.set_line_width(8 * Monos::PIXEL_SIZE)
      #
      #graphics.draw_rect(4.0, 4.0, Monos::SCALED_WIDTH - 7.5, Monos::SCALED_HEIGHT - 7.5)
    end

    def initialize
      
    end
    
    def init(container, sbg)
      @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
      
      @tile_sheet = SpriteSheet.new(Image.new(RELATIVE_ROOT + 'data/tiles.png'), 8, 8)
      @tiles = (0..5).map do |y|
        (0..10).map do |x|
          im = @tile_sheet.get_sub_image(x, y)
          im.set_filter(Image::FILTER_NEAREST)
          im
        end
      end
      
      @level = Level.new
      @player = Player.new(@tiles[0][3], @level)
      
      container.get_input.enable_key_repeat(0, 50)
      
      @sound = Sound.new(RELATIVE_ROOT + 'data/heal.ogg')
      @sound.play
    end
    
    def enter(container, sbg)
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      sbg.enter_state(1) if input.is_key_pressed(Input::KEY_ESCAPE)      
      
      @player.tick(container, delta)
    end
    
    

  end
end