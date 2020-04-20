require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can remove a traveler from a trip" do
    trip = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    traveler = trip.travelers.create(name: "Sally Sue", age: 25)

    visit trip_path(trip)

    within("#traveler-#{traveler.id}") do
      click_button("Remove Traveler")
    end

    expect(current_path).to eq(trip_path(trip))
    expect(page).to have_no_content(traveler.name)
  end
end