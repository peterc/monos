ROOT_DIR = File.expand_path('../..', __FILE__)
$: << ROOT_DIR + "/lib"

# Need a different root when inside the jar, luckily $0 is "<script>" in that case
RELATIVE_ROOT = $0['<'] ? 'monos/' : ''

require 'java'
require 'lwjgl.jar'
require 'slick.jar'
require 'jogg-0.0.7.jar'
require 'jorbis-0.0.15.jar'

$CLASSPATH << 'jogg-0.0.7.jar'

MUFFIN_FILE = ROOT_DIR + "/savegame.dat"

require 'monos'
Monos::Game.start
