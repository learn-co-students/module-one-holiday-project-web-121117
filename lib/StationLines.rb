class StationLines < ActiveRecord::Base
  belongs_to :Station
  belongs_to :Line

  def initalize
    @name = name
    @line_id = line_id
    @station_id = station_id
  end



end
