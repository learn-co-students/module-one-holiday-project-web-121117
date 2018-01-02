require_relative '../config/environment'
require_relative '../lib/command_line_interface'

cli = CommandLineInterface.new
cli.greet
while true
  input = cli.gets_user_input
  movie = cli.find_movie(input)
  break if movie == nil
  companies = cli.find_companies(movie)
  puts cli.display_companies(companies)
end
