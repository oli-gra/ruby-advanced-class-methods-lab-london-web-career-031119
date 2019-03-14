require'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create_by_name(name)
    else
      return find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by!{|song|song.name}
  end

  def self.new_from_filename(mp3)
    song = self.new
    song_data = mp3.split(/[-.]/)
    song.artist_name = song_data[0].strip
    song.name = song_data[1].strip
    song.save
    song
  end

  def self.create_from_filename(name)
    new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear
  end

end
