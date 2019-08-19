class Line < ActiveRecord::Base
  has_many :station_lines
  has_many :stations, through: :station_lines

  # def initalize
  #   @name = name
  #   @station_line_id = station_line_id
  # end


end
