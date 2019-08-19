class Movie < ActiveRecord::Base
  has_many :movie_companies
  has_many :companies, through: :movie_companies
end
