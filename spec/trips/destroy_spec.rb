require "rails_helper"

RSpec.describe "Trip remove travelers", type: :feature do
  it "I can click a link from the trips show to remove travelers from a trip" do
    trip1 = Trip.create( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create( title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create( title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    trip4 = Trip.create( title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    
    traveler1 = Traveler.create(name: "Sally Sue", age: 25) 
    traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
    traveler3 = Traveler.create(name: "Cory Cory", age: 19) 
    traveler4 = Traveler.create(name: "Mary Mae", age: 44) 
    traveler5 = Traveler.create(name: "Smith John", age: 9)

    trip1.travelers << traveler1
    trip1.travelers << traveler2

    visit trip_path(trip1)
    
    within ".travelers" do
      click_link "#remove-#{traveler1.id}"
    end

    expect(current_path).to eq(trip_path(trip1))

    within ".travelers" do
      expect(page).to_not have_content(traveler1.name)
      expect(page).to have_content(traveler2.name)
    end
    
  end

end