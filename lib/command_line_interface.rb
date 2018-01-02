class CommandLineInterface
  def greet
    puts "Hello, Welcome to our Movie Database!"
  end

  def check_case(words)
    non_cap = ["the", "and", "exit", "of"]
    new_words = words.split
    new_words.map.with_index do |word, idx|
      non_cap.include?(word.downcase) && idx != 0 ? word.downcase : word.capitalize
    end.join(" ")
  end

  def gets_user_input
    puts "We can help you find the production companies for a movie!"
    puts "Enter the title of the movie you want to search for:"
    input = check_case(gets.chomp)
  end

  def find_movie(input)
    result = Movie.find_by(title: input)
    if result
      result
    else
      puts "Could not find this movie, Please try again or type Exit:"
      input = check_case(gets.chomp)
      if input == "Exit"
        return exit
      else
        find_movie(input)
      end
    end
  end

  def find_companies(movie)
    movie.companies
  end

  def display_companies(companies)
    companies.map {|company| company.name}
  end

  def exit
    puts "Thank you for checking out our database!"
  end


end
