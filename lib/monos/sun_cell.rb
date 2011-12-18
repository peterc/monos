module Monos
  class SunCell < Cell
    def initialize
      super
      @name = :sun
      @sprite = Monos.tiles[0][10]
    end
  end
end