class BoroughAssociationGame < CommandLineInterface

  def greet
    system('clear')
    
    puts "Welcome to the Borough Association Game!".colorize(:green)
  end

  def print_menu
    puts ""
    puts "MENU"
    puts "----"
    puts ""
    puts "1. Fill in the Blanks"
    puts "2. Guess Borough by Station Name"
    puts "0. Exit to Main Menu"
    puts ""

  end

  def play
    greet
    print_menu
    input = self.gets_user_input

    if input == "1"
      game = FillInTheBlanks.new
      game.play
    elsif input == "2"
      game = GuessBoroughByStationName.new
      game.play
    elsif input == "0"
      new_cli = CommandLineInterface.new
      new_cli.start
    else
      puts "Invalid choice, please try again!"
      start
    end
  end

  def print_game_commands
    puts ""
    puts "Game Commands:".upcase
    puts "--------------"
    puts ""
    puts "M - Manhattan"
    puts "B - Brooklyn"
    puts "Q - Queens"
    puts "X - Bronx"
    puts ""
    puts "H - Hint (Cross-Streets)"
    puts "N - Next (I Still Don't Know)"
    puts ""
    puts "1 - Show Menu"
    puts "2 - Return to Games Menu"
    puts "0 - Return to Main Menu"
    puts ""
  end

  def choose_station
    random_station = {}
    random_index = rand(0 .. Station.all.count - 1)
    station = Station.all[random_index]
    station_lines = ""
    station.train_lines.uniq.each { |line| station_lines << "#{line.name}-" }
    if station_lines.last == "-"
      station_lines.chop!
    end
    # binding.pry
    if station.station_entrances.all.length > 0
      station_entrances = "#{station.station_entrances.first.ns_street} and #{station.station_entrances.first.ew_street}"
    else
      station_entrances = "Sorry, no hint boo"
    end
    random_station[:name] = station.name
    random_station[:lines] = station_lines
    random_station[:entrances] = station_entrances
    random_station[:borough] = station.borough
    random_station
  end

  def print_station(station)
    phrase = "The #{station[:name].colorize(:green)} #{station[:lines].colorize(:green)} Station is in which borough?"
    underlines = ""
    phrase.length.times { underlines << "-" }
    puts underlines
    puts ""
    puts phrase
    puts ""
    puts underlines
    puts ""
  end

  def give_hint(station)
    puts ""
    puts "Hint: this station's cross streets are #{station[:entrances]}"
    puts ""
  end

  def confirm_input(station)
    station_record = Station.find_by(name: station[:name])
    puts ""
    puts "You've told us #{station[:name]} is in #{station_record.borough}".colorize(:yellow)
    puts ""
  end

end
