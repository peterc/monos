module Monos
  class Player < Creature
    attr_reader :lives
    
    def initialize(level)
      super
      @lives = 5
      #@weapons = []
      @weapon_selected = 0
    end
    
    def sprite_frames
      row = 1
      frames = { :dead => [[9, 9]], :standing => [[row, 0]], :up => [[row, 1], [row, 4]], :right => [[row, 2], [row, 5]], :left => [[row, 3], [row, 6]], :down => [[row, 7], [row, 8]] }
    end

    def can_visit?(cell)
      [:grass, :sand].include?(cell.name)
    end
    
    def render_lives
      # EUGH!
      start_x = Monos::VIEWPORT_WIDTH - 8 - Monos::TILE_PIXEL_WIDTH
      start_y = Monos::VIEWPORT_HEIGHT - 8 - Monos::TILE_PIXEL_WIDTH
      @lives.times do
        Monos.tiles[4][0].draw(start_x, start_y, Monos::TILE_PIXEL_WIDTH, Monos::TILE_PIXEL_WIDTH)
        start_x -= Monos::PIXEL_SIZE * 9
      end
    end
    
    def render_inventory
      x = 8
      y = Monos::VIEWPORT_HEIGHT - 8 - Monos::PIXEL_SIZE * Monos::TILE_WIDTH
      Font.new(8).draw_string("g", x, y)
    end
    
    def process_input(container, delta)     
      x_diff = (@x - @actual_x).abs.round
      y_diff = (@y - @actual_y).abs.round
      
      input = container.get_input
      unless x_diff > 1 && y_diff > 1
        movement_delta = 0.01 * delta
        
        # Is the key pressed and movement ready?
        left = input.is_key_down(Input::KEY_LEFT) && @x >= 0 && x_diff < 1
        right = input.is_key_down(Input::KEY_RIGHT) && @x < level.width - 1 && x_diff < 1
        up = input.is_key_down(Input::KEY_UP) && @y >= 0 && y_diff < 1
        down = input.is_key_down(Input::KEY_DOWN) && @y < level.height - 1 && y_diff < 1
        
        move(movement_delta, left, right, up, down) if left || right || up || down
      end
      
      if input.is_key_pressed(Input::KEY_SPACE)
        Sound.new(RELATIVE_ROOT + 'data/shot.ogg').play
        
        r = rand(4)
        
        case r
        when 0
          cb = Cannonball.new(@level, @x - 1, @y - 1)
          cb.dx = -1
          cb.dy = -1
          @level.entities << cb
        when 1
          cb = Cannonball.new(@level, @x - 1, @y + 1)
          cb.dx = -1
          cb.dy = 1
          @level.entities << cb
        when 2
          cb = Cannonball.new(@level, @x + 1, @y - 1)
          cb.dx = 1
          cb.dy = -1
          @level.entities << cb
        when 3
          cb = Cannonball.new(@level, @x + 1, @y + 1)
          cb.dx = 1
          cb.dy = 1
          @level.entities << cb
        end
      end      
    end
    
    def render
      x = CENTER_TILE_X * 8 * Monos::PIXEL_SIZE
      y = CENTER_TILE_Y * 8 * Monos::PIXEL_SIZE
      sprites[@state].draw(x, y, (Monos::TILE_PIXEL_WIDTH), (Monos::TILE_PIXEL_WIDTH))
    end
    
    
    def tick(container, delta)
      super      
      process_input(container, delta)
      
      if enemy = surrounded_by(Monos::Fanboy)
        @lives -= 1
        enemy.kill
      end
    end
  end
end