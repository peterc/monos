module Monos
  class Game < StateBasedGame
    include Monos
    
    def initialize
      super("Bodge")
    end
    
    def initStatesList(container)
      add_state(IntroState.new)
      add_state(GameplayState.new)
      add_state(DeadState.new)
    end
    
    def init(container)

    end
        
    # Class methods
    
    def self.main(args = [])      
      app = AppGameContainer.new(new)
      app.set_display_mode(VIEWPORT_WIDTH, VIEWPORT_HEIGHT, FULL_SCREEN)
      app.set_always_render true
      app.set_target_frame_rate TARGET_FPS
      app.set_show_fps SHOW_FPS
      app.set_smooth_deltas true
      app.set_vsync VSYNC
      app.start
    end
    
    def self.start
      main
    end
  end
end