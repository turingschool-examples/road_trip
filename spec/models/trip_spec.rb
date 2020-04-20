require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it { should have_many(:trip_travelers) }
    it { should have_many(:travelers).through(:trip_travelers) }
  end

  describe 'instance methods' do
    before(:each) do
      @trip1 = Trip.create(
        title: "Cheese Tour 2020",
        destination_city: "Madison, WI",
        mileage: 1100,)

      @trip2 = Trip.create(
        title: "Who is America Anyway?",
        destination_city: "Washington, D.C.",
        mileage: 300)

      @trip3 = Trip.create(
        title: "The Big Apple",
        destination_city: "New York City, NY",
        mileage: 850)

      @trip4 = Trip.create(
        title: "Bike n’ Climb",
        destination_city: "Moab, UT",
        mileage: 700)
    end

    it 'mileage_asc' do
      trips = Trip.all
      expect(trips.mileage_asc).to eq([@trip2, @trip4, @trip3, @trip1])
    end
  end
end
