# require 'rails_helper'
#
# RSpec.describe "when I visit the trip show page and click the name of a trip" do
#   before(:each) do
#     @trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
#     @trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
#     @trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
#     @trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
#   end
#
#   it "I am taken to the trips show page" do
#     # As a visitor
#     # When I visit a trips index page
#     # And I click on a trips title
#     # I’m taken to that trip’s show page
#     # And I can see that trips title, destination city, mileage
#     visit "/trips"
#
#     click_link("Cheese Tour 2020")
#
#     expect(current_path).to eq("/trips/#{@trip_1.id}")
#
#     expect(page).to have_content("Title: #{@trip_1.title}")
#     expect(page).to have_content("Destination City: #{@trip_.destination_city}")
#     expect(page).to have_content("Mileage: #{@trip_.mileage}")
#   end
#
#   it "I also see the names of the travellers listed on this trip" do
#     # And I also see a list of the names of the travelers that are on this trip
#
#   end
# end
