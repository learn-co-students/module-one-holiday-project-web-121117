class Release < ActiveRecord::Base
  belongs_to :label
  has_many :tracks
  has_many :videos
  has_many :artists_release
  has_many :artists, through: :artists_release
end

#adjust for multiple labels per release
