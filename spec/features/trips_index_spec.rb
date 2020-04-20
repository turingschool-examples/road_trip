require 'rails_helper'

RSpec.describe "as a visitor when I visit the trips index page" do
  it "I see the titles of all the trips listed in order of mileage (ascending order)" do

    trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
    trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

    visit "/trips"

    within ".trip-#{trip_1.id}" do
      expect(page).to have_content(trip_1.title)
    end

    within ".trip-#{trip_2.id}" do
      expect(page).to have_content(trip_2.title)
    end

    within ".trip-#{trip_3.id}" do
      expect(page).to have_content(trip_3.title)
    end

    within ".trip-#{trip_4.id}" do
      expect(page).to have_content(trip_4.title)
    end

    expect("Who is America Anyway?").to appear_before("Bike n’ Climb")
    expect("Bike n’ Climb").to appear_before("The Big Apple")
    expect("The Big Apple").to appear_before("Cheese Tour 2020")

  end
end
