class Track < ActiveRecord::Base
  belongs_to :release
  has_many :artists, through: :releases
  has_many :playlists, through: :playlists_tracks
  has_one :video
end

#will this work? can it have many through something it belongs to?
