require 'rails_helper'

RSpec.describe "As a visitor" do
  before(:each) do
    @trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    @trip3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    @trip4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
    @traveler1 = @trip1.travelers.create(name: "Sally Sue", age: 25)
    @traveler2 = @trip1.travelers.create(name: "Tommy Tom", age: 46)
    @traveler3 = @trip2.travelers.create(name: "Cory Cory", age: 19)
    @traveler4 = @trip3.travelers.create(name: "Mary Mae", age: 44)
    @traveler5 = @trip4.travelers.create(name: "Smith John", age: 9)
  end

  it "I can remove a traveler from a trip" do
    visit "/trips/#{@trip1.id}"

    within("#traveler-#{@traveler1.id}") do
      click_button("Remove Traveler")
    end

    expect(current_path).to eq("/trips/#{@trip1.id}")
    expect(page).to have_no_content(@traveler1.name)
  end
end