require 'rails_helper'

RSpec.describe "As a visitor", tyoe: :feature do 
  describe "when I visit a travelers show page" do 
    before :each do 
      @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
      @trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
      @trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
      @trip4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
      @trip5 = Trip.create!(title: "Arches", destination: "Moab, UT", mileage: 900)
      @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
      @traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
      @traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
      @traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
      @traveler5 = Traveler.create!(name: "Smith John", age: 9)
      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler1.id)
      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler2.id)
      TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler3.id)
      TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler1.id)
      
      visit "/travelers/#{@traveler1.id}"
    end

    it "I can see the travelers name and age and their avg mileage" do 

      expect(page).to have_content("Name: #{@traveler1.name}") 
      expect(page).to have_content("Age: #{@traveler1.age}") 
      expect(page).to have_content(@trip1.title) 
      expect(page).to have_content("Average Mileage: 975.0") 
    end

    it "I can add a trip to the show page" do 

      expect(page).to have_content("Add a trip")

      fill_in :Trip_ID,	with: "#{@trip3.id}"


      
      click_on "Submit"

      expect(current_path).to eq("/travelers/#{@traveler1.id}") 
      expect(page).to have_content(@trip3.title)
      # save_and_open_page
    end
  end
end
#   As a visitor
# When I visit a traveler’s show page
# I see a section on the page titled “Add a trip”
# And under that section, I see a form that allows me to enter an existing trip’s id
# When I enter the id of an existing trip into that field
# And click submit
# I’m redirected to the traveler’s show page
# Where I see the title of that trip I just added to the traveler on the page