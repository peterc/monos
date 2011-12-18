module Monos
  class GameplayState < BasicGameState
    include Monos
    
    def getID; 0; end
    
    def render(container, sbg, graphics)
      #@bg.draw(0, 0, Monos::VIEWPORT_WIDTH, Monos::VIEWPORT_HEIGHT, 0, 0, 640, 480)
      #graphics.set_color(Color.white)
      #graphics.draw_string(@player.actual_x.to_s, 400, 8)
      
      @level.render(@player)
      @player.render
      
      graphics.set_color(Color.new(0, 40, 80))
      #graphics.set_line_width(8 * Monos::PIXEL_SIZE)
      #graphics.draw_rect(4.0, 4.0, Monos::SCALED_WIDTH - 7.5, Monos::SCALED_HEIGHT - 7.5)
    end

    def initialize
    end
    
    def init(container, sbg)
      Monos.load_assets

      @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
      
      @level = Level.new
      @player = Player.new(@level)
      
      container.get_input.enable_key_repeat(0, 50)
      
    end
    
    def enter(container, sbg)
      @sound = Sound.new(RELATIVE_ROOT + 'data/blip.ogg')
      @sound.play
      @music = Music.new(RELATIVE_ROOT + 'data/musicingame.ogg')
      @music.loop
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      sbg.enter_state(1) if input.is_key_pressed(Input::KEY_ESCAPE)      
      
      @player.tick(container, delta)
    end
    
    

  end
end