#$: << File.expand_path('..', __FILE__)

java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.state.StateBasedGame
java_import org.newdawn.slick.state.BasicGameState
java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Image
java_import org.newdawn.slick.ImageBuffer
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer
java_import org.newdawn.slick.UnicodeFont
java_import org.newdawn.slick.SpriteSheet
java_import org.newdawn.slick.Sound
java_import org.newdawn.slick.Music
java_import org.newdawn.slick.font.HieroSettings
java_import org.newdawn.slick.font.effects.ColorEffect
java_import org.newdawn.slick.Color
java_import org.newdawn.slick.Animation
#java_import com.jcraft.jogg.Buffer
#java_import com.jcraft.jogg.SyncState

require 'monos/level'
require 'monos/player'
require 'monos/game'
require 'monos/gameplay_state'
require 'monos/intro_state'
require 'monos/cell'
require 'monos/grass_cell'
require 'monos/wall_cell'
require 'monos/sea_cell'

module Monos
  VIEWPORT_WIDTH = 512
  VIEWPORT_HEIGHT = 448
  PIXEL_SIZE = 4
  SCALED_WIDTH = VIEWPORT_WIDTH / PIXEL_SIZE
  SCALED_HEIGHT = VIEWPORT_HEIGHT / PIXEL_SIZE
  FULL_SCREEN = false
  VSYNC = true
  TARGET_FPS = 60
  
  def self.load_assets
    tile_sheet = SpriteSheet.new(Image.new(RELATIVE_ROOT + 'data/tiles.png'), 8, 8)
    @tiles = (0..5).map do |y|
      (0..10).map do |x|
        im = tile_sheet.get_sub_image(x, y)
        im.set_filter(Image::FILTER_NEAREST)
        im
      end
    end
  end
  
  def self.tiles
    @tiles
  end
end

