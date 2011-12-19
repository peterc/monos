module Monos
  class Boat < Creature
    def initialize(level, x = nil, y = nil)
      super
      @strength = 10
    end

    def can_visit?(cell)
      return false unless cell
      [:sea].include?(cell.name)
    end
    
    def sprite_frames
      row = 8
      frames = { :dead => [[row, 0]], :standing => [[row, 0]], :up => [[row, 2]], :right => [[row, 0]], :left => [[row, 0]], :down => [[row, 1]] }
    end
    
    def tick(container, delta)
      super
      
      return if @state == :dead
            
      sp = (rand(4) * 0.001) + 0.001
      
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
      
      if land = surrounded_by(Monos::SandCell)
        @can_move = false
        @state = :dead
        @level.entities << Fanboy.new(@level, land.x, land.y)
        Sound.new(RELATIVE_ROOT + 'data/loveyou.ogg').play
      end
      
      move(movement_delta, left, right, up, down)
    end
  end
end