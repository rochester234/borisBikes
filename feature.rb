require './lib/docking_station'

station = DockingStation.new
b1= Bike.new
b2= Bike.new
b3= Bike.new
b4= Bike.new
station.dock(b1)
station.release_bike
b1.working?(false)
b3.working?(false)
station.dock(b1)
station.dock(b2)
station.dock(b3)
station.dock(b4)

p station.bikes

station.release_bike
station.release_bike
p station.bikes

station.release_bike
