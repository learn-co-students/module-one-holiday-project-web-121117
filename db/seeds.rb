require './config/environment.rb'

stations = File.open('./StationEntrances.csv','r')

records = [] #Array for each CSV entry

while (line = stations.gets) #Operate on each line in the Station Entrances CSV

  row = line.split(",") #Convert each CSV entry into array

  station_data = [] #Create a new array for the data we want to store

  station_name = row[2] #Grab and store the station name by index

  subway_lines = [] #Stores all subway lines for a station into a new array

  #Add lines to the station's array

  route_index = 5 #Subway lines begin at index 5
  while route_index <= 15 do
    if row[route_index].length > 0 #Filter out empty columns
      subway_lines << row[route_index] #Push in the subway if it exists
    end
    route_index += 1 #Proceed to next index
  end

  ns_street = row[25] #North-South Street
  ew_street = row[26] #East-West Street
  corner = row[27]

  #Fill in the station's array with pertinent data

  station_data << station_name
  station_data << subway_lines
  station_data << ns_street
  station_data << ew_street
  station_data << corner

  #Push the data into a new record
  records << station_data

end

stations.close #Remove the original CSV file from memory

#Add each record to the database

records.shift #Remove the header row

records.each do |record|

  #Find or create the station
  station_instance = Station.find_or_create_by(name: record[0])

  #Associate the subway lines
  record[1].each do |subway_line|
    subway_line_instance = TrainLine.find_or_create_by(name: subway_line)
    station_instance.train_lines << subway_line_instance
  end

  #Associate the entrances
  entrance_instance = StationEntrance.find_or_create_by(ns_street: record[2], ew_street: record[3], corner: record[4])
  station_instance.station_entrances << entrance_instance

end

puts "Seeding complete yo"
