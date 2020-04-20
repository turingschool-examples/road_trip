require 'rails_helper'

RSpec.describe 'As a visitor on the trip show page', type: :feature do
  before(:each) do
    @traveler_1 = Traveler.create(name: 'Sally Sue', age: 25)
    @trip_1 = @traveler_1.trips.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 900)
    @trip_2 = @traveler_1.trips.create(title: "Walk America", destination: "Santa Fe, NM", mileage: 5100)
    @trip_3 = @traveler_1.trips.create(title: "National Bar Crawl", destination: "Madison, WI", mileage: 1100)
    @trip_4 = @traveler_1.trips.create(title: "Scooter Tour", destination: "Green Bay, WI", mileage: 40)

    @traveler_2 = @trip_1.travelers.create(name: 'Dapper Dan', age: 22)
    @traveler_3 = @trip_1.travelers.create(name: 'Timmy Tom', age: 29)
  end

  it "I can see that trips title, destination city, mileage" do
    visit "/trips/#{@trip_1.id}"

    expect(page).to have_content(@trip_1.title)
    expect(page).to have_content(@trip_1.destination)
    expect(page).to have_content(@trip_1.mileage)

    visit "/trips/#{@trip_2.id}"

    expect(page).to have_content(@trip_2.title)
    expect(page).to have_content(@trip_2.destination)
    expect(page).to have_content(@trip_2.mileage)
  end

  it "I can see a list of the names of the travelers that are on this trip" do
    visit "/trips/#{@trip_1.id}"

    within "#current-travelers" do
      expect(page).to have_content(@traveler_2.name)
      expect(page).to have_content(@traveler_3.name)
    end
  end

  xit "I can click a button next to each trip traveler to remove them, and am redirected back to the trips show page" do
    visit "/trips/#{@trip_1.id}"

    within "#current-traveler-#{@traveler_2.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eql("/trips/#{@trip_1.id}")

    within '#current-travelers' do
      expect(page).to have_no_css("#current-traveler-#{@traveler_2}")
    end
  end

  it "I can see a list of trip titles that have the same destination as this trip, but this should not include the trip who’s show page I’m on" do
    visit "/trips/#{@trip_1.id}"

    within '.similar-trips' do
      expect(page).to have_content(@trip_3.title)
      expect(page).to have_no_content(@trip_1.title)
    end
  end
end

# User Story 4, Similar Trips
# ​
# As a visitor
# When I visit a trips show page
# I see a section on the page titled, “Other Trips to this Destination”
# And under that title I see a list of trip titles that have the same destination as this trip, but this should not include the trip who’s show page I’m on
# And all of those titles are links to that trips show page


# As a visitor
# When I visit a trips show page
# Next to each traveler’s name
# I see a button to remove that traveler from the trip
# When I click that button for a particular traveler
# I am redirected back to the trips show page
# And I no longer see that traveler’s name listed
