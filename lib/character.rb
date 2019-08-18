class Character < ActiveRecord::Base
  has_many :character_actors
  has_many :movie_characters
  has_many :movies, through: :movie_characters
  has_many :actors, through: :character_actors
end
