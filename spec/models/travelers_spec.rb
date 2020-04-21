require 'rails_helper'

RSpec.describe Traveler do

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end

  describe "methods" do
    it "average_mileage" do

    traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
    TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler1.id) 
    
    expect(traveler1.average_mileage).to eq(975) 
    end
  end
  

end
