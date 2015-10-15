require_relative 'bike'

class DockingStation

attr_accessor :capacity
attr_accessor :bikes
attr_accessor :working_status
#
    def initialize(capacity = 20)
      @capacity = capacity
      @bikes = []
      @working_status = {}

    end



    def release_bike
      fail 'There are no bikes available' if empty?
      @bikes.pop
    end

    def dock(bike, working = true)
      fail 'The docking station is already at capacity' if full?
      @working_status[:bike.object_id] = working
      @bikes << bike
      @bikes.last
    end



private

    def full?
      @bikes.count >= @capacity ? true : false
    end

    def empty?
      @bikes.count == 0 ? true : false
    end

end
