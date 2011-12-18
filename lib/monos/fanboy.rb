module Monos
  class Fanboy < Creature
    def initialize(level, x = nil, y = nil)
      super
      @strength = 2
    end

    def can_visit?(cell)
      [:grass, :sand, :house].include?(cell.name)
    end
    
    def sprite_frames
      row = 9
      frames = { :standing => [[row, 0]], :up => [[row, 1], [row, 4]], :right => [[row, 2], [row, 5]], :left => [[row, 3], [row, 6]], :down => [[row, 7], [row, 8]] }
    end
    
    #def tick(container, delta)
    #  super      
    #  process_input(container, delta)
    #end
  end
end