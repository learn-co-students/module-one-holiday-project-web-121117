require_relative '../config/environment'
require_relative 'helper_methods.rb'


puts "Lunch Time!"
puts "What are you in the mood for?"

#Style of Food?
style_list = output_style_list
input = 0
until input > 0 && input <= style_list.length
  print "What are you in the mood for today? "
  input = gets.chomp.to_i
end
chosen_style = Style.find_by(name: style_list[input - 1])
puts "Mmmmmmm #{chosen_style.name}!  Good Choice!!"

#Delivery or Pickup?
until input == 'd' || input == 'p'
  print "[D]elivery or [P]ickup? "
  input = gets.chomp.downcase
end

if input == 'd'
  possible_restaurants = get_restaurant_options(chosen_style)
  possible_restaurants.select! { |restaurant| restaurant.delivery? == true}
else
  possible_restaurants = get_restaurant_options(chosen_style)
end

number_of_possibilites = possible_restaurants.length


#Output Restaurants that fit criteria
if number_of_possibilites == 0
    puts "There are no restaurants like that nearby, please try again."

elsif number_of_possibilites == 1
  print_listing(1, possible_restaurants) #only 1 entry

elsif input == 'd' && number_of_possibilites > 1
  puts "Here are some #{chosen_style.name} restaurants that deliver to Flatiron School."
  print_restaurant_list(possible_restaurants)
  choice = get_choice_from_restaurant_list(number_of_possibilites)
  print_listing(choice, possible_restaurants)

elsif input == 'p' && number_of_possibilites > 1
  puts "Here are some nearby #{chosen_style.name} restaurants."
  print_restaurant_list(possible_restaurants)
  choice = get_choice_from_restaurant_list(number_of_possibilites)
  print_listing(choice, possible_restaurants)
end
