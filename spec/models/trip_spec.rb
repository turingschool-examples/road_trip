require 'rails_helper'

describe Trip do
  describe "relationships" do
    it { should have_many :travelers }
    it { should have_many :traveler_trips }
  end

  describe "instance methods" do
    it "#sorted_by_mileage orders all trips in ASC mileage" do
      trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      trip_2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      trip_3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)

      expect(Trip.sorted_by_mileage).to eq([trip_2, trip_3, trip_1])
    end

    it "#similar_destination returns other trips with the same destination" do
      trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      trip_2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      trip_3 = Trip.create!(title: "Capital Ahoy", destination_city: "Washington, D.C.", mileage: 400)

      expect(trip_2.similar_destination).to eq([trip_3])
    end
  end
end
