module Monos
  class GrassCell < Cell
    def initialize
      super
      
      @name = :grass
      
      type = rand(5)
      
      if type == 0
        @sprite = Monos.tiles[2][4]
      else
        @sprite = Monos.tiles[0][2]
      end
      
      @blocking = false
    end
  end
end