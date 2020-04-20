require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do

  before(:each) do
    @trip1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
    @trip3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip4 = Trip.create(title: "Bike n' Climb", destination_city: "Moab UT", mileage: 700)
    @molly = Traveler.create(name: "Molly", age: 26)
    @catherine = Traveler.create(name: "Catherine", age: 28)
    @hannah = Traveler.create(name: "Hannah", age: 30)
    @lily = Traveler.create(name: "Lily", age: 25)
    TravelerTrip.create(trip: @trip4, traveler: @molly)
    TravelerTrip.create(trip: @trip4, traveler: @catherine)
    TravelerTrip.create(trip: @trip4, traveler: @hannah)
    TravelerTrip.create(trip: @trip1, traveler: @lily)
    TravelerTrip.create(trip: @trip1, traveler: @hannah)
  end

  it "can visit a trips index page" do
    visit "/trips"
    expect(page.all('.trip')[0]).to have_content("#{@trip2.title}: #{@trip2.mileage} miles")
    expect(page.all('.trip')[1]).to have_content("#{@trip4.title}: #{@trip4.mileage} miles")
    expect(page.all('.trip')[2]).to have_content("#{@trip3.title}: #{@trip3.mileage} miles")
    expect(page.all('.trip')[3]).to have_content("#{@trip1.title}: #{@trip1.mileage} miles")
  end

  it "can visit a trips show page" do
    visit "/trips"
    expect(page).to have_link("#{@trip1.title}")
    click_link("#{@trip4.title}")
    expect(current_path).to eq("/trips/#{@trip4.id}")
    expect(page).to have_content(@trip4.title)
    expect(page).to have_content(@trip4.destination_city)
    expect(page).to have_content(@trip4.mileage)
    within ".travelers" do
      expect(page).to have_content(@molly.name)
      expect(page).to have_content(@catherine.name)
      expect(page).to have_content(@hannah.name)
      expect(page).to_not have_content(@lily.name)
    end
  end

  it "can remove a traveler from a trip" do
    visit "trips/#{@trip4.id}"
    within ".traveler-#{@hannah.id}" do
      click_link("Remove from Trip")
    end
    expect(current_path).to eq("/trips/#{@trip4.id}")
    within ".travelers" do
      expect(page).to_not have_content(@hannah.name)
      expect(page).to have_content(@molly.name)
      expect(page).to have_content(@catherine.name)
    end
    save_and_open_page
  end

end

#
#
# User Story 3, Remove a Traveler from a Trip
#
# As a visitor
# When I visit a trips show page
# Next to each traveler’s name
# I see a button to remove that traveler from the trip
# When I click that button for a particular traveler
# I am redirected back to the trips show page
# And I no longer see that traveler’s name listed
