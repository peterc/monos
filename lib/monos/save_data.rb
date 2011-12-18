module Monos
  class SaveData
    def self.muffin
      @muffin ||= FileMuffin.new
      @phash ||= @muffin.load_file(MUFFIN_FILE) rescue {}
      @phash
    end
    
    def self.store(key, value)
      muffin[key] = value
    end
    
    def self.get(key)
      muffin[key]
    end
    
    def self.save
      #return unless @muffin
      #unless File.exist?(MUFFIN_FILE)
      #  File.open(MUFFIN_FILE, "w+") { }
      #end
      #@muffin.save_file(muffin, MUFFIN_FILE)
      
      # TODO: Has stupid exception caused by the muffin stuff cramming
      # extra crap into the filename?
      #
      # java.io.FileNotFoundException'; Message: /Users/peter/.java/Users/peter/Dropbox/dev/monos/savegame.dat (No such file or directory)
    end
  end
end