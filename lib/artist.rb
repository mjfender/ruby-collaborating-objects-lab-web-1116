# require 'pry'

class Artist
  attr_accessor :name, :save, :all, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect do |artist|
      artist.name == name
    end
  end

  def self.create_by_name(name)
    new_song = Artist.new(name)
    new_song.save
  end

   def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      return self.create_by_name(name)
    end
  end

  def add_song(song)
    songs << song
    song
  end

  def print_songs
    self.songs.each {|item| puts item.name}
  end

  def save
    @@all << self
    self
  end

end