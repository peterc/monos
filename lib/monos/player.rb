module Monos
  class Player
    attr_accessor :x, :y, :actual_x, :actual_y, :level
    
    def initialize(sprite, level)
      @sprite = sprite
      @level = level
      @x = level.width / 2
      @y = level.height / 2
      @actual_x = @x
      @actual_y = @y
    end
    
    def process_input(container, delta)     
      x_diff = (@x - @actual_x).abs.round
      y_diff = (@y - @actual_y).abs.round
      
      unless x_diff > 1 && y_diff > 1
        input = container.get_input
        movement_delta = 0.01 * delta
        left = input.is_key_down(Input::KEY_LEFT) && @x >= 0 && x_diff < 1
        right = input.is_key_down(Input::KEY_RIGHT) && @x < level.width - 1 && x_diff < 1
        up = input.is_key_down(Input::KEY_UP) && @y >= 0 && y_diff < 1
        down = input.is_key_down(Input::KEY_DOWN) && @y < level.height - 1 && y_diff < 1

        if left
          @x -= movement_delta
        end
        if right
          @x += movement_delta
        end
        if up
          @y -= movement_delta
        end
        if down
          @y += movement_delta
        end
      end
    end
    
    def tick(container, delta)
      process_input(container, delta)
      
      if (@actual_x - @x).abs < 0.25
        @actual_x = @x
      end

      if (@actual_y - @y).abs < 0.25
        @actual_y = @y
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
    
    def render
      x = 8 * 8 * Monos::PIXEL_SIZE
      y = 6 * 8 * Monos::PIXEL_SIZE
      x2 = x + (Monos::PIXEL_SIZE * 8)
      y2 = y + (Monos::PIXEL_SIZE * 8)
      @sprite.draw(x, y, x2, y2, 0, 0, 7, 7)
    end
  end
end