Line.delete_all
Station.delete_all
StationLine.delete_all

fulton = Station.create(name:"Fulton Station")
prince = Station.create(name:"Prince Station")
broadway = Station.create(name:"Broadway Station")
steinway = Station.create(name: "Steinway Station")
penn = Station.create(name: "Penn Station")



r = Line.create(name:"R")
s = Line.create(name:"S")
l = Line.create(name:"L")
t = Line.create(name: "T")
q = Line.create(name: "Q")

fulton.lines << r
fulton.lines << s
prince.lines << t
prince.lines << l

broadway.lines << s
broadway.lines << q
broadway.lines << r

steinway.lines << r
steinway.lines << q
steinway.lines << t

penn.lines << t
penn.lines << q

fulton.save
prince.save
broadway.save
penn.save
r.save
s.save
l.save
t.save
q.save



StationLine.all[0].update(arrival: "11:00 AM")
StationLine.all[1].update(arrival: "3:30 PM")
StationLine.all[2].update(arrival: "5:00 PM")
StationLine.all[3].update(arrival: "9:00 AM")
StationLine.all[4].update(arrival: "8:30 AM")
StationLine.all[5].update(arrival: "7:00 AM")
StationLine.all[6].update(arrival: "8:30 AM")
StationLine.all[7].update(arrival: "10:00 AM")
StationLine.all[8].update(arrival: "6:30 PM")
StationLine.all[9].update(arrival: "8:30 PM")
StationLine.all[10].update(arrival: "12:00 PM")
StationLine.all[11].update(arrival: "1:30 PM")
