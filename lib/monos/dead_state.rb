module Monos
  class DeadState < BasicGameState
    def getID; 3; end
    
    def render(container, sbg, graphics)
      graphics.set_color(Color.new(200, 0, 0))
      graphics.set_line_width(8 * Monos::PIXEL_SIZE)
      graphics.fill_rect(0, 0, Monos::VIEWPORT_WIDTH, Monos::VIEWPORT_HEIGHT)

      @big_font.draw_string("a_BODGE_a", 15, 70)
      @font.draw_string("YOU ARE DEAD", 105, 226)
      @small_font.draw_string("SPACE TO RETURN TO MAIN MENU", 26, 410)
    end

    def initialize
    end
    
    def init(container, sbg)
      @font = Font.new
      @big_font = Font.new(5.5, 10)
      @small_font = Font.new(5.5, 3)
    end
    
    def enter(container, sbg)
    end
    
    def leave(container, sbg)
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      container.exit if input.is_key_pressed(Input::KEY_ESCAPE)
      sbg.enter_state(1) if input.is_key_pressed(Input::KEY_SPACE)      
    end
  end
end