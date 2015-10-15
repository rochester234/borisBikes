require_relative 'bike'

class DockingStation

# attr_accessor :default_capacity
#
def initialize
  # @default_capacity = 20
  @bikes = []
end

attr_accessor :bikes

def release_bike
  fail 'There are no bikes available' if @bikes.count == 0
  @bikes.pop
end

def dock(bike)
  fail 'The docking station is already at capacity' if @bikes.count == 20
  @bikes << bike
  @bikes.last
end
end
