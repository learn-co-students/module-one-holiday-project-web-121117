class CharacterActor < ActiveRecord::Base
  belongs_to :actor
  belongs_to :character
end
