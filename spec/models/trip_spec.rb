require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "relationships" do
    it { should have_many :traveler_trips}
    it { should have_many(:travelers).through(:traveler_trips)}
  end

  describe "instance methods" do
    it "#similar_trips" do
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "Who is America Anyway?", city: "Washington, D.C.", mileage: 300)
      trip3 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
      trip4 = Trip.create!(title: "Bike n’ Climb", city: "Moab, UT", mileage: 700)
      trip5 = Trip.create!(title: "Arches", city: "Moab, UT", mileage: 900)

      expect(trip4.similar_trips).to eq([trip5])
    end
  end
end
