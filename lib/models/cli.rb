require 'colorize'
class CommandLineInterface

  def greet
    puts 'Welcome to TrainFinder, the command line solution to for your MTA train-finding needs!'.blue
    menu
  end

  def menu
    puts
    puts "What would you like to do?".yellow
    puts
    puts "Type 'lines' to find train lines available in NY".light_blue
    puts "Type 'stations' to find train stations available in NY".light_blue
    puts "Type 'exit' to exit the program".light_blue
    main_menu_loop
  end

  def main_menu_loop
    while user_input != "exit"
      case @input
      when "lines"
        run
      when "stations"
        puts "Enter a subway line to get started:".yellow
        show_stations(user_input)
        menu
      else
        # menu
        break
      end
    end
  end

  def user_input
    @input = gets.chomp.downcase
  end

  def gets_user_input
    puts "We can help you find which train lines are available at NYC subway stations.".light_yellow
    puts "Enter a subway station to get started:".light_yellow
    user_input
  end

  def find_station(input)
    if @input != "exit"
     if Station.find_by(name: input)
        Station.find_by(name: input)
     else
        puts "Sorry! #{input} Station is not available. Please try again:".magenta
        response = user_input
        find_station(response)
     end
    else
     puts "Good bye!".magenta
    end
  end

  def find_lines(station)
    station.lines
  end

  def show_lines(lines)
    names = lines.map{|line| line.name }
    puts "Lines Available for #{@input.capitalize} Station:".blue
    puts
    puts "#{names.join(", ")}".red
  end

  def show_stations(user_input)
    select_station_names = Line.where(name: user_input)
    station_names = select_station_names.map{|line| line.station.name}
    puts "These are the train stations available for line #{user_input}:".yellow
    puts
    puts "#{station_names.join(", ")}".red
    puts
    puts "Here is the link of the NYC mta service for more information: "
    puts "http://web.mta.info/nyct/service/".blue
    run_url
  end

  def run_url
    url = 'http://web.mta.info/nyct/service/'
    `open #{url}`
  end

  def run
    input = gets_user_input
    station = find_station(input)
    lines = find_lines(station)
    x = show_lines(lines)
    menu
  end

end
