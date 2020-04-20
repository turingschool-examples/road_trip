require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "trips show page" do
    it "shows the trips title, destination city and mileage" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)

      visit "/trips/#{trip1.id}"

      expect(page).to have_content("Cheese Tour 2020")
      expect(page).to have_content("Madison, WI")
      expect(page).to have_content("1100")
      expect(page).to_not have_content("Who is America Anyway?")
    end

    it "shows list of all travelers that are on this trip" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)

      traveler1 = Traveler.create(name: "Sally Sue", age: 25)
      traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
      traveler3 = Traveler.create(name: "Cory Cory", age: 19)

      RoadTripTraveler.create!(trip: trip1, traveler: traveler1)
      RoadTripTraveler.create!(trip: trip1, traveler: traveler2)
      RoadTripTraveler.create!(trip: trip2, traveler: traveler3)

      visit "/trips/#{trip1.id}"

      expect(page).to have_content("#{traveler1.name}")
      expect(page).to have_content("#{traveler2.name}")
      expect(page).to_not have_content("#{traveler3.name}")
    end
    it "has a button next to each travelers name to remove that traveler from the trip" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)

      traveler1 = Traveler.create(name: "Sally Sue", age: 25)
      traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
      traveler3 = Traveler.create(name: "Cory Cory", age: 19)

      RoadTripTraveler.create!(trip: trip1, traveler: traveler1)
      RoadTripTraveler.create!(trip: trip1, traveler: traveler2)
      RoadTripTraveler.create!(trip: trip2, traveler: traveler3)

      visit "/trips/#{trip1.id}"

      within "#Traveler-#{traveler1.id}" do
        click_button "Remove Traveler"
      end
      expect(current_path).to eq("/trips/#{trip1.id}")
      expect(page).to_not have_content("#{traveler1.name}")
    end

    it "has a section called 'Other Trips to this destination' that lists other trips not including this trip" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      trip4 = Trip.create(title: "Cheese Incident", destination: "Madison, WI", mileage: 800)
      trip5 = Trip.create(title: "Cheese Revisited", destination: "Madison, WI", mileage: 900)

      visit "trips/#{trip1.id}"
      save_and_open_page
      expect(page).to have_content("Other Trips to this Destination")
      expect(page).to have_link("Cheese Incident")
      expect(page).to have_link("Cheese Revisited")

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
#
