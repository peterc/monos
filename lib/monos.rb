#$: << File.expand_path('..', __FILE__)

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
java_import org.newdawn.slick.font.HieroSettings
java_import org.newdawn.slick.font.effects.ColorEffect
java_import org.newdawn.slick.Color

require 'monos/level'
require 'monos/player'
require 'monos/game'

module Monos
  #VIEWPORT_WIDTH = 800
  #VIEWPORT_HEIGHT = 480
  VIEWPORT_WIDTH = 512
  VIEWPORT_HEIGHT = 448
  PIXEL_SIZE = 4
  SCALED_WIDTH = VIEWPORT_WIDTH / PIXEL_SIZE
  SCALED_HEIGHT = VIEWPORT_HEIGHT / PIXEL_SIZE
  FULL_SCREEN = false
end