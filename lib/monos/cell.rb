module Monos
  class Cell
    attr_reader :sprite, :name, :x, :y
    
    def initialize(x, y)
      @sprite = Monos.tiles[0][0]
      @x, @y = x, y
      @blocking = true
      @name = :cell
    end
    
    def render(x1, y1, x2, y2)
      @sprite.draw(x1, y1, (Monos::TILE_PIXEL_WIDTH), (Monos::TILE_PIXEL_WIDTH)) #x2, y2, 0, 0, 8, 8)
    end
    
    #def blocks?(entity = nil)
    #  return @blocking unless entity
    #        
    #  @blocking
    #end
  end
end