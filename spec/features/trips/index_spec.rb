require 'rails_helper'

RSpec.describe "trip index page" do
  context "as a visitor" do
    it "can see titles of all trips listed in order of mileage" do
        
        trip1 = Trip.create!(name: "Spring Trip", destination: "Florida", mileage: 500)
        trip2 = Trip.create!(name: "Summer Trip", destination: "New York", mileage: 250)
        trip3 = Trip.create!(name: "Fall Trip", destination: "Alaska", mileage: 2000)

        visit '/trips'

        expect(page).to have_content(trip2.name) 
        expect(page).to have_content(trip2.destination) 
        expect(page).to have_content(trip2.mileage) 

        expect(page).to have_content(trip1.name) 
        expect(page).to have_content(trip1.destination) 
        expect(page).to have_content(trip1.mileage) 

        expect(page).to have_content(trip3.name) 
        expect(page).to have_content(trip3.destination) 
        expect(page).to have_content(trip3.mileage) 
    end
  end
end



# As a visitor
# When I visit a trips index page
# I see the titles of all trips in my database listed in order of their mileage (ascending order)
# Trip1
# title: “Cheese Tour 2020”
# destination_city: “Madison, WI”
# mileage: 1100
 
# Trip2
# title: “Who is America Anyway?”
# destination_city: “Washington, D.C.”
# mileage: 300
 
# Trip3
# title: “The Big Apple”
# destination_city: “New York City, NY”
# mileage: 850