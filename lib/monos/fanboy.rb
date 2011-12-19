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
      frames = { :dead => [[row, 9]], :standing => [[row, 0]], :up => [[row, 1], [row, 4]], :right => [[row, 2], [row, 5]], :left => [[row, 3], [row, 6]], :down => [[row, 7], [row, 8]] }
    end
    
    def tick(container, delta)
      super      
      
      return if @state == :dead
      
      sp = 0.003
      
      movement_delta = sp * delta
      
      left, right, up, down = false, false, false, false
      
      if @level.player.x - 1 > @x 
        right = true
      elsif @level.player.x + 1 < @x
        left = true
      end

      if @level.player.y - 1 > @y
        down = true
      elsif @level.player.y + 1 < @y
        up = true
      end
      
      move(movement_delta, left, right, up, down)
    end
  end
end