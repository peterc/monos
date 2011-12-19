module Monos
  class GameplayState < BasicGameState
    include Monos
    
    def getID; 0; end
    
    def render(container, sbg, graphics)
      @level.render(@player)
      
      @level.entities.each { |entity| entity.render }
      @player.render
      
      # Do transparent bar at bottom for info, etc.
      graphics.set_color(Color.new(255, 255, 255, 120))
      graphics.fill_rect(0, Monos::VIEWPORT_HEIGHT - 12 * Monos::PIXEL_SIZE, Monos::VIEWPORT_WIDTH, 12 * Monos::PIXEL_SIZE)

      # Render stuff in bottom bar
      @player.render_inventory
      @player.render_lives
      
      @small_font.draw_string("t_#{Time.now.to_i - @start_time}", 8, 8)
    end

    def initialize
    end
    
    def init(container, sbg)
      Monos.load_assets

      @bg = Image.new(RELATIVE_ROOT + 'data/bg.png')
      
      @small_font = Font.new(5.5, 3)
      
      container.get_input.enable_key_repeat(0, 50)
    end
    
    def enter(container, sbg)
      @queue = Queue.new
      @start_time = Time.now.to_i
      
      @level = Level.new(rand(3) + 7, rand(3) + 5)
      # EUGH
      @player = Player.new(@level)
      @level.player = @player
      @level.cells[@player.y][@player.x + 2] = HouseCell.new(@player.x + 2, @player.y)
      
      @blip = Sound.new(RELATIVE_ROOT + 'data/blip.ogg')
      
      @queue.add(1) do
        Sound.new(RELATIVE_ROOT + 'data/leavemealone.ogg').play
      end
      
      @queue.add(2) do
        @music = Music.new(RELATIVE_ROOT + 'data/musicingame.ogg')
        @music.loop
      end
      
      #@queue.every(2) do
      #  @blip.play
      #end
      
      @queue.add(3) do
        @level.entities << Boat.new(@level, rand(60), 0)
        @blip.play
      end
      
      @queue.every(2) do
        case rand(12)
        when 0
          @level.entities << Boat.new(@level, rand(60), 0)
          @blip.play
        when 1
          @level.entities << Boat.new(@level, 0, rand(60))
          @blip.play
        when 2
          @level.entities << Boat.new(@level, 59, rand(60))
          @blip.play
        when 3
          @level.entities << Boat.new(@level, rand(60), 59)
          @blip.play
        end
      end
      
      @level.entities << @player
      
      #@entities << Boat.new(@level, @player.x - 5, @player.y - 5)
      @level.entities << Turret.new(@level, @player.x + 3, @player.y + 3)
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      sbg.enter_state(1) if input.is_key_pressed(Input::KEY_ESCAPE)
      
      @queue.run
      
      @level.entities.each { |entity| entity.tick(container, delta) }
      
      if @player.lives <= 0
        @player.kill
        Sound.new(RELATIVE_ROOT + 'data/dead.ogg').play
        sbg.enter_state(3)
      end
    end
    
    

  end
end