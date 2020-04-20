require 'rails_helper'

RSpec.describe "trips index page", type: :feature do
  describe "as a visitor, when i visit a trips index page" do
    it "i see a list of all trips listed by mileage (ascending)" do
      trip1 = Trip.create(
        title: "Cheese Tour 2020",
        destination_city: "Madison, WI",
        mileage: 1100,)

      trip2 = Trip.create(
        title: "Who is America Anyway?",
        destination_city: "Washington, D.C.",
        mileage: 300)

      trip3 = Trip.create(
        title: "The Big Apple",
        destination_city: "New York City, NY",
        mileage: 850)

      trip4 = Trip.create(
        title: "Bike n’ Climb",
        destination_city: "Moab, UT",
        mileage: 700)

      visit '/trips'

      expect(page).to have_content("1. Trip: #{trip2.title}")
      expect(page).to have_content("#{trip2.destination_city}")
      expect(page).to have_content("#{trip2.mileage}")
      expect(page).to have_content("2. Trip: #{trip4.title}")
      expect(page).to have_content("#{trip4.destination_city}")
      expect(page).to have_content("#{trip4.mileage}")
      expect(page).to have_content("3. Trip: #{trip3.title}")
      expect(page).to have_content("#{trip3.destination_city}")
      expect(page).to have_content("#{trip3.mileage}")
      expect(page).to have_content("4. Trip: #{trip1.title}")
      expect(page).to have_content("#{trip1.destination_city}")
      expect(page).to have_content("#{trip1.mileage}")
    end
  end
end
