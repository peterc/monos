module Monos
  class GameplayState < BasicGameState
    include Monos
    
    def getID; 0; end
    
    def render(container, sbg, graphics)
      @level.render(@player)

      @entities.each { |entity| entity.render }
      
      # Do transparent bar at bottom for info, etc.
      graphics.set_color(Color.new(255, 255, 255, 120))
      graphics.fill_rect(0, Monos::VIEWPORT_HEIGHT - 12 * Monos::PIXEL_SIZE, Monos::VIEWPORT_WIDTH, 12 * Monos::PIXEL_SIZE)

      # Render stuff in bottom bar
      @player.render_inventory
      @player.render_lives
    end

    def initialize
    end
    
    def init(container, sbg)
      Monos.load_assets

      @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
      
      
      container.get_input.enable_key_repeat(0, 50)
      
    end
    
    def enter(container, sbg)
      @queue = []
      @last_queue_processed = Time.now.to_i
      
      @level = Level.new(rand(3) + 4, rand(3) + 3)
      @player = Player.new(@level)
      @level.cells[@player.y][@player.x + 2] = HouseCell.new
      
      @sound = Sound.new(RELATIVE_ROOT + 'data/blip.ogg')
      @sound.play
      
      @queue << Proc.new do
        Sound.new(RELATIVE_ROOT + 'data/leavemealone.ogg').play
      end
      
      @queue << Proc.new do
        @music = Music.new(RELATIVE_ROOT + 'data/musicingame.ogg')
        @music.loop
      end
      
      @entities = []
      @entities << @player
      
      @entities << Boat.new(@level, @player.x - 5, @player.y - 5)
      @entities << Fanboy.new(@level, @player.x + 5, @player.y + 5)
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      sbg.enter_state(1) if input.is_key_pressed(Input::KEY_ESCAPE)
      
      if Time.now.to_i > @last_queue_processed
        @last_queue_processed = Time.now.to_i
        unless @queue.empty?
          @queue.shift.call
        end
      end
      
      @entities.each { |entity| entity.tick(container, delta) }
    end
    
    

  end
end