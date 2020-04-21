require 'rails_helper'

RSpec.describe Traveler do

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end

  describe "instance methods" do 
    it "average_mileage" do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      TravelerTrip.create(trip: trip1, traveler: traveler1)
      TravelerTrip.create(trip: trip2, traveler: traveler1)

      expect(traveler1.average_mileage).to eq(975)
    end
  end

end
