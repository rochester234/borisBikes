require_relative 'bike'

class DockingStation

attr_accessor :capacity
attr_accessor :bikes
attr_accessor :working_status
attr_reader :working
#
    def initialize(capacity = 20)
      @capacity = capacity
      @bikes = []
      @working_status = []

    end



    def release_bike
      fail 'There are no bikes available' if empty?

      @bikes.each do |bike|

        if bike.working ==true
          return @bikes.delete(bike)
          
        end

      end
      fail 'The bike is broken' #if @working_status[:bike.object_id] == false

    end

    def dock(bike)
      fail 'The docking station is already at capacity' if full?
      @working_status << [:bike.object_id, working]
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
