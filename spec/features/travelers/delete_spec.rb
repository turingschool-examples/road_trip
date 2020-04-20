require 'rails_helper'

RSpec.describe "when click delete button for traveler on trip show page" do
  before(:each) do

    @trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1110)
    @trip_2 = Trip.create(title: "America Anyway?", destination_city: "Washington D.C.", mileage: 300)
    @trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)

    @traveler_1 = @trip_1.travelers.create(name: "Sally Sue", age: 25)
    @traveler_2 = @trip_2.travelers.create(name: "Tommy Tom", age: 46)
    @traveler_3 = @trip_2.travelers.create(name: "Mary Mae", age: 44)
    @traveler_4 = @trip_3.travelers.create(name: "Johnny Johnson", age: 16)

    visit "/trips/#{@trip_1.id}"
  end

  it "deletes traveler from the trip show page" do

    within "#traveler-#{@traveler_1.id}" do
      click_button "Remove Traveler"
    end

    expect(current_path).to eq("/trips/#{@trip_1.id}")
    expect(page).to_not have_content("#{@traveler_1.name}")
  end
end













# As a visitor
# When I visit a trips show page
# Next to each traveler’s name
# I see a button to remove that traveler from the trip
# When I click that button for a particular traveler
# I am redirected back to the trips show page
# And I no longer see that traveler’s name listed
