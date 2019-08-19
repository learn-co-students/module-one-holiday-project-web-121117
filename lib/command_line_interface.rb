class CommandLineInterface
  def greet
    puts "Welcome to TrainFinder, the command line solution for your MTA train-finding needs!"
  end

  def gets_user_input
  puts "We can help you find which train lines are available at NYC subway stations."
  puts "Enter a subway station to get started:"
  #what could we put here to allow a user to type a response?
  input = gets.chomp
  input.to_s
  end

  def find_station(station)
    found_station = Station.all.find_by(name: station)
    found_station
  end

  def find_lines(station)
    lines = station.lines.each do |line|
      puts line.name
    end
  end

  def run
    greet
    input = gets_user_input
    station = find_station(input)
    find_lines(station)
  end

end
