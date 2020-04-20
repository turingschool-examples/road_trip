require 'rails_helper'

RSpec.describe "As a visitor when I visit a trips index page" do
  it "I can see the titles of all trips listed in order of their milage in ascending order" do
    trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
    trip2 = Trip.create!(title: "Who is America Anyway?", city: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
    trip4 = Trip.create!(title: "Bike n’ Climb", city: "Moab, UT", mileage: 700)

    visit '/trips'

    expect(trip1.title).to_not appear_before(trip3.title)
    expect(trip3.title).to_not appear_before(trip4.title)
    expect(trip4.title).to_not appear_before(trip2.title)

    expect(page).to have_content(trip1.title)
    expect(page).to_not have_content(trip1.city)
    expect(page).to_not have_content(trip1.mileage)
    expect(page).to have_content(trip2.title)
    expect(page).to_not have_content(trip2.city)
    expect(page).to_not have_content(trip2.mileage)
    expect(page).to have_content(trip3.title)
    expect(page).to_not have_content(trip3.city)
    expect(page).to_not have_content(trip3.mileage)
    expect(page).to have_content(trip4.title)
    expect(page).to_not have_content(trip4.city)
    expect(page).to_not have_content(trip4.mileage)
  end
end
