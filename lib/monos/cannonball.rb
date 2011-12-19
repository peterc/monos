module Monos
  class Cannonball < Creature
    attr_accessor :dx, :dy
    
    def initialize(level, x = nil, y = nil)
      super
    end

    def can_visit?(cell)
      true
    end
    
    def can_move?
      true
    end
    
    def sprite_frames
      row, col = 4, 6
      frames = { :dead => [[row, col]], :standing => [[row, col]], :up => [[row, col]], :right => [[row, col]], :left => [[row, col]], :down => [[row, col]] }
    end
    
    def tick(container, delta)
      super      
  
      return if @state == :dead
      
      if enemy = surrounded_by(Monos::Fanboy)
        @level.entities.delete(self)
        enemy.kill
      end
      
      sp = 0.02
      
      movement_delta = sp * delta
      
      left, right, up, down = false, false, false, false
          
      right = true if dx > 0
      left = true if dx < 0
      up = true if dy < 0
      down = true if dy > 0

      move(movement_delta, left, right, up, down)
    end
  end
end