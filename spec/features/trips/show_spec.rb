
require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do


  it "I can see a show page for trip" do

    trip = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison, WI",
                        mileage: 1100)

    trip2 = Trip.create(title: "Who is America Anyway?",
                        destination_city: "Washington, D.C.",
                        mileage: 300)

    traveler1 = trip.travelers.create(name: "Sally Sue", age: 25)
    traveler2 = trip.travelers.create(name: "Tommy Tom", age: 46)
    traveler3 = trip.travelers.create(name: "Cory Cory", age: 19)
    traveler4 = trip2.travelers.create(name: "Bobby Bob", age: 34)

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
    expect(page).to have_no_content(traveler4.name)
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

  it "I can find similar trips" do

    trip1 = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison, WI",
                        mileage: 1100)
    trip2 = Trip.create(title: "Scary Houses",
                        destination_city: "Madison, WI",
                        mileage: 1100)

    trip3 = Trip.create(title: "Gold Mines",
                        destination_city: "Denver, CO",
                        mileage: 8000)
    trip4 = Trip.create(title: "Wind for days",
                        destination_city: "Laramie, WY",
                        mileage: 2135)
    trip5 = Trip.create(title: "Cheese and Wine",
                        destination_city: "Madison, WI",
                        mileage: 1100)
    visit "/trips/#{trip1.id}"

    within("#similar-trips") do
      expect(page).to have_link(trip2.title)
      expect(page).to have_link(trip5.title)
      expect(page).to have_no_content(trip1.title)
      expect(page).to have_no_content(trip3.title)
      expect(page).to have_no_content(trip4.title)
      click_on "#{trip2.title}"
    end
    expect(current_path).to eql("/trips/#{trip2.id}")
  end
end
