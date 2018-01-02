class ArtisticWorkTrope < ActiveRecord::Base
  belongs_to :artistic_work
  belongs_to :trope
end
