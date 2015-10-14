require_relative 'bike'

class DockingStation
attr_accessor :default_capacity
#
def initialize
  @default_capacity = []
end

attr_accessor :bikes

def release_bike
  fail 'There are no bikes available' unless @bikes
  @bikes
end

def dock(bike)
  fail 'The docking station is already at capacity' unless !@bikes
  @bikes = bike
end
end
