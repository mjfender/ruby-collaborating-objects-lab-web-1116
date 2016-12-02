# require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []
 

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end


  def self.new_by_name(name)
    song = self.new(name)
    song
  end

  def self.create_by_name(name)
    song = self.new(name)
    # song.name = name
    song
  end 

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      puts "#{name} #{self.find_by_name(name)}"
      return self.find_by_name(name)
    else
      puts "#{name} #{self.create_by_name(name)}"
      return self.create_by_name(name)
    end
  end

  def self.new_by_filename(filename)
    array = filename.split(" - ")
    song = self.find_or_create_by_name(array[1].gsub(".mp3", ""))
    if not song.artist
      new_artist = Artist.find_or_create_by_name(array[0])
      song.artist = new_artist
    end
     song
  end

  # def self.create_from_filename(filename)
  #   self.new_from_filename(filename).save
  # end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
    self
  end

end
