module Monos
  class SandCell < Cell
    def initialize(x, y)
      super
      @name = :sand
      @sprite = Monos.tiles[0][5]
      @blocking = false
    end
  end
end