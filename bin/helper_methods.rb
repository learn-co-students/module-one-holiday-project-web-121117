########METHODS###########

def output_style_list
  option_number = 1
  style_list = []
  Style.all.each do |style_inst|
    puts "#{option_number}. #{style_inst.name}"
    option_number +=1
    style_list << style_inst.name
  end
  style_list
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

def print_restaurant_list(rest_arr)
  option_number = 1
  rest_arr.each do |restaurant|
    puts "#{option_number}. #{restaurant.name}"
    option_number +=1
  end
  rest_arr
end

def print_listing(input, restaurants_arr)
  i = input - 1
  puts "#{restaurants_arr[i].name}"
  puts "#{restaurants_arr[i].address}"
  puts "#{restaurants_arr[i].phone_number}"
  puts "Rating: #{restaurants_arr[i].rating}"
  puts "Distance from Flatiron: #{restaurants_arr[i].distance} miles"
end

def get_choice_from_restaurant_list(list_length)
  input = 0
  until input > 0 && input <= list_length
    print "Enter a number for more information: "
    input = gets.chomp.to_i
  end
  input
end
