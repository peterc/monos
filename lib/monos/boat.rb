module Monos
  class Boat < Creature
    def initialize(level, x = nil, y = nil)
      super
      @strength = 10
    end

    def can_visit?(cell)
      [:sea].include?(cell.name)
    end
    
    def sprite_frames
      row = 8
      frames = { :standing => [[row, 0]], :up => [[row, 2]], :right => [[row, 0]], :left => [[row, 0]], :down => [[row, 1]] }
    end
    
    #def tick(container, delta)
    #  super      
    #  process_input(container, delta)
    #end
  end
end