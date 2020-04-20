require 'rails_helper'

RSpec.describe "As a visitor when I visit the trip show" do
  it 'I see the trips title, destination, and mileage' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)

    visit "/trips/#{trip1.id}"
    expect(page).to have_content(trip1.title)
    expect(page).to have_content(trip1.destination)
    expect(page).to have_content(trip1.mileage)

  end
  
  it 'I see the a list of all the travelers on that trip' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)

    traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    traveler2 = Traveler.create!(name: "Tommy Tom", age: 25)
    traveler3 = Traveler.create!(name: "Maggie Mae", age: 25)

    TravelerTrip.create!(trip: trip1, traveler: traveler1)
    TravelerTrip.create!(trip: trip1, traveler: traveler2)

    visit "/trips/#{trip1.id}"
    expect(page).to have_content("Travelers:")
    expect(page).to have_content(traveler1.name)
    expect(page).to have_content(traveler2.name)
    expect(page).to_not have_content(traveler3.name)
  end

end