class Playlist < ActiveRecord::Base
  has_many :tracks, through: :playlists_tracks
  has_many :artists, through: :tracks
  has_many :releases, through: :tracks
  has_many :labels, through: :tracks
  has_many :videos, through: :tracks

  attr_accessor :name
end
