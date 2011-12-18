module Monos
  class FakePlayer < Creature
    def tick(container, delta)
      super
      
      movement_delta = 0.005 * delta
      
      left, right, up, down = false, false, false, false
      
      if @x > 12 && @y >= 30
        left = true
      elsif @x < 40 && @y < 12
        right = true
      elsif @y > 12 && @x <= 12
        up = true
      elsif @y <= 40
        down = true
      end      
      
      move(movement_delta, left, right, up, down)
    end
  end
end