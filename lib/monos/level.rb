module Monos
  class Level
    attr_reader :cells, :width, :height, :tlx, :tly
    
    def initialize(island_size_x = 0, island_size_y = 0)
      @cells = []
      @width = 60
      @height = 60
      @tlx, @tly = 0, 0
      
      @height.times do
        sa = []
        @width.times do
          v = SeaCell.new
          sa << v
        end
        @cells << sa
      end
      
      yield @cells if block_given?
      
      return if island_size_x == 0
      
      middle_width = @width / 2
      middle_height = @height / 2
      island_min_x = middle_width -  island_size_x # (middle_width / 3)
      island_max_x = middle_width +  island_size_x # (middle_width / 3)
      island_min_y = middle_height - island_size_y #(middle_height / 3)
      island_max_y = middle_height + island_size_y #(middle_height / 3)
      
      island_min_y.upto(island_max_y).each do |y|
        island_min_x.upto(island_max_x).each do |x|
          if (x == island_min_x || x == island_max_x || y == island_max_y || y == island_min_y)
            @cells[y][x] = case rand(7)
            when 0
              SeaCell.new
            when 1
              GrassCell.new
            when 2..6
              SandCell.new
            end
          else
            @cells[y][x] = GrassCell.new
          end
        end        
      end
      
      
      #@cells.map! { |r| r[0] = WallCell.new; r[-1] = WallCell.new; r }
      #@cells[0] = [WallCell.new] * @width
      #@cells[-1] = [WallCell.new] * @width
    end
    
    def cell(x, y)
      @cells[y.round][x.round]
    end
    
    def render(player)
      unless player
        player = Object.new
        def player.actual_x; rand(40)+13; end
        def player.actual_y; rand(40)+13; end
      end
      
      offset_x, offset_y = player.actual_x * -1 + CENTER_TILE_X, player.actual_y * -1 + CENTER_TILE_Y
      
      @tlx, @tly = player.actual_x - CENTER_TILE_X, player.actual_y - CENTER_TILE_Y
      #offset_x, offset_y = @offset_x, @offset_y
      
      cells.each_with_index do |row, y|
        row.each_with_index do |cell, x|
          xpos = x * 8 + (offset_x * 8)
          ypos = y * 8 + (offset_y * 8)
          
          if xpos > -8 && xpos < Monos::SCALED_WIDTH && ypos > -8 && ypos < Monos::SCALED_HEIGHT
            
            x1 = (xpos * Monos::PIXEL_SIZE).round
            y1 = (ypos * Monos::PIXEL_SIZE).round
            x2 = x1 + (Monos::TILE_PIXEL_WIDTH)
            y2 = y1 + (Monos::TILE_PIXEL_WIDTH)
            #@sprite.draw(x, y, x2, y2, 0, 0, 7, 7)
            #tileset[col].draw((x1 * 10).round / 10.0, (ypos * 10).round / 10.0)
            cell.render(x1, y1, x2, y2)
          end
        end
      end
    end
  end
end