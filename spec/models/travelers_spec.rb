require 'rails_helper'

RSpec.describe Traveler do

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end

  describe 'methods' do
    it "trip_avg" do
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      trip4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
      trip5 = Trip.create!(title: "Arches", destination: "Moab, UT", mileage: 900)
      traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      traveler2 = Traveler.create!(name: "Cory Cory", age: 19)
      TravelerTrip.create!(trip_id: trip2.id, traveler_id: traveler1.id)
      TravelerTrip.create!(trip_id: trip4.id, traveler_id: traveler1.id)
      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler2.id)
      TravelerTrip.create!(trip_id: trip5.id, traveler_id: traveler2.id)

      expect(traveler1.trip_avg).to eq(500)
      expect(traveler2.trip_avg).to eq(1000)
    end
  end
end
