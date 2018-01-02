class Station < ActiveRecord::Base
  has_many :station_lines
  has_many :station_entrances
  has_many :train_lines, through: :station_lines
end
