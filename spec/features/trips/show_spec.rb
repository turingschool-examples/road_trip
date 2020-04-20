require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I click on a trips title and am taken to a trips show page' do
    it 'I can see title destination city and mileage and all travelers on that trip' do
      trip1 = Trip.create(title: "Cheese Tour 2020",
                          destination_city: "Madison WI",
                          mileage: 1100)

      trip2 = Trip.create(title: "Who is America Anyway?",
                          destination_city: "Washington, D.C.",
                          mileage: 300)
      traveler1 = trip1.travelers.create(name: "Sally Sue",
                                         age: 25)

      traveler2 = trip1.travelers.create(name: "Tommy Tom",
                                         age: 46)

      traveler3 = trip2.travelers.create(name: "Cory Cory",
                                         age: 19)

      visit '/trips'

      click_link "#{trip1.title}"

      expect(current_path).to eq("/trips/#{trip1.id}")
      expect(page).to have_content(trip1.title)
      expect(page).to have_content(trip1.destination_city)
      expect(page).to have_content(trip1.mileage)
      expect(page).to have_content(traveler1.name)
      expect(page).to have_content(traveler2.name)

      expect(page).to have_no_content(trip2.title)
      expect(page).to have_no_content(trip2.destination_city)
      expect(page).to have_no_content(trip2.mileage)
      expect(page).to have_no_content(traveler3.name)
    end
  end
end

# User Story 2, Trips Show Page
# ​
# As a visitor
# When I visit a trips index page
# And I click on a trips title
# I’m taken to that trip’s show page
# And I can see that trips title, destination city, mileage
# And I also see a list of the names of the travelers that are on this trip
# ```