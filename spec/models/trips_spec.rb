require 'rails_helper'

describe Trip, type: :model do
  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end
  describe "class methods" do
    before(:each) do
      @trip_1 = Trip.create(  title: "Winterland Ballroom",
                              destination_city: "San Francisco, CA",
                              mileage: 1250)
      @trip_2 = Trip.create(  title: "Shoreline Ampitheatre",
                              destination_city: "Mountain View, CA",
                              mileage: 1200)
      @trip_3 = Trip.create(  title: "Madison Square Garden",
                              destination_city: "New York City, NY",
                              mileage: 1800)
      @trip_4 = Trip.create(  title: "Red Rocks",
                              destination_city: "Morrison, CO",
                              mileage: 25)
    end

    it "trip.trips_by_mileage_ascending" do
      expect(Trip.trips_by_mileage_ascending).to eq ([@trip_4, @trip_2, @trip_1, @trip_3])
    end
  end
end
