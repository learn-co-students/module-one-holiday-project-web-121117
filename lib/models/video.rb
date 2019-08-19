class Video < ActiveRecord::Base
  has_many :release_videos
  has_many :releases, through: :release_videos
  has_many :tracks
end
