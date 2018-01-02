class Station < ActiveRecord::Base
  has_many :stationlines
  has_many :lines, through: :stationlines
end
