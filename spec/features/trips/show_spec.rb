require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit the Trips Index page and click on a trip title" do
    it "then I see that trip's ttile, city, mileage, and a list of traveler names that are on this trip." do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
      # binding.pry
      traveler1 = trip1.travelers.create!(name: "Sally Sue", age: 25)
      traveler2 = trip1.travelers.create!(name: "Tommy Tom", age: 46)
      traveler3 = trip2.travelers.create!(name: "Cory Cory", age: 19)

      visit trips_path
      
      click_on trip1.title

      within ".trip-info" do 
        expect(page).to have_content(trip1.title)
        expect(page).to have_content(trip1.city)
        expect(page).to have_content(trip1.mileage)
      end

      within "#traveler-#{traveler1.id}" do 
        expect(page).to have_content(traveler1.name)
      end

      within "#traveler-#{traveler2.id}" do 
        expect(page).to have_content(traveler2.name)
      end

      expect(page).to_not have_content(traveler3.name)
    end 
  end 
end