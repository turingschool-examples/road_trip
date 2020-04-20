require 'rails_helper'

RSpec.describe Traveler do
  describe "relationships" do
    it { should have_many(:traveler_trips) } 
    it { should have_many(:trips).through(:traveler_trips)}
  end

  describe "instance methods" do
    before(:each) do
    @trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)

    @traveler1 = Traveler.create(name: "Sally Sue", age: 25)
    @traveler2 = Traveler.create(name: "John Wick", age: 20)
    @traveler3 = Traveler.create(name: "Luke Skywalker", age: 80)

    @traveler_trip1 = TravelerTrip.create!(traveler: @traveler1, trip: @trip1)
    @traveler_trip2 = TravelerTrip.create!(traveler: @traveler2, trip: @trip1)
    @traveler_trip3 = TravelerTrip.create!(traveler: @traveler3, trip: @trip1)
    end

    it "find_traveler_trip" do
      expect(@traveler1.find_traveler_trip(@trip1.id)).to eq( @traveler_trip1)
    end
  end
end