module Monos
  class WallCell < Cell
    def initialize
      super
      
      @sprite = Monos.tiles[0][4]
    end
  end
end