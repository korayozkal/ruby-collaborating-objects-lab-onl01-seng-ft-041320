class Artist
  attr_accessor :name, :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end
#this method allows a user to store their artist information in an array to be called back later
#puts the entire artist instance into the class method all, which includes ALL info for ALL artist objects

  def self.all
    @@all
  end
  #Different than #save, this class method allows the user to return all info from a particular artist instance

  # def self.find_or_create_by_name(name)
  #   if self.find(name)
  #     self.find(name)
  #   else
  #     self.create(name)
  #   end
  # end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end


  #This method should utilize 2 different methods, one for #find and the other for #create, than set the conditions

  def self.find(name)
    self.all.find { |artist| artist.name == name }
  end
  #Custom method to match the name of the arist being passed in with the current instance we're in
  #This makes sure that we're in the correct artists' instance

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  #When creating a new object instance in the traditional way, the return value is equal to the last variable definition
  #THIS example uses the #tap method, which allows a user to create a new instance of an object, defne its variables, and
  #return the object itself rather than the last variable in the implicit #initialize

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

end

