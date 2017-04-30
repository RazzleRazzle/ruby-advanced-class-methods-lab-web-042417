require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    (song = self.new).save
    song
  end

  def self.new_by_name(name)
    (song = self.new).save
    song.name=(name)
    song
  end

  def self.create_by_name(name)
    (song = self.new).save
    song.name=(name)
    song
  end

  def self.find_by_name(name)
    @@all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(song)
     if self.find_by_name(song) == true
        self.find_by_name(song)
      else
        self.create_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by { |s| s.name[0] }
  end

  def self.new_from_filename(mp3)
    demp3 = mp3.split(/[.]/)
    splitinfo = demp3[0].split(/\ - /)
    (song = self.new).save
    song.name=(splitinfo[1])
    song.artist_name=(splitinfo[0])
    song
  end

  def self.create_from_filename(name)
    demp3 = name.split(/[.]/)
    splitinfo = demp3[0].split(/\ - /)
    (song = self.new).save
    song.name=(splitinfo[1])
    song.artist_name=(splitinfo[0])
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end

end
