class Label < ActiveRecord::Base
  has_many :releases
  has_many :tracks, through: :releases
  has_many :videos, through: :releases
  has_many :artists, through: :releases
end
