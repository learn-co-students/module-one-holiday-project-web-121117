class MovieCharacter < ActiveRecord::Base
  belongs_to :movie
  belongs_to :character
end
