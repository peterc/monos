module Monos
  class Cell
    attr_reader :sprite
    
    def initialize
      @sprite = Monos.tiles[0][0]
    end
    
    def render(x1, y1, x2, y2)
      
      @sprite.draw(x1, y1, (Monos::PIXEL_SIZE * 8), (Monos::PIXEL_SIZE * 8)) #x2, y2, 0, 0, 8, 8)
    end
  end
end