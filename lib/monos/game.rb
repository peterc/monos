module Monos
  class Game < StateBasedGame
    def initialize
      super("Monos")
    end
    
    def initStatesList(container)
      add_state(IntroState.new)
      add_state(GameplayState.new)
    end
    
    # Class methods
    
    def self.main(args = [])
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