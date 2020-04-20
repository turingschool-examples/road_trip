require 'rails_helper'

RSpec.describe 'Trips show page' do
  before(:each) do
    @trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)

    @traveler1 = Traveler.create(name: "Sally Sue", age: 25)
    @traveler2 = Traveler.create(name: "John Wick", age: 20)
    @traveler3 = Traveler.create(name: "Luke Skywalker", age: 80)

    TravelerTrip.create!(traveler: @traveler1, trip: @trip1)
    TravelerTrip.create!(traveler: @traveler2, trip: @trip1)
    TravelerTrip.create!(traveler: @traveler3, trip: @trip1)
  end

  it "displays trips information" do
    visit "/trips/#{@trip1.id}"
    expect(page).to have_content(@trip1.name)
    expect(page).to have_content(@trip1.destination_city)
    expect(page).to have_content(@trip1.mileage)

    within "#trip-travelers" do
      expect(page).to have_content("Travelers on this Trip:")
      expect(page).to have_content(@traveler1.name)
      expect(page).to have_content(@traveler2.name)
      expect(page).to have_content(@traveler3.name)
    end
  end
end