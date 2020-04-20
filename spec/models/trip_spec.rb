require 'rails_helper'

RSpec.describe Trip, type: :model do

  describe "relationships" do
    it {should have_many :trip_travelers}
    it {should have_many(:travelers).through(:trip_travelers)}
  end

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

  describe "instance methods" do
    it "travelers_on_trip" do
      trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)

      traveler_1 = Traveler.create(name: "Sally Sue", age: 25)
      traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
      traveler_3 = Traveler.create(name: "Larry Duder", age: 37)

      TripTraveler.create(trip_id: trip_1.id, traveler_id: traveler_1.id)
      TripTraveler.create(trip_id: trip_1.id, traveler_id: traveler_2.id)

      expect(trip_1.travelers_on_trip).to include(traveler_1.name)
      expect(trip_1.travelers_on_trip).to include(traveler_2.name)
      expect(trip_1.travelers_on_trip).to_not include(traveler_3.name)
    end
  end
end
