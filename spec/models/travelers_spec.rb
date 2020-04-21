require 'rails_helper'

RSpec.describe Traveler do

  describe "relationships" do
    it {should have_many :traveler_trips}
    it {should have_many(:trips).through(:traveler_trips)}
  end

  describe 'instance methods' do
    it '.average_trip_mileage' do
      traveler = Traveler.create!(name: "Sally Sue", age: 25)
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 5)
      trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 11)
      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler.id)
      TravelerTrip.create!(trip_id: trip2.id, traveler_id: traveler.id)

      expect(traveler.average_trip_mileage).to eq(8)
    end
  end
end
