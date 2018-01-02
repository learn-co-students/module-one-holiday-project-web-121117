class CommandLineInterface

  def greet
    puts "Welcome to TrainFinder, the command line solution to for your MTA train-finding needs!"
  end


  def gets_user_input
    puts "We can help you find which train lines are available at NYC subway stations."
    puts "Enter a subway station to get started:"
    user_input = gets.chomp
    user_input
  end


  def find_station_info(input)
    Station.find_by(name: input)
  end


  def find_lines(station)
    station.lines
  end


  def show_lines(lines)
    lines.each do |line|
      puts line
    end
  end


  def run
    greet
    input = gets_user_input
    station_info = find_station_info(input)
    lines = find_lines(station_info)
    show_lines(lines)
  end


end
