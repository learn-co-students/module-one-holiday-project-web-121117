class GuessBoroughByStationName < BoroughAssociationGame
  def play
    guess_borough_by_station_name_greeting
    self.print_game_commands
    cycle_guess_borough_by_station_name
  end

  def cycle_guess_borough_by_station_name
    station = self.choose_station
    # binding.pry
    while !station[:borough]
      station = self.choose_station
    end
    self.print_station(station)
    handle_input(station)
  end

  def guess_borough_by_station_name_greeting
    puts "Guess the Borough by Station Name".upcase
    puts "---------------------------------"
    puts ""
    puts "This game randomly selects stations and you guess the borough.\n"
  end

  def handle_input(station)
    input = self.gets_user_input.downcase
    station_record = Station.find_by(name: station[:name])

    if input == "m"
      station_record.borough == "Manhattan" ? right_choice : wrong_choice(station, "Manhattan")
      self.confirm_input(station)
      cycle_guess_borough_by_station_name
    elsif input == "b"
      station_record.borough == "Brooklyn" ? right_choice : wrong_choice(station, "Brooklyn")
      self.confirm_input(station)
      cycle_guess_borough_by_station_name
    elsif input == "q"
      station_record.borough == "Queens" ? right_choice : wrong_choice(station, "Queens")
      self.confirm_input(station)
      cycle_guess_borough_by_station_name
    elsif input == "x"
      station_record.borough == "The Bronx" ? right_choice : wrong_choice(station, "The Bronx")
      self.confirm_input(station)
      cycle_guess_borough_by_station_name
    elsif input == "h"
      give_hint(station)
      handle_input(station)
    elsif input == "n"
      cycle_guess_borough_by_station_name
    elsif input == "0"
      puts ""
      puts "Thanks for playing!"
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

  def right_choice
    puts ""
    puts "CORRECT!".colorize(:green)
    puts ""
  end

  def wrong_choice(station, borough)
    puts ""
    puts "WRONG! #{station[:name]} is not in #{borough}. Try again yo".colorize(:red)
    puts ""
    handle_input(station)
  end
end
