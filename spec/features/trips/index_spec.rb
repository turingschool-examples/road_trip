require "rails_helper"

RSpec.describe "Trip index view", type: :feature do
  it 'I can see titles of all my trips in order of milage' do
    trip1 = Trip.create( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create( title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create( title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    trip4 = Trip.create( title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    
    traveler1 = Traveler.create(name: "Sally Sue", age: 25) 
    traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
    traveler3 = Traveler.create(name: "Cory Cory", age: 19) 
    traveler4 = Traveler.create(name: "Mary Mae", age: 44) 
    traveler5 = Traveler.create(name: "Smith John", age: 9)
    visit trips_path

    expect(trip2.title).to appear_before(trip4.title) 
    expect(trip4.title).to appear_before(trip3.title) 
    expect(trip3.title).to appear_before(trip1.title) 
    
  end
end