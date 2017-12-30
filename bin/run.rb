require_relative '../config/environment'
require_relative 'helper_methods.rb'

def run
  system ("clear")

  #Screen 1 - Select Style of Food
  print_logo
  style_list = output_style_list
  input = 0
  until input > 0 && input <= style_list.length
    print_blank_lines(1)
    indent(40)
    print "What are you in the mood for today? ".cyan
    input = gets.chomp.to_i
  end
  chosen_style = Style.find_by(name: style_list[input - 1])
  system ("clear")

  #Screen 2 - Select Delivery or Pickup
  print_logo
  indent(40)
  puts Rainbow("Mmmmmmm #{chosen_style.name}!  Good Choice!!").cyan
  print_blank_lines(2)
  until input == 'd' || input == 'p'
    indent(40)
    print "[" + Rainbow("D").cyan.bright + "]elivery or [" + Rainbow("P").cyan.bright + "]ickup? "
    input = gets.chomp.downcase
  end

  if input == 'd'
    possible_restaurants = get_restaurant_options(chosen_style)
    possible_restaurants.select! { |restaurant| restaurant.delivery? == true}
  else
    restaurant_options = get_restaurant_options(chosen_style)
    possible_restaurants = restaurant_options.sort_by {|restaurant| restaurant.distance}
  end

  number_of_possibilites = possible_restaurants.length

  system ("clear")
  print_logo
  print_blank_lines(4)

  #Output Restaurants that fit criteria
  if number_of_possibilites == 0
    print_blank_lines(4)
    indent(40)
    puts "There are no restaurants like that nearby, please try again."
    print_blank_lines(4)
    sleep(1.5)
    run

  elsif number_of_possibilites == 1
    print_listing(1, possible_restaurants) #only 1 entry
    print_exit_message

  elsif input == 'd' && number_of_possibilites > 1
    indent(40)
    puts Rainbow("Here are some #{chosen_style.name} restaurants that deliver to Flatiron School:")..aliceblue.bright
    print_blank_lines(2)
    print_restaurant_list(possible_restaurants)
    print_blank_lines(2)
    choice = get_choice_from_restaurant_list(number_of_possibilites)
    system ("clear")
    print_logo
    print_blank_lines(4)
    print_listing(choice, possible_restaurants)
    print_exit_message

  elsif input == 'p' && number_of_possibilites > 1
    indent(40)
    puts Rainbow("Here are some nearby #{chosen_style.name} restaurants:").aliceblue.bright
    print_blank_lines(2)
    print_restaurant_list(possible_restaurants)
    print_blank_lines(2)
    choice = get_choice_from_restaurant_list(number_of_possibilites)
    system ("clear")
    print_logo
    print_blank_lines(4)
    print_listing(choice, possible_restaurants)
    print_exit_message
  end
end

run
