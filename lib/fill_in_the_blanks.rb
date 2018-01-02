class FillInTheBlanks < BoroughAssociationGame
  def play
    fill_in_the_blanks_greeting
    self.print_game_commands
    cycle_fill_in_the_blanks
  end

  def cycle_fill_in_the_blanks
    station = self.choose_station
    if station[:borough] != nil
      station = self.choose_station
    end
    # binding.pry
    self.print_station(station)
    handle_input(station)
  end

  def fill_in_the_blanks_greeting
    system('clear')
    puts "Fill in the Blanks".upcase
    puts "------------------"
    puts ""
    puts "This game randomly selects stations with no borough information and you fill it in.\n"
  end

  def handle_input(station)
    input = self.gets_user_input.downcase
    station_record = Station.find_by(name: station[:name])

    if input == "m"
      station_record.update(borough: "Manhattan")
      self.confirm_input(station)
      cycle_fill_in_the_blanks
    elsif input == "b"
      station_record.update(borough: "Brooklyn")
      self.confirm_input(station)
      cycle_fill_in_the_blanks
    elsif input == "q"
      station_record.update(borough: "Queens")
      self.confirm_input(station)
      cycle_fill_in_the_blanks
    elsif input == "x"
      station_record.update(borough: "The Bronx")
      self.confirm_input(station)
      cycle_fill_in_the_blanks
    elsif input == "h"
      give_hint(station)
      handle_input(station)
    elsif input == "n"
      cycle_fill_in_the_blanks
    elsif input == "0"
      puts ""
      puts "Thanks for playing!".colorize(:red)
      puts ""
      new_cli = CommandLineInterface.new
      new_cli.start
    elsif input == "1"
      self.print_game_commands
      self.print_station(station)
      handle_input(station)
    elsif input == "2"
      play
    end
  end

end
