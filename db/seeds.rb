fulton = Station.create(name: "Fulton")
clark = Station.create(name: "Clark")
high = Station.create(name: "High")
wall_st = Station.create(name: "Wall St")
chamber = Station.create(name: "Chamber")
canal = Station.create(name: "Canal")
bowling_green = Station.create(name: "Bowling Green")
hoyt = Station.create(name: "Hoyt")

a = Line.create(name: "A")
four = Line.create(name: "4")
two = Line.create(name: "2")
fulton.lines << a
high.lines << a
clark.lines << two
hoyt.lines << a
hoyt.lines << two
bowling_green.lines << four

fulton_a = StationLine.create(name:"Fulton A")
a.station_lines << fulton_a
fulton.station_lines << fulton_a
