require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "class methods" do
    it "ordered" do
      trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
      trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

      expect(Trip.ordered[0]).to eq(trip_2)
      expect(Trip.ordered[1]).to eq(trip_4)
      expect(Trip.ordered[2]).to eq(trip_3)
      expect(Trip.ordered[3]).to eq(trip_1)
    end
  end
end
