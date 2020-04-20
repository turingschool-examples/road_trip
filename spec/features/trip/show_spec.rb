require 'rails_helper'

RSpec.describe "As a visitor when I visit a trips index page" do
  before(:each) do
    @trip1 = Trip.create!(title: "Cheese Tour 2020", city: "Madison, WI", mileage: 1100)
    @trip2 = Trip.create!(title: "Who is America Anyway?", city: "Washington, D.C.", mileage: 300)
    @trip3 = Trip.create!(title: "The Big Apple", city: "New York City, NY", mileage: 850)
    @trip4 = Trip.create!(title: "Bike n’ Climb", city: "Moab, UT", mileage: 700)

    @traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
    @traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
    @traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
    @traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
    @traveler5 = Traveler.create!(name: "Smith John", age: 9)

    TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler1.id)
    TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler2.id)
    TravelerTrip.create!(trip_id: @trip1.id, traveler_id: @traveler3.id)

    TravelerTrip.create!(trip_id: @trip2.id, traveler_id: @traveler2.id)
    TravelerTrip.create!(trip_id: @trip2.id, traveler_id: @traveler3.id)

    TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler1.id)
    TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler3.id)
    TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler4.id)
    TravelerTrip.create!(trip_id: @trip3.id, traveler_id: @traveler5.id)

    TravelerTrip.create!(trip_id: @trip4.id, traveler_id: @traveler2.id)
    TravelerTrip.create!(trip_id: @trip4.id, traveler_id: @traveler4.id)
    TravelerTrip.create!(trip_id: @trip4.id, traveler_id: @traveler5.id)
  end

  it "I can see the titles of all trips listed in order of their milage in ascending order" do
    visit '/trips'

    click_link @trip1.title

    expect(current_path).to eq("/trips/#{@trip1.id}")

    expect(page).to have_content(@trip1.title)
    expect(page).to_not have_content(@trip2.title)
    expect(page).to_not have_content(@trip3.title)
    expect(page).to_not have_content(@trip4.title)
    expect(page).to have_content(@trip1.city)
    expect(page).to have_content(@trip1.mileage)
    expect(page).to have_content(@traveler1.name)
    expect(page).to have_content(@traveler2.name)
    expect(page).to have_content(@traveler3.name)
    expect(page).to_not have_content(@traveler4.name)
    expect(page).to_not have_content(@traveler5.name)
  end

  it "I can delete a traveler from the trip" do
    visit '/trips'

    click_link @trip1.title

    within("#traveler-#{@traveler1.id}") do
      click_button "Delete #{@traveler1.name} from this Trip"
    end

    expect(current_path).to eq("/trips/#{@trip1.id}")
    expect(page).to_not have_content(@traveler1.name)

    save_and_open_page
  end
end
