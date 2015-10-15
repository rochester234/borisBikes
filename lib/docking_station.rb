require_relative 'bike'

class DockingStation

#DEFAULT_CAPACITY = 20
attr_accessor :capacity
#
    def initialize(capacity = 20)

      # if capacity == nil
      #   @capacity = 20
      # else
      #   @capacity = capacity
      # end
      @capacity = capacity
      @bikes = []
    end

attr_accessor :bikes

    def release_bike
      fail 'There are no bikes available' if empty?
      @bikes.pop
    end

    def dock(bike)
      fail 'The docking station is already at capacity' if full?
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
