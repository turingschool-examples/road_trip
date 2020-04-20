require 'rails_helper'

RSpec.describe "trips index page", type: :feature do
  describe "as a visitor, when i visit a trips index page" do
    context "and i click on a trip's title, i'm taken to that trip's show page" do
      context "and i can see that trip's title, destination_city, and mileage" do
        it "and i see a list of the names of travelers that are on this trip" do

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

          traveler1 = Traveler.create(name: "Sally Sue", age: 25)
          traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
          traveler3 = Traveler.create(name: "Cory Cory", age: 19)
          traveler4 = Traveler.create(name: "Mary Mae", age: 44)
          traveler5 = Traveler.create(name: "Smith John", age: 9)

          trip1.travelers << traveler2
          trip1.travelers << traveler4
          trip1.travelers << traveler5
          trip2.travelers << traveler1
          trip3.travelers << traveler3

          visit '/trips'

          expect(page).to have_link("#{trip2.title}")
          expect(page).to have_link("#{trip4.title}")
          expect(page).to have_link("#{trip3.title}")
          expect(page).to have_link("#{trip1.title}")

          click_link("#{trip1.title}")

          expect(current_path).to eq("/trips/#{trip1.id}")
          expect(page).to have_content("#{trip1.title}")
          expect(page).to have_content("#{trip1.destination_city}")
          expect(page).to have_content("#{trip1.mileage}")
          expect(page).to have_content("#{traveler2.name}")
          expect(page).to have_content("#{traveler4.name}")
          expect(page).to have_content("#{traveler5.name}")
          expect(page).to_not have_content("#{traveler1.name}")
          expect(page).to_not have_content("#{traveler3.name}")
        end
      end
    end
  end
end
