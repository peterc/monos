module Monos
  class Level
    attr_reader :cells
    
    def initialize
      @cells = []
      
      100.times do
        sa = []
        100.times do
          v = 2
          v = 0 if rand(10) == 0
          v = 1 if rand(10) == 0
          sa << v
        end
        @cells << sa
      end
    end
    
    def render(tileset, offset_x, offset_y)
      cells.each_with_index do |row, y|
        row.each_with_index do |col, x|
          xpos = x * 8 + (offset_x * 8)
          ypos = y * 8 + (offset_y * 8)
          
          if xpos > -8 && xpos < Monos::SCALED_WIDTH && ypos > -8 && ypos < Monos::SCALED_HEIGHT
            tileset[col].draw(xpos, ypos)
          end
        end
      end
    end
  end
end