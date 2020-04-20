require 'rails_helper'

RSpec.describe 'As a visitor on the trips index', type: :feature do
  before(:each) do
    @traveler_1 = Traveler.create(name: 'Sally Sue', age: 25)
    @trip_1 = @traveler_1.trips.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 900)
    @trip_2 = @traveler_1.trips.create(title: "Walk America", destination: "Madison, WI", mileage: 5100)
    @trip_3 = @traveler_1.trips.create(title: "National Bar Crawl", destination: "Madison, WI", mileage: 1100)
    @trip_4 = @traveler_1.trips.create(title: "Scooter Tour", destination: "Madison, WI", mileage: 40)
  end

  it "I can see the titles of all trips in my database listed in order of their mileage (ascending order)" do
    visit '/trips'

    within '.user-trips' do
      within "#trip-#{@trip_1.id}" do
        expect(page).to have_content(@trip_1.title)
        expect(page).to have_content(@trip_1.mileage)
      end
      within "#trip-#{@trip_2.id}" do
        expect(page).to have_content(@trip_2.title)
        expect(page).to have_content(@trip_2.mileage)
      end
    end
  end

  it "I can click on a trips title and I am taken to that trips show page" do
    visit '/trips'

    click_on @trip_1.title

    expect(current_path).to eql("/trips/#{@trip_1.id}")
  end
end

# ```
# User Story 1, Trips Index Page
# ​
# As a visitor
# When I visit a trips index page
# I see the titles of all trips in my database listed in order of their mileage (ascending order)
