require 'rails_helper'

RSpec.describe Trip, type: :model do 
  describe "relationships" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :city}
    it {should validate_presence_of :mileage}
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end 

  describe "class methods" do 
    it "#by_mileage" do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
      trip3 = Trip.create!(title: "Bike n’ Climb", city: "Moab, UT", mileage: 700)

      expect(Trip.by_mileage).to eq([trip3, trip2, trip1])
    end
  end 
end