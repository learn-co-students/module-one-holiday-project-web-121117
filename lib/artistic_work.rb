class ArtisticWork < ActiveRecord::Base
  has_many :artistic_work_tropes
  has_many :tropes, through: :artistic_work_tropes
end
