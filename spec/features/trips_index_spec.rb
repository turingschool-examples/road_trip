require 'rails_helper'

RSpec.describe "as a visitor when I visit the trips index page" do
  it "I see the titles of all the trips listed in order of mileage (ascending order)" do

    trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
    trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

    visit "/trips"

    expect(page).to have_content(trip_1.title)
    expect(page).to have_content(trip_1.destination_city)
    expect(page).to have_content(trip_1.mileage)

  end
end

# As a visitor
# When I visit a trips index page
# I see the titles of all trips in my database listed in order of their mileage (ascending order)
