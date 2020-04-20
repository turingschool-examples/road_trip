require 'rails_helper'

RSpec.describe "trip show page" do
  context "as a visitor" do
    it "can see trip details and list of travelers" do

        trip1 = Trip.create!(name: "Spring Trip", destination: "Florida", mileage: 500)
        trip2 = Trip.create!(name: "Summer Trip", destination: "New York", mileage: 250)
        trip3 = Trip.create!(name: "Fall Trip", destination: "Alaska", mileage: 2000)
        trav1 = trip1.travelers.create!(name: "Tom Cullen", age: 30)
        trav2 = trip1.travelers.create!(name: "Stu Redman", age: 40)
        trav3 = trip1.travelers.create!(name: "Ralph Brentner", age: 50)

        visit "/trips/#{trip1.id}"

        expect(page).to have_content(trip1.name) 
        expect(page).to have_content(trip1.destination) 
        expect(page).to have_content(trip1.mileage) 
        expect(page).to have_content(trav1.name) 
        expect(page).to have_content(trav2.name) 
        expect(page).to have_content(trav3.name) 
    end

    it "can remove a traveler from a trip" do

        trip1 = Trip.create!(name: "Spring Trip", destination: "Florida", mileage: 500)
        trip2 = Trip.create!(name: "Summer Trip", destination: "New York", mileage: 250)
        trip3 = Trip.create!(name: "Fall Trip", destination: "Alaska", mileage: 2000)
        trav1 = trip1.travelers.create!(name: "Tom Cullen", age: 30)
        # trav1 = Traveler.create(name: "Tom Cullen", age: 30)
        tom = TravelerTrip.create(trip_id: trip1.id, traveler_id: trav1.id)
        
        # binding.pry
        visit "/trips/#{trip1.id}"

        # expect(page).to have_button("Remove Traveler") 
# save_and_open_page
        click_button "Remove Traveler"

        expect(page).to_not have_content(trav1.name) 
    end
    
  end
end

# s a visitor
# When I visit a trips show page
# Next to each traveler’s name
# I see a button to remove that traveler from the trip
# When I click that button for a particular traveler
# I am redirected back to the trips show page
# And I no longer see that traveler’s name listed
# ```