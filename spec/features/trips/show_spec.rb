require 'rails_helper'

RSpec.describe "As a visitor when I visit the trip show" do
  it 'I see the trips title, destination, and mileage' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)

    visit "/trips/#{trip1.id}"
    expect(page).to have_content(trip1.title)
    expect(page).to have_content(trip1.destination)
    expect(page).to have_content(trip1.mileage)

  end
  
  it 'I see the a list of all the travelers on that trip' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)

    traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    traveler2 = Traveler.create!(name: "Tommy Tom", age: 25)
    traveler3 = Traveler.create!(name: "Maggie Mae", age: 25)

    TravelerTrip.create!(trip: trip1, traveler: traveler1)
    TravelerTrip.create!(trip: trip1, traveler: traveler2)

    visit "/trips/#{trip1.id}"
    expect(page).to have_content("Travelers:")
    expect(page).to have_content(traveler1.name)
    expect(page).to have_content(traveler2.name)
    expect(page).to_not have_content(traveler3.name)
  end

  it 'I see a button next to each traveler to remove them from the trip' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)

    traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    traveler2 = Traveler.create!(name: "Tommy Tom", age: 25)

    TravelerTrip.create!(trip: trip1, traveler: traveler1)
    TravelerTrip.create!(trip: trip1, traveler: traveler2)

    visit "/trips/#{trip1.id}"

    within ("#traveler-#{traveler1.id}") do
      click_button 'Remove Traveler'
    end 
    within ("#traveler-#{traveler2.id}") do
      click_button 'Remove Traveler'
    end 
  end

  it 'I when I click remove traveler, I am returned to the show page and no longer see that traveler' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)

    traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    traveler2 = Traveler.create!(name: "Tommy Tom", age: 25)

    TravelerTrip.create!(trip: trip1, traveler: traveler1)
    TravelerTrip.create!(trip: trip1, traveler: traveler2)

    visit "/trips/#{trip1.id}"

    within ("#traveler-#{traveler1.id}") do
      click_button 'Remove Traveler'
    end 

    expect(current_path).to eq("/trips/#{trip1.id}")
    expect(page).to_not have_content("Sally Sue")
  end

  it 'I see a section called Other Trips to this Destination with a list of trips that are also to this destination' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create!( title: "Boats and Stuff", destination: "Madison, WI", mileage: 1000)
    trip3 = Trip.create!( title: "Giant Capital Building", destination: "Madison, WI", mileage: 900)
    trip4 = Trip.create!( title: "Where A Lake Used to Be", destination: "Death Valley, CA", mileage: 1100)
  
    visit "/trips/#{trip1.id}"

    within(".other-trips") do 
      expect(page).to have_content("Other Trips to this Destination:")
      expect(page).to have_content(trip2.title)
      expect(page).to have_content(trip3.title)
      expect(page).to_not have_content(trip1.title)
      expect(page).to_not have_content(trip4.title)
    end 
  end
end