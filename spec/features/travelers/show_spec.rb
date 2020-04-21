require 'rails_helper'

RSpec.describe "travelers show page" do
  context "as a visitor" do
    it "can see their name, age, titles of trips and average mileage" do
      
        traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
        trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
        trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
        TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
        TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler1.id)

        visit "/travelers/#{traveler1.id}"

        expect(page).to have_content(traveler1.name) 
        expect(page).to have_content(traveler1.age)
        expect(page).to have_content(trip1.title)
        expect(page).to have_content(trip3.title)
        expect(page).to have_content(975) 
    end
  end
end

# As a visitor
# When I visit a traveler’s show page
# I see the traveler’s name and age
# And I see all of the titles of the trips that this traveler is on
# And I also see the average mileage of all of that traveler’s road trips