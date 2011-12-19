module Monos
  class Turret < Creature
    def initialize(level, x = nil, y = nil)
      super
    end

    def can_visit?(cell)
      false
    end
    
    def can_move?
      false
    end
    
    def sprite_frames
      frames = { :standing => [[4, 5]] }
    end
    
    #def tick(container, delta)
    #  super      
    #  process_input(container, delta)
    #end
  end
end