class CommandLineInterface
  def greet
    puts "Welcome to TrainFinder, the command line solution for your MTA train-finding needs!"
    puts "We can help you find which train lines are available at NYC subway stations."
  end

  def gets_user_input
    puts "Enter a subway station to get started or type 'list' to see a complete list of available stations:"
    gets.chomp
  end

  def find_station(input)
    Station.find_by(name: input)
  end

  def find_lines(station)
    station.lines
  end

  def show_lines(lines)
    puts "Trains available at this station:"
    lines.each do |line|
      puts "#{line.name} Train"
    end
  end

  def list_stations
    Station.all.each {|s| puts s.name}
  end

  def run
    greet

    while true
      input = gets_user_input

      if input.downcase == "list"
        list_stations
        input = gets_user_input
        station = find_station(input)
      else
        station = find_station(input)
      end

      lines = find_lines(station)
      show_lines(lines)
    end
  end
end
