class Line < ActiveRecord::Base
  has_many :Station
  # has_many through :Station

  def initalize
    @name = name
    @station_line_id = station_line_id
  end


end
