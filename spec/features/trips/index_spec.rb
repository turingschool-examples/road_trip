require 'rails_helper'

RSpec.describe 'Trips index page' do
  before(:each) do
  @trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
  @trip2 = Trip.create!(name: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
  @trip3 = Trip.create!(name: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
  @trip4 = Trip.create!(name: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
  end

  it "displays a list of all trips in ascending order of mileage" do
    visit '/trips'
    expect(@trip2.name).to appear_before(@trip4.name)
    expect(@trip4.name).to appear_before(@trip3.name)
    expect(@trip3.name).to appear_before(@trip1.name)

    expect(@trip2.name).to appear_before(@trip1.name)
  end

  it "each trips name is a link to that trips show page" do
    visit '/trips'
    click_link @trip1.name
    expect(page).to have_current_path("/trips/#{@trip1.id}")
  end
end
