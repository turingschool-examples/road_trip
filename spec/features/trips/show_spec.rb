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
      save_and_open_page
    end
  end
end




# As a visitor
# When I visit a trips index page
# And I click on a trips title
# I’m taken to that trip’s show page
# And I can see that trips title, destination city, mileage
# And I also see a list of the names of the travelers that are on this trip