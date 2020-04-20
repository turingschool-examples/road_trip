require "rails_helper"

RSpec.describe Trip, type: :model do

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :destination_city }
    it { should validate_presence_of :mileage }
  end

  describe "relationships" do
    it { should have_many :trip_travelers}
    it { should have_many(:travelers).through(:trip_travelers)}
  end

  describe 'methods' do
    it 'similar_trips' do
      trip1 = Trip.create(title: "Bike n’ Climb",
                          destination_city: "Moab, UT",
                          mileage: 700)

      trip2 = Trip.create(title: "Scary Houses",
                          destination_city: "Madison, WI",
                          mileage: 2000)

      trip3 = Trip.create(title: "Cheese and Wine",
                          destination_city: "Madison, WI",
                          mileage: 1100)
      expect(trip2.similar_trips).to eq([trip3])
      expect(trip1.similar_trips).to eq([])
    end

    it 'by_mileage' do
      trip1 = Trip.create(title: "Bike n’ Climb",
                          destination_city: "Moab, UT",
                          mileage: 700)

      trip2 = Trip.create(title: "Scary Houses",
                          destination_city: "Madison, WI",
                          mileage: 2000)

      trip3 = Trip.create(title: "Cheese and Wine",
                          destination_city: "Madison, WI",
                          mileage: 1100)
      expect(Trip.by_mileage).to eq([trip1, trip3, trip2])
    end
  end
end
