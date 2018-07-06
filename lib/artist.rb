require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    #self.class.all << self
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)  #song is an object
    @songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self

  end

  # def self.find_or_create_by_name(artist)
  #   # binding.pry
  #   self.class.all.find {|a| a.name == artist}  || self.create(artist)
  # end
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end

end