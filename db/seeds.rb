require 'csv'
require 'json'

csv_text = File.read('tmdb_5000_movies.csv')
csv = CSV.parse(csv_text, :headers => true)

csv.each do |csv_file|
  movie_title = csv_file.to_hash["title"]
  movie_companies = JSON.parse(csv_file.to_hash["production_companies"])

  if !Movie.find_by(title: movie_title)
    movie = Movie.create(title: movie_title)
  else
    movie = Movie.find_by(title: movie_title)
  end

  movie_companies.each do |company|
    company_name = Company.find_by(name: company["name"])
    if company_name
      movie.companies << company_name
    else
      new_company = Company.create(name: company["name"])
      movie.companies << new_company
    end
  end

end
