require 'csv'
require 'json'

csv_text = File.read('tmdb_5000_movies.csv')
csv = CSV.parse(csv_text, :headers => true)
puts csv[0].to_hash
p JSON.parse(csv[0].to_hash["production_companies"]).map {|company| company["name"]}
