module Monos
  class Creature
    attr_accessor :x, :y, :actual_x, :actual_y, :level
    
    ANIMATION_DURATION = 100
    
    def sprite_frames
      row = 0
      frames = { :standing => [[row, 3]], :up => [[row, 3]], :right => [[row, 3]], :left => [[row, 3]], :down => [[row, 3]] }
    end
    
    def sprites      
      return @sprites if @sprites

      frames = sprite_frames
      
      @sprites = {}
      frames.each do |name, positions|
        @sprites[name] = Animation.new
        positions.each do |position|
          @sprites[name].add_frame(Monos.tiles[position[0]][position[1]], ANIMATION_DURATION)
        end
      end
      
      @sprites
    end
    
    def initialize(level, x = nil, y = nil)
      @state = :standing
      @level = level
      @x = x || level.width / 2
      @y = y || level.height / 2
      @actual_x = @x
      @actual_y = @y
    end
    
    def render
      return unless @actual_x > @level.tlx - 1 && @actual_x < @level.tlx + Monos::TILES_X + 1 && @actual_y > @level.tly - 1 && @actual_y < @level.tly + Monos::TILES_Y + 1 
      x = (@actual_x - @level.tlx) * Monos::TILE_WIDTH * Monos::PIXEL_SIZE
      y = (@actual_y - @level.tly) * Monos::TILE_WIDTH * Monos::PIXEL_SIZE
      sprites[@state].draw(x, y, (Monos::TILE_PIXEL_WIDTH), (Monos::TILE_PIXEL_WIDTH))
    end
    
    def process_input(container, delta)     
      x_diff = (@x - @actual_x).abs.round
      y_diff = (@y - @actual_y).abs.round
      
      unless x_diff > 1 && y_diff > 1
        input = container.get_input
        movement_delta = 0.01 * delta
        
        # Is the key pressed and movement ready?
        left = input.is_key_down(Input::KEY_LEFT) && @x >= 0 && x_diff < 1
        right = input.is_key_down(Input::KEY_RIGHT) && @x < level.width - 1 && x_diff < 1
        up = input.is_key_down(Input::KEY_UP) && @y >= 0 && y_diff < 1
        down = input.is_key_down(Input::KEY_DOWN) && @y < level.height - 1 && y_diff < 1
        
        move(movement_delta, left, right, up, down) if left || right || up || down
      end
    end
    
    def can_visit?(cell)
      true
    end
    
    def move(movement_delta, left, right, up, down)
      if left && can_visit?(level.cell(@x - 0.5, @y))
        @x -= movement_delta
        @state = :left
      end
      if right && can_visit?(level.cell(@x + 0.5, @y))
        @x += movement_delta
        @state = :right
      end
      if up && can_visit?(level.cell(@x, @y - 0.5))
        @y -= movement_delta
        @state = :up
      end
      if down && can_visit?(level.cell(@x, @y + 0.5))
        @y += movement_delta
        @state = :down
      end
    end
    
    def tick(container, delta)
      if (@actual_x - @x).abs < 0.25
        @actual_x = @x
        @state = :standing
      end

      if (@actual_y - @y).abs < 0.25
        @actual_y = @y
        @state = :standing
      end
      
      if @actual_x < @x
        @actual_x += 0.01 * delta
      end
      if @actual_x > @x
        @actual_x -= 0.01 * delta
      end
      
      if @actual_y < @y
        @actual_y += 0.01 * delta
      end
      if @actual_y > @y
        @actual_y -= 0.01 * delta
      end     
      

      
    end
    

  end
end