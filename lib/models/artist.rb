class Artist < ActiveRecord::Base
  has_many :artists_releases
  has_many :releases, through: :artists_releases
  has_many :tracks, through: :releases
  has_many :labels, through: :releases
  has_many :videos, through: :releases
  has_many :playlists, through: :tracks
end
