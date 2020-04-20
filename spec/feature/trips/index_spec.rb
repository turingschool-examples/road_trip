require "rails_helper"

RSpec.describe "When I visit a trips index page", type: :feature do
  before(:each) do
    @trip1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    @trip3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip4 = Trip.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
  end
  it "I see the titles of all trips in my database listed in order of their mileage (ascending order)" do
    visit "/trips"

    expect(page.all(".trip_title")[0]).to eql("Who is America Anyway?")
    expect(page.all(".trip_title")[1]).to eql("Bike n’ Climb")
    expect(page.all(".trip_title")[2]).to eql("The Big Apple")
    expect(page.all(".trip_title")[3]).to eql("Cheese Tour 2020")
  end
end
