require 'rails_helper'

RSpec.describe "travelers show page" do
  context "as a visitor" do
    it "can see their name, age, titles of trips and average mileage" do
      
        traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
        trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
        trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
        TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
        TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler1.id)

        visit traveler_path(traveler1.id)

        expect(page).to have_content(traveler1.name) 
        expect(page).to have_content(traveler1.age)
        expect(page).to have_content(trip1.title)
        expect(page).to have_content(trip3.title)
        expect(page).to have_content(975) 
    end

    it "can add a trip" do

        traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
        trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
        trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
        trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
        TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
        TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler1.id)

        visit traveler_path(traveler1.id)

        expect(page).to have_content("Add A New Trip") 
        # fill_in :title,	with: "Hunting Trip" 
        # fill_in :destination,	with: "Nome, AK" 
        # fill_in :mileage,	with: "Alaska" 
        # click_button "Submit"

        fill_in :trip,	with: "#{trip2.id}" 

        click_button "submit"

        expect(current_path).to eq("/travelers/#{traveler1.id}")

        expect(page).to have_content(trip2.title) 
        
    end
    
  end
end


# I see a section on the page titled “Add a trip”
# And under that section, I see a form that allows me to enter an existing trip’s id
# When I enter the id of an existing trip into that field
# And click submit
# I’m redirected to the traveler’s show page
# Where I see the title of that trip I just added to the traveler on the page
# ```