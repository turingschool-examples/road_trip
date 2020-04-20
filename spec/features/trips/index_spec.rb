require 'rails_helper'

RSpec.describe "AS a visitor,", type: :feature do 
  describe "when I visit the Trips Index page" do
    it "then I see the titles of all trips in my database listed in order of their mileage (ascending)." do 
      trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
      trip2 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
      trip3 = Trip.create!(title: "Bike n’ Climb", city: "Moab, UT", mileage: 700)
      trip4 = Trip.create!(title: "Who is America Anyway?", city: "Washington, D.C.", mileage: 300)
      
      visit trips_path

      expect(page.all('.trip-info')[0]).to have_content(trip1.name)
      expect(page.all('.trip-info')[1]).to have_content(trip2.name)
      expect(page.all('.trip-info')[2]).to have_content(trip3.name)
      expect(page.all('.trip-info')[2]).to have_content(trip4.name)
    end 
  end 
end