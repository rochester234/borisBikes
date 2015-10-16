require './lib/docking_station'

station = DockingStation.new
my_bike = Bike.new
station.dock(my_bike)
station.release_bike
my_bike.working?(false)
station.dock(my_bike, my_bike.working)
#print station.bikes

station.release_bike
print station.bikes
