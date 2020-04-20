require 'rails_helper'

describe "As a visitor", type: :feature do
  before :each do
    Traveler1 = Traveler.create!( name: "Sally Sue", age: 25)
    Traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
    Traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
    Traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
    Traveler5 = Traveler.create!(name: "Smith John", age: 9)
    Trip1 = Traveler1.trips.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    Trip2 = Traveler2.trips.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    Trip3 = Traveler2.trips.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    Trip4 = Traveler3.trips.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
  end
  it "I can see the titles of my trip" do
    visit "/trips"

    expect(page).to have_content(Trip1.title) 
    expect(page).to have_content(Trip2.title) 
    expect(page).to have_content(Trip3.title) 
    expect(page).to have_content(Trip4.title) 

  end
end


# As a visitor
# When I visit a trips index page
# I see the titles of all trips in my database listed in order of their mileage (ascending order)