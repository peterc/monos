module Monos
  class SeaCell < Cell
    def initialize
      super
      
      type = rand(10)
      if type == 0
        @sprite = Monos.tiles[0][7]        
      elsif type == 1
        @sprite = Animation.new
        @sprite.add_frame(Monos.tiles[0][7], rand(10000) + 2000)
        @sprite.add_frame(Monos.tiles[0][8], 100)
      else
        @sprite = Monos.tiles[0][6]
      end
    end
  end
end