# Start fresh
Line.delete_all
Station.delete_all
Stationline.delete_all

# Lines
two = Line.create(name: "2")
four = Line.create(name: "4")
five = Line.create(name: "5")
six = Line.create(name: "6")
a = Line.create(name: "A")
c = Line.create(name: "C")
q = Line.create(name: "Q")

# Stations
# whenever a variable is called it doesn't work
fulton = Station.create(name: "Fulton")
astor = Station.create(name: "Astor Place")
prospectpark = Station.create(name: "Prospect Park")
atlanticav = Station.create(name: "Atlantic Avenue")
hoyt = Station.create(name: "Hoyt")
wallst = Station.create(name: "Wall Street")
parkplace = Station.create(name: "Park Place")
highst = Station.create(name: "Hight Street")

# Associations
fulton.lines << two
astor.lines << six
prospectpark.lines << q
atlanticav.lines << four
hoyt.lines << c
wallst.lines << five
parkplace.lines << two
highst.lines << a
