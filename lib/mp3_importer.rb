require 'pry'
require_relative "artist.rb"
require_relative "song.rb"


class MP3Importer
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
    @files = []
    Dir.entries(path).each {|wah| files.push(wah) if wah.end_with?(".mp3") }
  end

  def import
    @files.each do |file|
      new_artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      new_song = Song.new_by_filename(file)
      new_song.artist = new_artist
      new_artist.add_song(new_song)
    end
  end

end