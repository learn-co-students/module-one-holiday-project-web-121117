require 'rest-client'
require 'json'

data = RestClient.get('https://data.cityofnewyork.us/api/views/he7q-3hwy/rows.json?accessType=DOWNLOAD')
subway_hash = JSON.parse(data)

subway_hash["data"].each do |station_info|
  station = station_info[10]
  trains = station_info[12].split("-")

  if Station.all.find_by(name: station)
    s = Station.all.find_by(name: station)
  else
    s = Station.create(name: station)
  end

  trains.each do |train|
    l = Line.all.find_by(name: train)
    if l
      s.lines << l
    else
      new_line = Line.create(name: train)
      s.lines << new_line
    end
  end
end
