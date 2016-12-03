# require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []
 

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(filename)
    array = filename.split(" - ")
    song = self.find_or_create_by_name(array[1].gsub(".mp3", ""))
    artists_name = array[0]
    song.artist_name = artists_name
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.create_by_name(name)
    song = self.new(name)
    song
  end 

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end
end
