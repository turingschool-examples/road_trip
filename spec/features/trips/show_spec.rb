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

  it "has a button to remove a traveler from that trip next to traveler" do
    visit "/trips/#{@trip1.id}"

    within "#traveler-#{@traveler1.id}" do
      expect(page).to have_button('Remove Traveler')
    end
  end

  it "removes travelers from the show page" do
    visit "/trips/#{@trip1.id}"
    expect(page).to have_content(@traveler1.name)

    within "#traveler-#{@traveler1.id}" do
      click_button('Remove Traveler')
    end

    expect(page).to have_current_path("/trips/#{@trip1.id}")
    expect(page).to_not have_content(@traveler1.name)
  end

  it "has a section of the page that lists trips witht the same destination" do
    trip2 = Trip.create(name: "Midwest College Tour", destination_city: "Madison, WI", mileage: 1100)
    trip3 = Trip.create(name: "Badger Game Weekend", destination_city: "Madison, WI", mileage: 300)
    trip4 = Trip.create(name: "Bar Crawl", destination_city: "Madison, WI", mileage: 1)
    visit "/trips/#{@trip1.id}"

    within "#similar-trips" do
      expect(page).to have_content("Other Trips to this Destination")
      expect(page).to have_link(trip2.name)
      expect(page).to have_link(trip3.name)
      expect(page).to have_link(trip4.name)
      expect(page).to_not have_link(@trip1.name)

      click_link(trip2.name)
    end

    expect(page).to have_current_path("/trips/#{trip2.id}")
  end

  it "says no similar trips if trip cannot find any trips with the same name" do
    visit "/trips/#{@trip1.id}"
    within "#similar-trips" do
      expect(page).to have_content("No trips match this trip's destination")
    end
  end
end