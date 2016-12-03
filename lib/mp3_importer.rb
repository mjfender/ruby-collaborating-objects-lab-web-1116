require 'pry'
require_relative "artist.rb"
require_relative "song.rb"


class MP3Importer
  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.entries(path).select {|wah| wah.end_with?(".mp3") }
  end 

  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end

#new_artist = Artist.find_or_create_by_name(file.split(" - ")[0])
