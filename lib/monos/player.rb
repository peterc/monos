module Monos
  class Player
    attr_accessor :x, :y, :actual_x, :actual_y, :level
    
    ANIMATION_DURATION = 100
    
    def sprites      
      return @sprites if @sprites

      frames = { :standing => [0], :up => [1, 4], :right => [2, 5], :left => [3, 6], :down => [7, 8] }
      
      @sprites = {}
      frames.each do |name, positions|
        @sprites[name] = Animation.new
        positions.each do |position|
          @sprites[name].add_frame(Monos.tiles[1][position], ANIMATION_DURATION)
        end
      end
      
      @sprites
    end
    
    def initialize(level)
      @state = :standing
      @level = level
      @x = level.width / 2
      @y = level.height / 2
      @actual_x = @x
      @actual_y = @y
    end
    
    def render
      x = 8 * 8 * Monos::PIXEL_SIZE
      y = 6 * 8 * Monos::PIXEL_SIZE
      x2 = x + (Monos::PIXEL_SIZE * 8)
      y2 = y + (Monos::PIXEL_SIZE * 8)
      sprites[@state].draw(x, y, (Monos::PIXEL_SIZE * 8), (Monos::PIXEL_SIZE * 8)) #, 0, 0, 8, 8)
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
    
    def move(movement_delta, left, right, up, down)
      if left #&& @level.cell
        @x -= movement_delta
        @state = :left
      end
      if right
        @x += movement_delta
        @state = :right
      end
      if up
        @y -= movement_delta
        @state = :up
      end
      if down
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
      
      process_input(container, delta)
      
    end
    

  end
end