require 'rails_helper'

RSpec.describe Traveler do

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end

  it ".average_mileage" do

    trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    trip4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    trip5 = Trip.create!(title: "Arches", destination: "Moab, UT", mileage: 900)

    traveler1 = Traveler.create!(name: "Sally Sue", age: 25)

    TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
    TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler1.id)

    expect(traveler1.average_mileage).to eq(975)
  end
end
