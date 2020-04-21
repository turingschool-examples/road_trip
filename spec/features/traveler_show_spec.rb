require "rails_helper"

RSpec.describe "Traveler Show Page" do
  describe "when I visit the /travelers/:id (show page)" do
    it "I see the travelers name and age, along with trip information" do
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)

      traveler = Traveler.create!(name: "Sally Sue", age: 25)

      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler.id)
      TravelerTrip.create!(trip_id: trip2.id, traveler_id: traveler.id)

      visit "/travelers/#{traveler.id}"

      expect(page).to have_content(traveler.name)
      expect(page).to have_content(traveler.age)
      expect(page).to have_content(trip1.title)
      expect(page).to have_content(trip2.title)
      expect(page).to have_content("Average Roadtrip Mileage: 700 miles")
    end

    it "I can add a new trip to the traveler's show page by filling out a form" do
      trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)

      traveler = Traveler.create!(name: "Sally Sue", age: 25)

      TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler.id)
      TravelerTrip.create!(trip_id: trip2.id, traveler_id: traveler.id)

      visit "/travelers/#{traveler.id}"
      expect(page).to have_content("Add a trip")

      fill_in "Title", with: "The Golden Circle"
      fill_in "Destination",  with: "Iceland"
      fill_in "Mileage",  with: 190

      click_on "Add New Trip"

      expect(current_path).to eq("/travelers/#{traveler.id}")
      expect(page).to have_content("The Golden Circle")
    end
  end
end
