module Monos
  class IntroState < BasicGameState
    def getID; 1; end
    
    def render(container, sbg, graphics)
      @level.render(@fake_player)  
      
      graphics.set_color(Color.new(0, 40, 80, 100))
      graphics.set_line_width(8 * Monos::PIXEL_SIZE)
      graphics.fill_rect(0, 54, Monos::VIEWPORT_WIDTH, 120)
      graphics.fill_rect(0, 210, Monos::VIEWPORT_WIDTH, 150)

      @big_font.draw_string("a_BODGE_a", 15, 70)
      @font.draw_string(@message, 80, 226)
      #@small_font.draw_string("ahahahahahahahahahahahaha", 0, 0)
      @small_font.draw_string("SPACE TO PLAY h ESC TO QUIT", 26, 410)
    end

    def initialize
    end
    
    def init(container, sbg)
      #@bg = Image.new(RELATIVE_ROOT + 'data/introscreen.png')
      #@sound = Sound.new(RELATIVE_ROOT + 'data/blip.ogg')
      #@sound.play
      @font = Font.new
      @big_font = Font.new(5.5, 10)
      @small_font = Font.new(5.5, 3)
    end
    
    def enter(container, sbg)
      @music = Music.new(RELATIVE_ROOT + 'data/music.ogg')
      @music.loop
      
      @level = Level.new(7, 5) do |cells|
        40.times do
          y = rand(cells.length)
          x = rand(cells.first.length)
          cells[y][x] = SunCell.new(x, y)
        end
      end
      
      @fake_player = FakePlayer.new(@level)

      @last_tick = Time.now.to_i
      @ticks = 0
      
      @story = [
        " YOU ARE BODGE \n FAMED CREATOR \n OF . . . . .  ",
        "  SHAFTCRAFT   \n BEST SELLING  \n  GAME EVER!   ",
        " ALONE ON YOUR \nISLAND PARADISE\n FANBOYS ARE.. ",
        " ON THEIR WAY!\n REMAIN ALONE. \n AT ALL COSTS! "
      ]
      
      @sidx = 0
      @message = @story[0]      
    end
    
    def leave(container, sbg)
      @music.stop
    end
    
    def update(container, sbg, delta)
      input = container.get_input
      container.exit if input.is_key_pressed(Input::KEY_ESCAPE)
      sbg.enter_state(0) if input.is_key_pressed(Input::KEY_SPACE)
      
      if Time.now.to_i > @last_tick
        @last_tick = Time.now.to_i
        @ticks += 1
      end
      
      if @ticks % 5 == 0
        @ticks += 1
        @message = @story[@sidx]
        @sidx = (@sidx + 1) % @story.length
      end
      
      @fake_player.tick(container, delta)
    end
  end
end