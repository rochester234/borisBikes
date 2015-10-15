require 'docking_station'

describe DockingStation do
  it {is_expected.to(respond_to(:release_bike))}

  it 'expects to be able to dock a bike at the docking station' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'expects to see a bike that has been docked' do
    expect(subject).to respond_to(:bikes)
  end

  it 'lets us see a bike that has been docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.dock(bike)).to eq bike
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

    describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end


      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'There are no bikes available'
      end
    end


    describe '#dock' do
      it 'raises an error when full' do
        20.times {subject.dock(Bike.new)}
        expect { subject.dock(Bike.new)}.to raise_error "The docking station is already at capacity"
      end
    end

    describe '#initialize' do
      it 'checking maintenance can add an argument to bike.new'  do
        #expect(subject).to respond_to(:initialize).with(1).argument
          station = DockingStation.new(25)
          expect(station.capacity).to eq 25
      end
    end

    it 'a bike is docked with an working? attribute of false' do
      my_bike = Bike.new
      bike_status = my_bike.working?(false)
      docking_status = subject.dock(my_bike, bike_status)
      expect(docking_status.working).to eq false

    end

    it 'does not release broken bikes' do
      my_bike = Bike.new
      my_bike.working?(false)
      subject.dock(my_bike, my_bike.working)
      expect {subject.release_bike}.to raise_error 'The bike is broken'
    end




end
