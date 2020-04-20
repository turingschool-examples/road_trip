require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "trip index page" do
    it "shows the titles of all the trips in my database listed in order of their mileage" do
      trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      trip3 = Trip.create(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      trip4 = Trip.create(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)

      visit '/trips'

      within "#Trip-#{trip1.id}" do
        expect(page).to have_content("#{trip1.title}")
      end

      within "#Trip-#{trip2.id}" do
        expect(page).to have_content("#{trip2.title}")
      end

      within "#Trip-#{trip3.id}" do
        expect(page).to have_content("#{trip3.title}")
      end

      within "#Trip-#{trip4.id}" do
        expect(page).to have_content("#{trip4.title}")
      end
    end
  end
end
# User Story 1, Trips Index Page
# ​
# As a visitor
# When I visit a trips index page
# I see the titles of all trips in my database listed in order of their mileage (ascending order)

# Trip2
# title: “Who is America Anyway?”
# destination_city: “Washington, D.C.”
# mileage: 300
#
# Trip3
# title: “The Big Apple”
# destination_city: “New York City, NY”
# mileage: 850
#
# Trip4
# title: “Bike n’ Climb”
# destination_city: “Moab, UT”
# mileage: 700
