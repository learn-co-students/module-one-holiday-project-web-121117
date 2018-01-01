class CommandLineInterface

  def greet
    puts "Welcome to TrainFinder, the command line solution to for your MTA train-finding needs!"
  end

  def gets_user_input
    puts "We can help you find which train lines are available at NYC subway stations."
    puts "Enter a subway station to get started:"
    station_response = gets.strip
  end

  def find_station(station)
    found_station = Station.all.find_by name: station
    puts found_station.name
    found_station
    # found_station = Station.all.find{|s|s.name == station}
    # found_station
  end
  
  def find_lines(station)
    station.lines.each do |line|
      puts line.name
    end

  end


  def run
    greet
    input = gets_user_input
    found_station = find_station(input)
    find_lines(found_station)
  end

end
