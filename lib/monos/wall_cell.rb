module Monos
  class WallCell < Cell
    def initialize(x, y)
      super
      @name = :wall
      @sprite = Monos.tiles[0][4]
    end
  end
end