module Monos
  class IntroState < BasicGameState
    def getID; 1; end
    
    def render(container, sbg, graphics)
      graphics.scale(Monos::PIXEL_SIZE, Monos::PIXEL_SIZE)
  
      @bg.draw(0, 0)
      
      graphics.set_color(Color.new(0, 40, 80))
      graphics.set_line_width(8 * Monos::PIXEL_SIZE)

      graphics.draw_rect(4.0, 4.0, Monos::SCALED_WIDTH - 7.5, Monos::SCALED_HEIGHT - 7.5)
    end

    def initialize
    end
    
    def init(container, sbg)
      @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')      
      @sound = Sound.new(RELATIVE_ROOT + 'data/heal.ogg')
      @sound.play
    end
    
    def enter(container, sbg)
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      container.exit if input.is_key_pressed(Input::KEY_ESCAPE)
      sbg.enter_state(0) if input.is_key_pressed(Input::KEY_SPACE)
    end
  end
end