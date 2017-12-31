class CommandLineInterface

  def run
    #Screen 1 - Select Style of Food
    self.print_logo
    style_list = self.output_style_list
    chosen_style = self.get_style_from_user(style_list)
    #Screen 2 - Select Delivery or Pickup
    self.print_logo
    self.indent(40)
    puts Rainbow("Mmmmmmm #{chosen_style.name}!  Good Choice!!").cyan
    self.print_blank_lines(2)
    possible_restaurants = self.delivery_or_pickup?(chosen_style)
    #Screen 3 - Output Restaurants that fit criteria
    self.print_logo
    self.print_blank_lines(4)
    self.output_options(possible_restaurants, chosen_style)
  end

  def print_logo
    self.clear_screen
    # puts 'Lunch Time!'
    a = Artii::Base.new
    puts a.asciify('* * *  Lunch Time  * * *').magenta
  end

  def clear_screen
    system ("clear")
  end

  def print_blank_lines(x)
    x.times {puts ""}
  end

  def indent(x)
    x.times {print " "}
  end

  def double_space
    self.print_blank_lines(1)
    self.indent(40)
  end

  def print_exit_message
    self.print_blank_lines(4)
    a = Artii::Base.new
    puts a.asciify('                                        Enjoy ! ! ! ').cyan.blink #40 Spaces
    self.print_blank_lines(1)
  end

  def output_style_list
    option_number = 1
    style_list = []
    table_array_one = []
    table_array_two = []
    table_array_three = []
    table_array_four = []
    column_height = Style.all.length / 4
    Style.all.each do |style_inst|
      #format for table 4 choices wide
      #column 1
      if option_number <= column_height
        table_array_one << "#{option_number}." + " #{style_inst.name}".cyan
        option_number +=1
        style_list << style_inst.name
        #column 2
      elsif option_number > column_height && option_number <= column_height * 2
        table_array_two << "#{option_number}." + "  #{style_inst.name}".cyan
        option_number +=1
        style_list << style_inst.name
        #column 3
      elsif option_number > column_height * 2 && option_number <= column_height * 3
        table_array_three << "#{option_number}." + "  #{style_inst.name}".cyan
        option_number +=1
        style_list << style_inst.name
        #column 4
      else
        table_array_four << "#{option_number}." + "  #{style_inst.name}".cyan
        option_number +=1
        style_list << style_inst.name
      end
    end
    #sort table rows
    rows = []
    n = 0
    while n < table_array_four.length
      temp_hash = [table_array_one[n], table_array_two[n], table_array_three[n], table_array_four[n]]
      rows << temp_hash
      n += 1
    end
    table = Terminal::Table.new do |t|
      t.rows = rows
      t.style = {:padding_left => 3, :border_x => "-", :border_i => "-"}
    end
    puts table
    style_list
  end

  def get_style_from_user(style_list)
    input = 0
    until input > 0 && input <= style_list.length
      self.double_space
      print "What are you in the mood for today? ".cyan
      input = gets.chomp.to_i
    end
    chosen_style = Style.find_by(name: style_list[input - 1])
  end

  def delivery_or_pickup?(chosen_style)
    input = 0
    until input == 'd' || input == 'p'
      self.indent(40)
      print "[" + Rainbow("D").cyan.bright + "]elivery or [" + Rainbow("P").cyan.bright + "]ickup? "
      input = gets.chomp.downcase
    end
    if input == 'd'
      possible_restaurants = self.get_restaurant_options(chosen_style)
      possible_restaurants.select! { |restaurant| restaurant.delivery? == true}
    else
      restaurant_options = self.get_restaurant_options(chosen_style)
      possible_restaurants = restaurant_options.sort_by {|restaurant| restaurant.distance}
    end
    possible_restaurants
  end

  def get_restaurant_options(style)
    restaurant_options = []
    Restaurant.all.each do |rest|
      if rest.styles.include?(style)
        restaurant_options << rest
      end
    end
    restaurant_options
  end

  def get_pickup_options(style)
    restaurant_options = self.get_restaurant_options(style)
    restaurant_options.sort_by {|restaurant| restaurant.distance}
  end

  def print_restaurant_list(rest_arr)
    option_number = 1
    rest_arr.each do |restaurant|
      indent(40)
      puts "#{option_number}." + Rainbow(" #{restaurant.name}").cyan
      self.print_blank_lines(1)
      option_number +=1
    end
    rest_arr
  end

  def print_listing(chosen_restaurant)
    self.indent(40)
    puts Rainbow("#{chosen_restaurant.name}").aliceblue.bright.underline
    self.double_space
    puts Rainbow("#{chosen_restaurant.address}").aliceblue
    self.double_space
    puts Rainbow("#{chosen_restaurant.phone_number}").aliceblue
    self.double_space
    puts Rainbow("Rating: #{chosen_restaurant.rating}").aliceblue
    self.double_space
    puts Rainbow("Distance from Flatiron: #{chosen_restaurant.distance} miles").aliceblue
  end

  def choose_restaurant(input, restaurants_arr)
    i = input - 1
    restaurants_arr[i]
  end

  def get_choice_from_restaurant_list(list_length)
    input = 0
    until input > 0 && input <= list_length
      self.indent(40)
      print "Enter a number for more information: "
      input = gets.chomp.to_i
    end
    input
  end


  def output_options(possible_restaurants, chosen_style)
    number_of_possibilites = possible_restaurants.length
    if number_of_possibilites == 0
      self.print_blank_lines(4)
      self.indent(40)
      puts "There are no restaurants like that nearby, please try again."
      self.print_blank_lines(4)
      sleep(1.5)
      self.run
    elsif number_of_possibilites == 1
      chosen_restaurant = self.choose_restaurant(1, possible_restaurants)
      self.print_listing(chosen_restaurant) #only 1 entry
      self.try_again?(chosen_restaurant)
    elsif number_of_possibilites > 1
      self.indent(40)
      puts Rainbow("Here are some #{chosen_style.name} restaurants near Flatiron School:").aliceblue.bright
      self.print_blank_lines(2)
      self.print_restaurant_list(possible_restaurants)
      self.print_blank_lines(2)
      choice = self.get_choice_from_restaurant_list(number_of_possibilites)
      self.print_logo
      self.print_blank_lines(4)
      chosen_restaurant = self.choose_restaurant(choice, possible_restaurants)
      self.print_listing(chosen_restaurant)
      self.try_again?(chosen_restaurant)
    end
  end

  def try_again?(chosen_restaurant)
    self.print_blank_lines(2)
    input = 0
    until input == 'o' || input == 't' || input == 'q'
      self.indent(40)
      print "[" + Rainbow("O").cyan.bright + "]pen in browser [" + Rainbow("T").cyan.bright + "]ry again, or [" + Rainbow("Q").cyan.bright + "]uit? "
      input = gets.chomp.downcase
    end
    if input == 'o'
      self.print_exit_message
      sleep(0.5)
      Launchy.open(chosen_restaurant.url)
    elsif input == 't'
      self.run
    elsif input == 'q'
      self.print_exit_message
    end
end

end
