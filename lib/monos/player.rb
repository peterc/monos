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
    
    def process_input(input)
      if input.is_key_pressed(Input::KEY_LEFT)
        @x -= 1
      end
      if input.is_key_pressed(Input::KEY_RIGHT)
        @x += 1
      end
      if input.is_key_pressed(Input::KEY_UP)
        @y -= 1
      end
      if input.is_key_pressed(Input::KEY_DOWN)
        @y += 1
      end
    end
    
    def tick
      if (@actual_x - @x).abs < 0.1
        @actual_x = @x
      end

      if (@actual_y - @y).abs < 0.1
        @actual_y = @y
      end
      
      if @actual_x < @x
        @actual_x += 0.1
      end
      if @actual_x > @x
        @actual_x -= 0.1
      end
      
      if @actual_y < @y
        @actual_y += 0.1
      end
      if @actual_y > @y
        @actual_y -= 0.1
      end
    end
    
    def render
      @sprite.draw(12 * 8, 7 * 8)
    end
  end
end