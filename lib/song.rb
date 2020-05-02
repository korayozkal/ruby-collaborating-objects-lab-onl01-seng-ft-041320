class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
  #  binding.pry
    new_song.save
  end

  # .new_by_filename
  #     creates a new instance of a song from the file that's passed (FAILED - 1)
  #     associates new song instance with the artist from the filename (FAILED - 2)
  #
  # Failures:
  #
  #   1) Song .new_by_filename creates a new instance of a song from the file that's passed
  #      Failure/Error: expect(new_instance.name).to eq('Black or White')
  #
  #      NoMethodError:
  #        undefined method `name' for nil:NilClass
  #      # ./spec/song_spec.rb:29:in `block (3 levels) in <top (required)>'
  #
  #   2) Song .new_by_filename associates new song instance with the artist from the filename
  #      Failure/Error: expect(new_instance.artist.name).to eq('Michael Jackson')
  #
  #      NoMethodError:
  #        undefined method `artist' for nil:NilClass
  #      # ./spec/song_spec.rb:35:in `block (3 levels) in <top (required)>'
  #
  # Finished in 0.01781 seconds (files took 0.24681 seconds to load)
  # 16 examples, 2 failures
  #
  # Failed examples:
  #
  # rspec ./spec/song_spec.rb:27 # Song .new_by_filename creates a new instance of a song from the file that's passed
  # rspec ./spec/song_spec.rb:32 # Song .new_by_filename associates new song instance with the artist from the filename
  #



  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end

  def save
    @@all << self
    @self
  end

end