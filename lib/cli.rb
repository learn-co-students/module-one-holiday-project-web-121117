

def welcome
  puts "Welcome to the Database"
end

def goodbye
  puts "Thank you for looking at my database. I hope it was helpful!"
end


def help
  puts "Please enter a command: \n1. Add Tv Show\n2. Add a Fan\n3. Add a Relationship\n4. List the Fans\n5. List the TV Shows\n6. Search for Fan\n7. Find a Fans Favorite Shows\n8. TV Show Ratings"
end

def gets_response
  gets.chomp.downcase
end

def command(response)
  case response
  when "help"
    help
  when "add a tv show", "1"
    puts "Please enter the name of the TV show"
    name = gets.chomp
    Show.create(name: name)
  when "add a fan", "2"
    name = name_getter
    age = age_getter
    state = state_getter
    occupation = occupation_getter
    marrital_status = marrital_status_getter
    sex = sex_getter
    education_level = education_level_getter
    Fan.create(name: name,age: age,state: state,occupation: occupation,marrital_status: marrital_status,sex: sex,education_level: education_level)
  when "add a relationship", "3"
    fan = fan_id_getter
    show = show_id_getter
    rating = rating_getter
    Relationship.create(fan_id: fan,show_id: show, rating: rating)
  when "list the fans", "4"
    puts Fan.list_fans_with_id
  when "list the tv shows", "5"
    puts Show.list_shows_with_id
  when "search for fan", "6"
    fan_id = fan_id_getter
    fan = Fan.find(fan_id)
    puts "ID:#{fan.id}\nName: #{fan.name}\nAge: #{fan.age}\nState: #{fan.state}\nOccupation: #{fan.occupation}\nMarital Status: #{fan.marrital_status}\nSex: #{fan.sex}\nEducation Level:
    #{fan.education_level}"
  when "find a fans favorite shows", "7"
    fan_id = fan_id_getter
    fan = Fan.find(fan_id)
    puts "#{fan.list_shows}"
  when "tv show ratings", "8"
    Show.list_shows_with_rating
  else
    puts "Please enter a valid command. Enter help to view commands or type exit."
  end
end

def name_filter(name)
  if all_letters(name)
    name
  else
    puts "Please enter a name with no numbers."
    name = gets.chomp
  end
end

def all_letters(str)
  str[/[a-zA-Z]+/]  == str
end

def rating_getter
  puts "Please enter a rating between 1-10"
  rating = gets.chomp
  rating
end

def show_id_getter
  puts "Please enter the name or id of the Show."
  name = gets.chomp
  if !/\A\d+\z/.match(name)
    return Show.find_by_name(name).id
  else
    return name
  end
end

def fan_id_getter
  puts "Please enter the name or id of the Fan."
  name = gets.chomp
  if !/\A\d+\z/.match(name)
    return Fan.find_by_name(name).id

  end
  else
    return name
end

def name_getter
  puts "Please enter the name of the Fan."
  name = gets.chomp
  name
end

def age_getter
  puts "Please enter the age of the Fan."
  age = gets.chomp
  age
end

def state_getter
  puts "Please enter the state that the Fan lives in."
  state = gets.chomp
  state
end

def occupation_getter
  puts "Please enter the occupation of the Fan"
  occupation = gets.chomp
  occupation
end

def marrital_status_getter
  puts "Please enter the marrital status of the Fan"
  marrital_status = gets.chomp
end

def sex_getter
  puts "Please enter male or female"
  sex = gets.chomp
  sex
end

def education_level_getter
  puts "Please enter the education level of the Fan"
  education_level = gets.chomp
  education_level
end

def menu_loop
  response = ""
  welcome
  help
  while response != "exit"
    response = gets_response
    command(response)
  end
end
