class Station < ActiveRecord::Base
  has_many :Line
  # has_many through :TrainLine

  def initalize
    @name = name
    @station_line_id = station_line_id
  end


end
