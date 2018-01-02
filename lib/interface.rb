module Interface
  include Wrapper

  def self.run
    self.welcome
    self.main_menu_loop
    self.goodbye
  end

  def self.welcome
    puts "Welcome to Record Player for Discogs."
    puts "Please ensure you have stored your Discogs USER_TOKEN in lib/application.yml before continuing."
  end

  def self.main_menu
    puts "Would you like to import a collection, manage playlists, or exit?"
    puts "Type 'import', 'playlists', or 'exit' to make your choice."
  end


  def self.import_menu
    puts "Type the user whose collection you'd like to import."
    Wrapper.import_collection(STDIN.gets.chomp.downcase)
  end

  def self.playlist_menu
    puts "What would you like to do?"
    puts "'view' - View all playlists."
    puts "'play' - Play a playlist."
    puts "'create' - Create a playlist."
    puts "'edit' - Edit a playlist."
    puts "'return' - Return to the main menu."
    response = STDIN.gets.chomp.downcase
    case response
    when "view"
      Playlist.all.each{|playlist| puts playlist.name}
    when "play"
      "Type the name of the playlist you'd like to play, or 'all' for all tracks."
      nxt_response = STDIN.gets.chomp.downcase
      case nxt_response
      when "all"
        Wrapper.play
      else
        Wrapper.play(Playlist.find_by(name: response).tracks)
      end
    when "edit"
      "Type the name of the playlist you'd like to edit."
      response = STDIN.gets.chomp.downcase
      "Type the new name of the playlist."
      new_name = STDIN.gets.chomp.downcase
      Playlist.find_by(name: response).name = new_name
    when "return"
      return
    end
  end

  def self.main_menu_loop
    response = nil
    while response != "exit"
      self.main_menu
      response = STDIN.gets.chomp.downcase
      case response
      when "exit"
        next
      when "import"
        self.import_menu
      when "playlists"
        self.playlist_menu
      else
        "Invalid response. Try again."
      end
    end
  end


  def self.goodbye
    "Thank you for using Record Player for Discogs."
  end
end
