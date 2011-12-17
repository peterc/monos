module Monos
  class Player
    attr_accessor :x, :y, :actual_x, :actual_y
    
    def initialize(sprite)
      @x = 20
      @y = 20
      @actual_x = 20
      @actual_y = 20
      @sprite = sprite
    end
    
    def process_input(container, delta)
      input = container.get_input
      
      movement_delta = 0.01 * delta
      x_diff = (@x - @actual_x).abs.round
      y_diff = (@y - @actual_y).abs.round
      
      if input.is_key_down(Input::KEY_LEFT) && @x >= 0 && x_diff < 2
        @x -= movement_delta
      end
      if input.is_key_down(Input::KEY_RIGHT) && @x <= 100 && x_diff < 2
        @x += movement_delta
      end
      if input.is_key_down(Input::KEY_UP) && @y >= 0 && y_diff < 2
        @y -= movement_delta
      end
      if input.is_key_down(Input::KEY_DOWN) && @y <= 100 && y_diff < 2
        @y += movement_delta
      end
    end
    
    def tick(container, delta)
      process_input(container, delta)
      
      if (@actual_x - @x).abs < 0.1
        @actual_x = @x
      end

      if (@actual_y - @y).abs < 0.1
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
      
      @actual_x = (@actual_x * 10).round / 10.0
      @actual_y = (@actual_y * 10).round / 10.0
    end
    
    def render
      @sprite.draw(8 * 8, 6 * 8)
    end
  end
end