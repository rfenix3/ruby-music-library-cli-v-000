require 'pry'

class Genre
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
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def songs
    @songs
  end

  def add_song(song)  #song is an object
    @songs << song unless songs.include?(song)
    song.genre = self unless song.genre == self
  end

#   def self.find_or_create_by_name(genre)
# #    binding.pry
#     self.class.all.find {|a| a.name == genre}  || self.create(genre)
#   end
  
  def artists
    songs.collect{|song| song.artist}.uniq
  end
  
end