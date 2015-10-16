require 'docking_station'

describe DockingStation do
  let (:bike) { double :bike}
  it {is_expected.to(respond_to(:release_bike))}

  it 'expects to be able to dock a bike at the docking station' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'expects to see a bike that has been docked' do
    expect(subject).to respond_to(:bikes)
  end

  it 'lets us see a bike that has been docked' do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.dock(bike)).to eq bike
  end

  it 'docks something' do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq bike
  end

    describe '#release_bike' do
      it 'releases a bike' do
        bike = double(:bike)
        allow(bike).to receive(:working).and_return(true)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end


      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'There are no bikes available'
      end
    end


    describe '#dock' do
      it 'raises an error when full' do
        20.times {subject.dock(double(:bike))}
        expect { subject.dock(double(:bike))}.to raise_error "The docking station is already at capacity"
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
      my_bike = double(:bike)
      allow(my_bike).to receive(:working).and_return(false)
    #  bike_status = my_bike.working?(false)
      docking_status = subject.dock(my_bike)
      expect(docking_status.working).to eq false

    end

    it 'does not release broken bikes' do
      my_bike = double(:bike)
      allow(my_bike).to receive(:working).and_return(false)
    #  my_bike.working?(false)
      subject.dock(my_bike)
      expect {subject.release_bike}.to raise_error 'The bike is broken'
    end

    it 'releases a working bike from mixed array' do
      my_bike = double(:bike)
      my_bike2 = double(:bike)
      my_bike3 = double(:bike)
      allow(my_bike3).to receive(:working).and_return(false)
      allow(my_bike).to receive(:working).and_return(true)
      allow(my_bike2).to receive(:working).and_return(true)

      subject.dock(my_bike3)
      subject.dock(my_bike2)
      subject.dock(my_bike)


      released_bike = subject.release_bike

      expect(released_bike).to eq my_bike2

    end



    end
