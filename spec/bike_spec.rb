require 'docking_station'

describe Bike do
    it {is_expected.to(respond_to(:working?))}


    it 'allows a user of a bike to change status to not working' do
        my_bike = Bike.new
        expect(my_bike.working?(false)).to eq false
    end

    
end
