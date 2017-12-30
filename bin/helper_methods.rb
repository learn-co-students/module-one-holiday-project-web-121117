########METHODS###########

def indent(x)
  x.times {print " "}
end

def print_logo
  # puts 'Lunch Time!'
  a = Artii::Base.new
  puts a.asciify('* * *  Lunch Time  * * *').magenta
end

def print_blank_lines(x)
  x.times {puts ""}
end

def print_exit_message
  print_blank_lines(4)
  a = Artii::Base.new
  puts a.asciify('                                        Enjoy ! ! ! ').cyan.blink #40 Spaces
  print_blank_lines(4)
end

def output_style_list
  option_number = 1
  style_list = []
  table_array_one = []
  table_array_two = []
  table_array_three = []
  table_array_four = []
  Style.all.each do |style_inst|
    #format for table 4 choices wide
    #column 1
    if option_number <= 13
      table_array_one << "#{option_number}." + " #{style_inst.name}".cyan
      option_number +=1
      style_list << style_inst.name
      #column 2
    elsif option_number > 13 && option_number <= 26
      table_array_two << "#{option_number}." + "  #{style_inst.name}".cyan
      option_number +=1
      style_list << style_inst.name
      #column 3
    elsif option_number > 26 && option_number <= 39
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
  restaurant_options = get_restaurant_options(style)
  restaurant_options.sort_by {|restaurant| restaurant.distance}
end

def print_restaurant_list(rest_arr)
  option_number = 1
  rest_arr.each do |restaurant|
    indent(40)
    puts "#{option_number}." + Rainbow(" #{restaurant.name}").cyan
    print_blank_lines(1)
    option_number +=1
  end
  rest_arr
end

def print_listing(input, restaurants_arr)
  i = input - 1
  indent(40)
  puts Rainbow("#{restaurants_arr[i].name}").aliceblue.bright.underline
  print_blank_lines(1)
  indent(40)
  puts Rainbow("#{restaurants_arr[i].address}").aliceblue
  print_blank_lines(1)
  indent(40)
  puts Rainbow("#{restaurants_arr[i].phone_number}").aliceblue
  print_blank_lines(1)
  indent(40)
  puts Rainbow("Rating: #{restaurants_arr[i].rating}").aliceblue
  print_blank_lines(1)
  indent(40)
  puts Rainbow("Distance from Flatiron: #{restaurants_arr[i].distance} miles").aliceblue
end

def get_choice_from_restaurant_list(list_length)
  input = 0
  until input > 0 && input <= list_length
    indent(40)
    print "Enter a number for more information: "
    input = gets.chomp.to_i
  end
  input
end
