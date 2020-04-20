require 'rails_helper'


RSpec.describe "As a visitor", type: :feature do 
  describe "When I click on a trips title" do 
    before :each do
      Traveler1 = Traveler.create!( name: "Sally Sue", age: 25)
      Traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
      Traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
      Traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
      Traveler5 = Traveler.create!(name: "Smith John", age: 9)
      Trip1 = Traveler1.trips.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
      Trip2 = Traveler2.trips.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
      Trip3 = Traveler2.trips.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
      Trip4 = Traveler3.trips.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
    end
    it "I am taken to that trips show page" do 
      visit "/trips"

      click_link "#{Trip1.title}"

      expect(current_path).to eq("/trips/#{Trip1.id}")
      expect(page).to have_content(Trip1.title)  
      expect(page).to have_content(Trip1.destination_city)  
      expect(page).to have_content(Trip1.mileage)  
      # expect(page).to have_content(Trip1.travelers)  
    end
  end
end
# As a visitor
# When I visit a trips index page
# And I click on a trips title
# I’m taken to that trip’s show page
# And I can see that trips title, destination city, mileage
# And I also see a list of the names of the travelers that are on this trip