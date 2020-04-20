require 'rails_helper'

describe Trip, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination }
    it { should validate_presence_of :mileage }
  end

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:travelers).through(:traveler_trips)}
  end

  describe "class methods" do
    before(:each) do
      @trip_1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip_2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip_3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip_4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    end

    it '.sorted_by_mileage' do
      expect(Trip.sorted_by_mileage).to eq([@trip_2, @trip_4, @trip_3, @trip_1])
    end
  end
end
