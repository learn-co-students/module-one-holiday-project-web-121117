class Track < ActiveRecord::Base
  belongs_to :release
  has_many :artists, through: :releases
  has_many :playlists, through: :playlists_tracks
  belongs_to :video
end

#should the video_id simply be the video id from youtube, since that's already unique?
#will this work? can it have many through something it belongs to?
