require 'rails_helper'

RSpec.describe "Trips Index Page" do
  describe "when I visit the /trips" do
    it "displays all trips" do
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      trip3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)

      visit "/trips"
      save_and_open_page
      expect(page).to have_content(trip1.title)
      expect(page).to have_link(trip1.mileage)
      expect(page).to have_content(trip2.title)
      expect(page).to have_link(trip2.mileage)
      expect(page).to have_content(trip3.title)
      expect(page).to have_link(trip3.mileage)
    end
  end
end
