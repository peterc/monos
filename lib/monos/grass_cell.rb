module Monos
  class GrassCell < Cell
    def initialize
      super
      
      @sprite = Monos.tiles[0][2]
    end
  end
end