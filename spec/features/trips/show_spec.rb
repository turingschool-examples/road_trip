require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit the Trips Index page and click on a trip title" do
    it "then I see that trip's ttile, city, mileage, and a list of traveler names that are on this trip." do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
      traveler1 = Traveler.create!(name: "Sally Sue", age: 25, trip: trip1)
      traveler2 = Traveler.create!(name: "Tommy Tom", age: 46, trip: trip1)
      traveler3 = Traveler.create!(name: "Cory Cory", age: 19, trip: trip2)

      visit trips_path
      
      within ".trips" do 
        click_on trip1.title
      end

      within ".trip-info" do 
        expect(page).to have_content(trip1.title)
        expect(page).to have_content(trip1.city)
        expect(page).to have_content(trip1.mileage)
      end

      within ".trip-travelers" do 
        expect(page).to have_content(traveler1.name)
        expect(page).to have_content(traveler2.name)
      end
    end 
  end 
end