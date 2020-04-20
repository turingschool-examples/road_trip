require 'rails_helper'

RSpec.describe "trips index page remove traveler", type: :feature do
  describe "as a visitor, when i visit a trip's show page" do
    context "and i click on 'Remove' next to a traveler's name" do
      context "i am redirected back to the show page" do
        it "and that traveler is no longer listed on that page" do

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

          visit("/trips/#{trip1.id}")

          expect(page).to have_content("#{traveler2.name}")
          expect(page).to have_content("#{traveler4.name}")
          expect(page).to have_content("#{traveler5.name}")
          expect(page).to_not have_content("#{traveler1.name}")
          expect(page).to_not have_content("#{traveler3.name}")

          within "#traveler-#{traveler4.id}" do
            click_link('Remove')
          end

          expect(page).to have_content("#{traveler2.name}")
          expect(page).to_not have_content("#{traveler4.name}")
          expect(page).to have_content("#{traveler5.name}")
          expect(page).to_not have_content("#{traveler1.name}")
          expect(page).to_not have_content("#{traveler3.name}")
        end
      end
    end
  end
end
