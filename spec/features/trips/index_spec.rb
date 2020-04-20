require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  it "I can see all trips at '/trips'" do

    trip1 = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison, WI",
                        mileage: 1100)

    trip2 = Trip.create(title: "Who is America Anyway?",
                        destination_city: "Washington, D.C.",
                        mileage: 300)

    trip3 = Trip.create(title: "The Big Apple",
                        destination_city: "New York City, NY",
                        mileage: 850)
    trip4 = Trip.create(title: "Bike n’ Climb",
                        destination_city: "Moab, UT",
                        mileage: 700)

    visit "/trips"
    expect(page.all('li')[0]).to have_content(trip2.title)
    expect(page.all('li')[1]).to have_content(trip4.title)
    expect(page.all('li')[2]).to have_content(trip3.title)
    expect(page.all('li')[3]).to have_content(trip1.title)


  end
end
