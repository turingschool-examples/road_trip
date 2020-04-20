require 'rails_helper'

describe "trips show page" do
  before(:each) do
    @trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    @traveler_1 = Traveler.create(name: "Sally Sue", age: 25)
    @traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
    @traveler_3 = Traveler.create(name: "Cory Cory", age: 19)
    @traveler_trip_1 = TravelerTrip.create(trip: @trip_1, traveler: @traveler_1)
    @traveler_trip_2 = TravelerTrip.create(trip: @trip_1, traveler: @traveler_2)
  end

  it "shows title, destination, mileage, and a list of travelers that are on the trip" do
    visit "/trips"
    click_link "#{@trip_1.title}"
    expect(current_path).to eq("/trips/#{@trip_1.id}")

    expect(page).to have_content(@trip_1.title)
    expect(page).to have_content(@trip_1.destination_city)
    expect(page).to have_content(@trip_1.mileage)
    expect(page).to have_content(@traveler_1.name)
    expect(page).to have_content(@traveler_2.name)
    expect(page).to have_no_content(@traveler_3.name)
  end

  it "can remove travelers" do
    visit "/trips/#{@trip_1.id}"

    within("#travelers-list") do
      expect(page).to have_content(@traveler_1.name)
      expect(page).to have_content(@traveler_2.name)
      within("#traveler-#{@traveler_1.id}") do
        click_link("Remove Traveler")
      end
    end
    expect(current_path).to eq("/trips/#{@trip_1.id}")
    within("#travelers-list") do
      expect(page).to have_no_content(@traveler_1.name)
      expect(page).to have_content(@traveler_2.name)
    end
  end
end
