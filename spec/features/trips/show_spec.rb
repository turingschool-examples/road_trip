
require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do


  it "I can see a show page for trip" do

    trip = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison, WI",
                        mileage: 1100)
    traveler1 = trip.travelers.create(name: "Sally Sue", age: 25)
    traveler2 = trip.travelers.create(name: "Tommy Tom", age: 46)
    traveler3 = trip.travelers.create(name: "Cory Cory", age: 19)

    visit "/trips"
    expect(page).to have_link(trip.title)
    click_on 'Cheese Tour 2020'
    expect(current_path).to eql("/trips/#{trip.id}")

    expect(page).to have_content(trip.title)
    expect(page).to have_content(trip.destination_city)
    expect(page).to have_content(trip.mileage)
    expect(page).to have_content(trip.mileage)

    expect(page).to have_content(traveler1.name)
    expect(page).to have_content(traveler2.name)
    expect(page).to have_content(traveler3.name)
  end

  it "I can remove a traveler from a trip" do

    trip = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison, WI",
                        mileage: 1100)
    traveler1 = trip.travelers.create(name: "Sally Sue", age: 25)
    traveler2 = trip.travelers.create(name: "Tommy Tom", age: 46)
    traveler3 = trip.travelers.create(name: "Cory Cory", age: 19)

    visit "/trips/#{trip.id}"

    expect(page).to have_content(traveler1.name)
    expect(page).to have_content(traveler2.name)
    expect(page).to have_content(traveler3.name)
    within("#traveler-#{traveler2.id}") do
      expect(page).to have_content(traveler2.name)
      click_button "Remove traveler"
    end

    expect(page).to have_content(traveler1.name)
    expect(page).to have_no_content(traveler2.name)
    expect(page).to have_content(traveler3.name)
  end
end
