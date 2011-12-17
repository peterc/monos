module Monos
  class Player
    attr_accessor :x, :y
    
    def initialize(sprite)
      @x = 20
      @y = 20
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
    
    def render
      @sprite.draw(12 * 8, 7 * 8)
    end
  end
end