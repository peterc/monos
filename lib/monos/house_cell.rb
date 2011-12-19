module Monos
  class HouseCell < Cell
    def initialize(x, y)
      super
      @name = :house
      @sprite = Monos.tiles[0][11]
    end
  end
end