require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "trips show page" do
    it "shows the trips title, destination city and mileage" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      trip3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      trip4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)

      visit "/trips/#{trip1.id}"
    
      expect(page).to have_content("Cheese Tour 2020")
      expect(page).to have_content("Madison, WI")
      expect(page).to have_content("1100")
      expect(page).to_not have_content("Who is America Anyway?")
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
