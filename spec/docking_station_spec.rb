require 'docking_station'

describe DockingStation do
  it {is_expected.to(respond_to(:release_bike))}

  it 'expects to be able to dock a bike at the docking station' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'expects to see a bike that has been docked' do
    expect(subject).to respond_to(:bikes)
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
        20.times { subject.dock(Bike.new) }
        expect { subject.dock(Bike.new) }.to raise_error "The docking station is already at capacity"
      end
    end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(subject.bikes)
  end

  it 'lets us see a bike that has been docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq bike
  end



end
