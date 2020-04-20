require 'rails_helper'

RSpec.describe TravelerTrip, type: :model do 
  describe "relationships" do 
    it {should belong_to :traveler}
    it {should belong_to :trip}
  end

  describe "instance methods" do
    it ".delete_traveler" do
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      traveler1 = trip1.travelers.create!(name: "Sally Sue", age: 25)
      traveler2 = trip1.travelers.create!(name: "Tommy Tom", age: 46)
      traveler3 = trip1.travelers.create!(name: "Cory Cory", age: 19)

      expect(trip1.delete_traveler).to eq([traveler2, traveler3])
    end
  end
end