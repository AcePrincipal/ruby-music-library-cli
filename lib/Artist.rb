class Artist
    attr_accessor :name 

    @@all = [] 
    
    def initialize(name)
        @name = name 
        @songs = []
        self.save 
    end

    def self.create(name)
        Artist.new(name)
    end

    def self.all 
        @@all 
    end

    def genres 
        @songs.collect{ |s| s.genre }.uniq 
    end 

    def add_song(song)
        song.artist = self if song.artist == nil
        @songs << song if @songs.include?(song) == false 
    end 

    def songs 
        @songs 
    end 

    def save 
        @@all << self 
    end 

    def self.destroy_all
        @@all.clear 
    end 
end 