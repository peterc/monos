module Monos
  class SeaCell < Cell
    def initialize
      super
      @name = :sea
      
      type = rand(12)
      if type == 0
        @sprite = Monos.tiles[0][7]        
      elsif type == 1
        @sprite = Animation.new
        @sprite.add_frame(Monos.tiles[0][7], rand(10000) + 4000)
        @sprite.add_frame(Monos.tiles[0][8], 1000)
      elsif type == 2
        @sprite = Animation.new
        @sprite.add_frame(Monos.tiles[0][7], rand(10000) + 2000)
        @sprite.add_frame(Monos.tiles[0][9], 800)        
      else
        @sprite = Monos.tiles[0][6]
      end
    end
  end
end