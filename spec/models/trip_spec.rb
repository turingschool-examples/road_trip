require 'rails_helper'

describe Trip, type: :model do

  describe 'relationships' do
    it { should have_many :traveler_trips}
    it { should have_many(:travelers).through(:traveler_trips) }
  end

  describe 'class methods' do
    it '#sort_by_mileage' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create!( title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create!( title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    trip4 = Trip.create!( title: "Bike and Climb", destination: "Moab, UT", mileage: 700)


    expect(Trip.sort_by_mileage).to eq([trip2, trip4, trip3, trip1])
    end
  end
end