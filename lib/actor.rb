class Actor < ActiveRecord::Base
  has_many :character_actors
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  has_many :characters, through: :character_actors
end
