Bodge (codename was 'Monos')
============================

![Bodge in-game screenshot](https://github.com/peterc/monos/raw/master/misc/bodge-shot3.png)

Bodge is a game I built for the Ludum Dare #22 48 hour game development contest (the theme was 'alone'). 'Monos' (Greek for alone) was the codename prior to it being called Bodge and is still used throughout the codebase.

Story
-----

You are Bodge, a famous game developer who created 'Shaftcraft', the most famous game of all time. You want some peaceful alone time on your private island but those darn fanboys keep ruining things. You decide to remain alone at all costs.

Tech and Tools
--------------

Bodge is written in Ruby and uses JRuby, Slick and LWJGL for the magic. My conclusion so far? I might just learn Java properly instead. Nothing wrong with JRuby as such but you run into quite a few sticking points that other people haven't encountered. My first several hours were spent learning how to package the game.

DIARY.txt contains a diary that I updated about my progress. I will probably continue to update it post competition too. The commit 71f6757f80 reflects the state of the game that went into the competition entry. I will be continuing to develop the game but cannot submit a newer version.

Full technologies list:

* JRuby 1.6.5 (managed with RVM)
* Warbler (packages into jar file)
* Launch4j (creates packed .exe for Windows)
* Jar Bundler (comes with Xcode - makes .app file for OS X from jar)
* Logic Pro (used for music and sound FX)
* Audacity (used for sound FX)
* VMware Fusion (for testing on Windows)

Scripts
-------

* `bin/run` - Runs game under JRuby directly
* `bin/build_jar` - Removes old jar file (if any) and builds a new jar for packaging or running
* `bin/run_jar` - Runs the jar file with Java
* `bin/windows_build` - Only for me to use, not much point for anyone else as it has paths you won't have.

Directories
-----------

* `bin` - scripts and game runner
* `data` - game data, sounds, fonts, images, etc.
* `lib` - game code plus slick and LWJGL libraries
* `misc` - miscellaneously, currently just a Launch4j build file
* `native` - native libraries for OS X, Linux and Windows

Notes
-----

For some reason, loading jogg-0.0.7.jar does not put its classes into
scope, as happens with every other jar.. so jogg-0.0.7.jar needs to be
included as 'native' for a deployment. Eugh. I ran into lots of issues of this
nature.

Licenses
--------

Game and content is BSD licensed and is copyright Peter Cooper, 2011.

I created all of the graphics and music/sounds during the 48 hours, as per the Ludum Dare rules.