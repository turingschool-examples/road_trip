require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit the Trips Index page" do
    it "then I see the titles of all trips in my database listed in order of their mileage (ascending)." do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
      traveler1 = trip1.travelers.create!(name: "Sally Sue", age: 25)
      traveler2 = trip1.travelers.create!(name: "Tommy Tom", age: 46)
      traveler3 = trip1.travelers.create!(name: "Cory Cory", age: 19)
      
      visit trip_path(trip1.id)

      within "#traveler-#{traveler1.id}" do 
        click_on "Delete Traveler"
      end

      expect(current_path).to eq(trip_path(trip1.id))
      expect(page).to_not have_content(traveler1.name)
      expect(page).to have_content(traveler2.name)
      expect(page).to have_content(traveler3.name)
    end 
  end 
end