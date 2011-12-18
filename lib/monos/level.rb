module Monos
  class Level
    attr_reader :cells, :width, :height
    
    def initialize
      @cells = []
      @width = 100
      @height = 100
      
      @height.times do
        sa = []
        @width.times do
          v = SeaCell.new
          sa << v
        end
        @cells << sa
      end
      
      @cells.map! { |r| r[0] = WallCell.new; r[-1] = WallCell.new; r }
      @cells[0] = [WallCell.new] * @width
      @cells[-1] = [WallCell.new] * @width
    end
    
    def render(player)
      offset_x, offset_y = player.actual_x * -1 + 8, player.actual_y * -1 + 6
      cells.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          xpos = x * 8 + (offset_x * 8)
          ypos = y * 8 + (offset_y * 8)
          
          if xpos > -8 && xpos < Monos::SCALED_WIDTH && ypos > -8 && ypos < Monos::SCALED_HEIGHT
            
            x1 = (xpos * Monos::PIXEL_SIZE).round
            y1 = (ypos * Monos::PIXEL_SIZE).round
            x2 = x1 + (Monos::PIXEL_SIZE * 8)
            y2 = y1 + (Monos::PIXEL_SIZE * 8)
            #@sprite.draw(x, y, x2, y2, 0, 0, 7, 7)
            #tileset[col].draw((x1 * 10).round / 10.0, (ypos * 10).round / 10.0)
            cell.render(x1, y1, x2, y2)
          end
        end
      end
    end
  end
end