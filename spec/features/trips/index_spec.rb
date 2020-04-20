require 'rails_helper'

describe "trips index page" do
  it "sees all trips in DB listed in order of mileage" do
    trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    trip_2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    trip_3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)

    visit "/trips"

    expect(trip_2.title).to appear_before(trip_3.title)
    expect(trip_3.title).to appear_before(trip_1.title)
  end
end
