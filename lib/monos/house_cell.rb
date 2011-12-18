module Monos
  class HouseCell < Cell
    def initialize
      super
      @name = :house
      @sprite = Monos.tiles[0][11]
    end
  end
end