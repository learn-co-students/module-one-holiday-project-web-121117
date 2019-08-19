class StationLine < ActiveRecord::Base
  belongs_to :station
  belongs_to :line

  # def initalize
  #   @name = name
  #   @line_id = line_id
  #   @station_id = station_id
  # end

end
