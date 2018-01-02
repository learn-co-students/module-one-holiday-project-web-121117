class CommandLineInterface
  def greet
    system('clear')
    puts "Welcome to TrainFinder, the command line solution to for your MTA train-finding needs! And stuff...".colorize(:green)
  end

  def print_menu
    puts ""
    puts "MENU"
    puts "----"
    puts ""
    puts "1. Get Train Lines by Station Name"
    puts "2. Get Station Names by Train Line"
    puts "3. Play the Borough Association Game"
    puts "0. Exit"
    puts ""
  end

  def gets_user_input
    puts ""
    puts "Please enter your choice:"
    gets.chomp
  end

  def start
    greet
    print_menu
    input = gets_user_input

    if input == "1"
      data = LinesByStation.new
      data.browse
    elsif input == "2"
      data = StationsByLine.new
      data.browse
    elsif input == "3"
      game = BoroughAssociationGame.new
      game.play
    elsif input == "0"
      false
    else
      puts "Invalid choice, please try again!"
      start
    end
  end
end
