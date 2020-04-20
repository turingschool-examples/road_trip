require 'rails_helper'

RSpec.describe "when I visit the trip show page and click the name of a trip" do
  before(:each) do
    @trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
    @trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

    @traveler_1 = Traveler.create(name: "Sally Sue", age: 25)
    @traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
    @traveler_3 = Traveler.create(name: "Cory Cory", age: 19)
    @traveler_4 = Traveler.create(name: "Mary Mae", age: 44)
    @traveler_5 = Traveler.create(name: "Smith John", age: 9)

    TripTraveler.create(trip_id: @trip_1.id, traveler_id: @traveler_1.id)
    TripTraveler.create(trip_id: @trip_1.id, traveler_id: @traveler_2.id)
    TripTraveler.create(trip_id: @trip_1.id, traveler_id: @traveler_5.id)

    TripTraveler.create(trip_id: @trip_2.id, traveler_id: @traveler_3.id)
    TripTraveler.create(trip_id: @trip_2.id, traveler_id: @traveler_5.id)

    TripTraveler.create(trip_id: @trip_3.id, traveler_id: @traveler_1.id)
    TripTraveler.create(trip_id: @trip_3.id, traveler_id: @traveler_2.id)
    TripTraveler.create(trip_id: @trip_3.id, traveler_id: @traveler_3.id)
    TripTraveler.create(trip_id: @trip_3.id, traveler_id: @traveler_5.id)

    TripTraveler.create(trip_id: @trip_4.id, traveler_id: @traveler_4.id)

  end

  it "I am taken to the trips show page" do
    visit "/trips"

    click_link("Cheese Tour 2020")

    expect(current_path).to eq("/trips/#{@trip_1.id}")

    expect(page).to have_content("Trip: #{@trip_1.title}")
    expect(page).to have_content("Destination City: #{@trip_1.destination_city}")
    expect(page).to have_content("Mileage: #{@trip_1.mileage}")
  end

  it "I also see the names of the travellers listed on this trip" do

    visit "/trips/#{@trip_1.id}"

    expect(page).to have_content("Travelers on this trip: Sally Sue, Tommy Tom, and Smith John")
    expect(page).to_not have_content("#{@traveler_3.name}")
    expect(page).to_not have_content("#{@traveler_4.name}")
  end

  it "I also see a button to remove a traveler from a trip" do

    visit "/trips/#{@trip_1.id}"

    within ".traveler-#{@traveler_1.id}" do
      click_button "Remove Traveler"
    end

    expect(current_path).to eq("/trips/#{@trip_1.id}")

    expect(page).to have_content("Travelers on this trip: Tommy Tom and Smith John")
    expect(page).to_not have_content("Sally Sue")

    #the following test shows that the traveler is not deleted entirely
    #only removed from the trip

    visit "/trips/#{@trip_3.id}"

    expect(page).to have_content("Travelers on this trip: Sally Sue, Tommy Tom, Cory Cory, and Smith John")
  end
end
