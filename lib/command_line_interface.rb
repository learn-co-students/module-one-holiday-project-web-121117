def welcome
  puts "Welcome to my secon CLI app!"
  puts "This app has a list of Actors, Movies, and Characters."
  puts "Enjoy!"
end

def user_input
  print "Type Here: "
  input = gets.chomp
  input.to_s
end
########################### MAIN - MENU #############################
def main_menu
  puts "\n##### MAIN MENU #####"
  puts "\n'All Movies' to display all available movies"
  puts "'All Characters' to display all available characters"
  puts "'All Actors' to display all available actors"
  puts "'Add Movie' to add a movie to the list"
  puts "'Exit'"
  puts " "

  inp = user_input.downcase

  case inp
  when "all movies"
    movie_menu
  when "all characters"
    character_menu
  when "all actors"
    actor_menu
  when "add movie"
    add_movie
  when "exit"
    puts "Goodbye!"
  else
    puts "Unknown option. Try again."
    main_menu
  end
end
########################### MOVIE - MENU #############################
def movie_menu
  puts "\n##### MOVIE MENU #####"
  puts " "
  list_all(all_movies)
  puts "\n'(movie_name)' to see all of the movie's actors or characters"
  puts " "
  inp = user_input

  if all_movies.include?(inp)
    puts "'actors' or 'characters'"
    inp2 = user_input
    movie = Movie.find_by(name: inp)
    if inp2 == 'actors'
      puts "____________"
      movie.actors.each{|actor| puts actor.name}
      puts "\nChoose Again?(y,n)"
      again = user_input.downcase
      if again == "y"
        movie_menu
      else
        main_menu
      end
    elsif inp2 == 'characters'
      puts "____________"
      movie.characters.each{|char| puts char.name}
      puts "\nChoose Again?(y,n)"
      again = user_input.downcase
      if again == "y"
        movie_menu
      else
        main_menu
      end
    else
      puts "Unknown command."
      movie_menu
    end
  elsif inp == "back"
    main_menu
  elsif inp == "exit"
    puts "Goodbye!"
  else
    puts "Movie not found. Try again."
    movie_menu
  end
end
########################### CARACTER - MENU #############################
def character_menu
  puts "\n##### CHARACTER MENU #####"
  puts " "
  list_all(all_characters)
  puts "\n'(character_name)' to see all of the character's actors or movies"
  puts " "
  inp = user_input

  if all_characters.include?(inp)
    puts "'actors' or 'movies'"
    inp2 = user_input
    character = Character.find_by(name: inp)
    if inp2 == 'actors'
      puts "____________"
      character.actors.each{|actor| puts actor.name}
      puts "\nChoose Again?(y,n)"
      again = user_input.downcase
      if again == "y"
        character_menu
      else
        main_menu
      end
    elsif inp2 == 'movies'
      puts "____________"
      character.movies.each{|movie| puts movie.name}
      puts "\nChoose Again?(y,n)"
      again = user_input.downcase
      if again == "y"
        character_menu
      else
        main_menu
      end
    else
      puts "Unknown command."
      character_menu
    end
  elsif inp == "back"
    main_menu
  elsif inp == "exit"
    puts "Goodbye!"
  else
    puts "Character not found. Try again."
    character_menu
  end
end
########################### ACTOR - MENU #############################
def actor_menu
  puts "\n##### ACTOR MENU #####"
  puts " "
  list_all(all_actors)
  puts "\n'(actor_name)' to see all of the actor's characters or movies"
  puts " "
  inp = user_input
  if all_actors.include?(inp)
    puts "'characters' or 'movies'"
    inp2 = user_input
    actor = Actor.find_by(name: inp)
    if inp2 == 'characters'
      puts "____________"
      actor.characters.each{|char| puts char.name}
      puts "\nChoose Again?(y,n)"
      again = user_input.downcase
      if again == "y"
        actor_menu
      else
        main_menu
      end
    elsif inp2 == 'movies'
      puts "____________"
      actor.movies.each{|movie| puts movie.name}
      puts "\nChoose Again?(y,n)"
      again = user_input.downcase
      if again == "y"
        actor_menu
      else
        main_menu
      end
    else
      puts "Unknown command."
      actor_menu
    end
  elsif inp == "back"
    main_menu
  elsif inp == "exit"
    puts "Goodbye!"
  else
    puts "Actor not found. Try again."
    actor_menu
  end
end
################# ADDING MOVIES #################
def add_movie
  puts "Type the name of the movie you wish to add, or 'back' to go to the main menu."
  puts " "
  inp = user_input
  if Movie.find_by(name:inp)
    movie = Movie.find_by(name:inp)
    puts "#{inp} is already in the library!"
    puts "Do you wish to add a character to the movie?(Y,N)"
    new_inp = user_input.downcase
    if new_inp == "y"
      add_character(movie)
    else
      main_menu
    end
  elsif inp.downcase == "back"
    main_menu
  else
    movie = Movie.new(name:inp)
    add_character(movie)
  end
end
################# ADDING CHARACTERS ##################
def add_character(movie)
  puts "\nInsert the characters that belongs in the movie, or 'back' to cancel."
  puts " "
  char_name = user_input
  if Character.find_by(name: char_name)
    char = Character.find_by(name: char_name)
    if movie.characters.map{|character| character.name}.include?(char.name)
      puts "Character already exists within that movie."
      add_character(movie)
    else
      movie.characters << char
      add_actor(movie,char)
    end
  elsif char_name == "back"
    movie.save
    main_menu
  else
    char = Character.new(name:char_name)
    movie.characters << char
    add_actor(movie, char)
  end
end
################# ADDING ACTORS ##################
def add_actor(movie, char)
  puts "\nInsert the actor that plays #{char.name}, in the movie."
  puts " "
  actor_name = user_input
  if Actor.find_by(name: actor_name)
    act = Actor.find_by(name: actor_name)
    movie.actors << act
    movie.save
    add_character(movie)
  else
    actor = Actor.new(name:actor_name)
    movie.actors << actor
    char.actors << actor
    movie.save
    char.save
    actor.save
    add_character(movie)
  end
end

################# CREATING ARRAYS #################
def list_all(array)
  array.each {|element| puts element}
end

def all_movies
  movies = Movie.all.map {|movie| movie.name}
end

def all_characters
  characters = Character.all.map {|character| character.name}
end

def all_actors
  actors = Actor.all.map {|actor| actor.name}
end
