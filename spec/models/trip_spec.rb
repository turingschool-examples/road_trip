require "rails_helper"

RSpec.describe "Trip", type: :model do
  describe 'releationships' do
    
  end
  
  describe 'instance methods' do
    it 'similar_trips' do
    trip1 = Trip.create( title: "First Base Course 2020", destination: "Moab, UT", mileage: 1100)
    trip2 = Trip.create( title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create( title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    trip4 = Trip.create( title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)

    expect(trip1.similar_trips).to include(trip4)
    expect(trip1.similar_trips).to_not include(trip2, trip3)
    end
  end
  
end