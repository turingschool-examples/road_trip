require 'rails_helper'

RSpec.describe "As a visitor when I visit the trip index page" do
  it 'I see all the titles of all trips sorted by mileage' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create!( title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create!( title: "The Big Apple", destination: "New York City, NY", mileage: 850)
    trip4 = Trip.create!( title: "Bike and Climb", destination: "Moab, UT", mileage: 700)

    visit '/trips'
    expect(page.all('li')[0]).to have_content(trip2.title)
    expect(page.all('li')[1]).to have_content(trip4.title)
    expect(page.all('li')[2]).to have_content(trip3.title)
    expect(page.all('li')[3]).to have_content(trip1.title)
  end
  
  it 'I can click on the title of a trip and be taken to a trips show page' do
    trip1 = Trip.create!( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    visit '/trips'
    click_on trip1.title
    expect(current_path).to eq("/trips/#{trip1.id}")
  end
end