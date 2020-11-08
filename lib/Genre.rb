class Genre
    extend Concerns::Findable

    attr_accessor :name 

    @@all = [] 
    
    def initialize(name)
        @name = name 
        @songs = []
        self.save 
    end

    def self.create(name)
        Genre.new(name)
    end

    def self.all 
        @@all 
    end

    def artists
        @songs.collect{|s| s.artist}.uniq
    end 

    def songs 
        @songs 
    end 

    def add_song(song)
        song.genre = genre if song.genre == nil
        @songs << song if @songs.include?(song) == false
    end 

    def save 
        @@all << self 
    end 

    def self.destroy_all
        @@all.clear 
    end 
end 