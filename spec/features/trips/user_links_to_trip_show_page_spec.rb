require "rails_helper"

RSpec.describe "Trip Show Page" do
  describe "when I visit /trips/:id (trip show page) by clicking a link on the index" do
    it "I see that trip's information" do
      trip = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)

      traveler1 = Traveler1.cretae!(name: “Sally Sue”, age: 25)
      traveler2 = Traveler2.cretae!(name: “Tommy Tim”, age: 46)

      expect(page).to have_content("#{trip.title}")
      expect(page).to have_content("#{trip.destination_city}")
      expect(page).to have_content("#{trip.mileage}")
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
