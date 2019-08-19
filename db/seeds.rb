require 'rest-client'
require 'json'


mta_data = RestClient.get('https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.json?accessType=DOWNLOAD')
mta_hash = JSON.parse(mta_data)


mta_hash["data"].each do |mta_array|
  station = mta_array[10].downcase
  lines = mta_array[12].split(/-/).join(", ")
  # puts mta_array[13]

    new_station =  Station.create(name: station).lines << Line.create(name: lines)
    Train.create(location: nil).lines << new_station


  end



# Train.delete_all
# Line.delete_all
# Station.delete_all
#
# #trains
# subway_west_manhattan = Train.create(location: "West Manhattan")
# subway_lower_manhattan = Train.create(location: "Lower Manhattan")
# subway_brooklyn = Train.create(location: "Brooklyn")
# subway_queens = Train.create(location: "Queens")
# subway_bronx = Train.create(location: "Bronx")
#
# #lines
# one = Line.create(name: "1")
# a = Line.create(name: "A")
# six = Line.create(name: "6")
# f = Line.create(name: "F")
# two = Line.create(name: "2")
# four = Line.create(name: "4")
# five = Line.create(name: "5")
#
# #stations
# columbia = Station.create(name: "Columbia University")
# fulton = Station.create(name: "Fulton Street")
# buhre = Station.create(name: "Buhre Ave")
# parsons = Station.create(name: "Parsons Blvd")
# wall_st = Station.create(name: "Wall Street")
#
# #associations
# subway_west_manhattan.lines << one
# subway_lower_manhattan.lines << two
# subway_lower_manhattan.lines << four
# subway_lower_manhattan.lines << five
# subway_brooklyn.lines << a
# subway_queens.lines << f
# subway_bronx.lines << six
#
# columbia.lines << one
# fulton.lines << a
# buhre.lines << six
# parsons.lines << f
# wall_st.lines << two
# wall_st.lines << four
# wall_st.lines << five
#
