require_relative '../config/environment'

puts "Lunch Time!"

#ASK WHAT KIND OF FOOD (SELECT BY NUMBER)
puts "Here are your options:"
option_number = 1
style_list = []
Style.all.each do |style_inst|
  puts "#{option_number}. #{style_inst.name}"
  option_number +=1
  style_list << style_inst.name
end
####INPUT LOOP
input = 0
until input > 0 && input <= option_number
print "What are you in the mood for today? "
  input = gets.chomp.to_i
end
######


chosen_style = Style.find_by(name: style_list[input - 1])
puts "Mmmmmmm #{chosen_style.name}!  Good Choice!!"


#DELIVERY OR PICKUP?
until input == 'd' || input == 'p'
  print "[D]elivery or [P]ickup? "
  input = gets.chomp.downcase
end

restaurant_options = []
if input == 'd'
  Restaurant.all.each do |rest|
    if rest.styles.include?(chosen_style) && rest.delivery? == true
      restaurant_options << rest
    end
  end
  if restaurant_options.length == 0
    puts "There are no restaurants like that nearby, please try again."
  else
    puts "Here are some #{chosen_style.name} restaurants that deliver to Flatiron School."
    option_number = 1
    restaurant_options.each do |restaurant|
      puts "#{option_number}. #{restaurant.name}"
      option_number +=1
    end
  end
else
  Restaurant.all.each do |rest|
    if rest.styles.include?(chosen_style)
      restaurant_options << rest
    end
  end
  if restaurant_options.length == 0
    puts "There are no restaurants like that nearby, please try again."
  else
    puts "Here are some nearby #{chosen_style.name} restaurants."
    option_number = 1
    restaurant_options.each do |restaurant|
      puts "#{option_number}. #{restaurant.name}"
      option_number +=1
    end
  end
end


if restaurant_options.length == 1
  # PRINT RESTAURANT INFO TO SCREEN
  puts "#{restaurant_options[0].name}"
  puts "#{restaurant_options[0].address}"
  puts "#{restaurant_options[0].phone_number}"
  puts "Rating: #{restaurant_options[0].rating}"
  puts "Distance from Flatiron: #{restaurant_options[0].distance} miles"

elsif restaurant_options.length == 0
  ###start over
else
  input = 0
  until input > 0 && input <= restaurant_options.length
    print "Enter a number for more information: "
    input = gets.chomp.to_i
  end

  # PRINT RESTAURANT INFO TO SCREEN
  i = input - 1
  puts "#{restaurant_options[i].name}"
  puts "#{restaurant_options[i].address}"
  puts "#{restaurant_options[i].phone_number}"
  puts "Rating: #{restaurant_options[i].rating}"
  puts "Distance from Flatiron: #{restaurant_options[i].distance} miles"
end
