module Monos
  class Level
    attr_reader :cells, :width, :height
    
    def initialize
      @cells = []
      @width = 10
      @height = 10
      
      @height.times do
        sa = []
        @width.times do
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
            
            x1 = (xpos * Monos::PIXEL_SIZE).round
            y1 = (ypos * Monos::PIXEL_SIZE).round
            x2 = x1 + (Monos::PIXEL_SIZE * 8)
            y2 = y1 + (Monos::PIXEL_SIZE * 8)
            #@sprite.draw(x, y, x2, y2, 0, 0, 7, 7)
            #tileset[col].draw((x1 * 10).round / 10.0, (ypos * 10).round / 10.0)
            tileset[col].draw(x1, y1, x2, y2, 0, 0, 8, 8)
          end
        end
      end
    end
  end
end