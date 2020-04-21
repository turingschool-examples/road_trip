require 'rails_helper'

RSpec.describe Traveler do

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end

  context "methods" do
    before :each do
      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)

      @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)

      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler1.id)
      TravelerTrip.create!(trip_id: @trip2.id, traveler_id: @traveler1.id)
    end

    describe "#avg_mileage" do
      it "returns the average mileage of all that traveler's trips" do
        expect(@traveler1.avg_mileage.to_f).to eq((1100.0 + 850.0)/2)
      end
    end
  end
end
