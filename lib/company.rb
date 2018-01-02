class Company < ActiveRecord::Base
  has_many :movie_companies
  has_many :movies, through: :movie_companies
end
