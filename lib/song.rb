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
    @@all << self.new
    @@all.last#returns last element of @@all array
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    create_song_instance = self.new
    create_song_instance.name = name
    create_song_instance.save
    create_song_instance
  end

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    new_song = self.find_by_name(name)
    if new_song
      new_song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    songs_in_order = @@all.sort_by!{|song| song.name}
    songs_in_order
  end

  def self.new_from_filename(filename)
    song_array = filename.split(/[\s|-|.]/)
    song_array
  end

end
