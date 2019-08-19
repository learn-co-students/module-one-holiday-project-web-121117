class Line < ActiveRecord::Base
  has_many :stationlines
  has_many :stations, through: :stationlines
end
