class LinesByStation < CommandLineInterface
  def browse
    greeting
    handle_input(self.gets_user_input)
  end

  def greeting
    puts ""
    puts "Find Train Lines by Station".colorize(:green)
    puts "---------------------------"
    puts ""
    puts "Enter the station name, or press 0 to return to main menu"
    puts ""
  end

  def handle_input(input)
    station = Station.all.select{ |station| station.name.include?(input.downcase.capitalize) }
    if station.length > 0 && input != "0"
      train_lines = station[0].train_lines.order(:name).distinct
      puts ""
      puts "All train lines for the #{input.downcase.capitalize} station:".colorize(:green)
      puts ""
      result = ""
      train_lines.each_with_index { |train_line| result << "#{train_line.name }-"}
      puts result.chop.colorize(:red)
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
