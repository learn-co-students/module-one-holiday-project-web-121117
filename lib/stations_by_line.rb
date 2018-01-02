class StationsByLine < CommandLineInterface

  def browse
    greeting
    handle_input(self.gets_user_input)
  end

  def greeting
    puts ""
    puts "Find Stations by Train Line".colorize(:green)
    puts "---------------------------"
    puts ""
    puts "Enter the train line, or press 0 to return to main menu"
    puts ""
  end

  def handle_input(input)
    if /[acebdfmnqrwjzsgl1234567]/.match(input.downcase)
      train_line = TrainLine.find_by(name: input.upcase)
      stations = train_line.stations.all.distinct
      puts ""
      puts "All stations for the #{input.upcase} line:".colorize(:green)
      puts ""
      stations.each { |station| puts station.name }
      handle_input(self.gets_user_input)
    elsif input == "0"
      new_cli = CommandLineInterface.new
      new_cli.start
    else
      puts ""
      puts "Invalid choice. Please try again or choose 0 to return to the main menu".colorize(:red)
      puts ""
      handle_input(self.gets_user_input)
    end
  end

end
