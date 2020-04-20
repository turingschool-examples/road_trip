require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it {should have_many :traveler_trips}
    it {should have_many :travelers}
  end

  describe "instance methods" do
    it "similar_trips" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
      trip3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      trip4 = Trip.create(title: "Bike n' Climb", destination_city: "Moab UT", mileage: 700)
      trip5 = Trip.create(title: "Tour de Canyons", destination_city: "Moab UT", mileage: 400)
      trip6 = Trip.create(title: "Cacti Cruise", destination_city: "Moab UT", mileage: 500)

      expect(trip6.similar_trips).to eq([trip4, trip5])
      expect(trip2.similar_trips).to eq([])

    end
  end

end
