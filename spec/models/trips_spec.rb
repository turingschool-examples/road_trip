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

    it "trip.remove_traveler" do
      traveler_1 = Traveler.create(  name: "Jack Straw",
                                      age: 25)
      traveler_2 = Traveler.create(  name: "Casey Jones",
                                      age: 46)
      trav_trip_1 = @trip_1.traveler_trips.create(traveler: traveler_1)
      trav_trip_2 = @trip_1.traveler_trips.create(traveler: traveler_2)

      expect(@trip_1.traveler_trips).to eq([trav_trip_1, trav_trip_2])
      expect(@trip_1.travelers).to eq([traveler_1, traveler_2])
      Trip.remove_traveler({id: "#{@trip_1.id}", traveler_id: "#{traveler_1.id}"})
      @trip_1.reload
      expect(@trip_1.traveler_trips).to eq([trav_trip_2])
      expect(@trip_1.travelers).to eq([traveler_2])
    end
  end
end
