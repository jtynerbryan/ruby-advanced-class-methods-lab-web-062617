class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    #self is the object recieving #save, 
    #then shovel self into @@all using the class method #self.all
    self.class.all << self
  end

  def self.create
  	self.new.save
  	@@all.last
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    @@all.last
  end

  def self.find_by_name(name)
    @@all.select {|song| song.name == name}.first
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name.split[0]}
  end

  def self.new_from_filename(name)
    name = name.split(" - ")
    name[1].slice!(".mp3")
    artist_name = name[0]
    name = name[1]
    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = name
    new_song
  end

  def self.create_from_filename(name)
    new_song = self.new_from_filename(name)
    new_song.save
    @@all.last
  end

  def self.destroy_all
  	@@all.clear
  end
end