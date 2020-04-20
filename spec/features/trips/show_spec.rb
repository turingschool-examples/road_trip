require 'rails_helper'

RSpec.describe "when I visit a trip's show page" do
  before(:each) do

    @trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1110)
    @trip_2 = Trip.create(title: "America Anyway?", destination_city: "Washington D.C.", mileage: 300)
    @trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip_4 = Trip.create(title: "D.C. Awareness Tour", destination_city: "Washington D.C.", mileage: 700)

    @traveler_1 = @trip_1.travelers.create(name: "Sally Sue", age: 25)
    @traveler_2 = @trip_1.travelers.create(name: "Tommy Tom", age: 46)
    @traveler_3 = @trip_2.travelers.create(name: "Mary Mae", age: 44)
    @traveler_4 = @trip_3.travelers.create(name: "Johnny Johnson", age: 16)
  end

  it "takes me to a trip's show page via a link from the index page" do

    visit "/trips"

    click_link "#{@trip_1.title}"

    expect(current_path).to eq("/trips/#{@trip_1.id}")
  end

  it "I can see the trip's title, destination city, mileage, along with trip's travelers " do

    visit "/trips/#{@trip_1.id}"

    expect(page).to have_content("#{@trip_1.title}")
    expect(page).to have_content("#{@trip_1.destination_city}")
    expect(page).to have_content("#{@trip_1.mileage}")
    expect(page).to have_content("#{@traveler_1.name}")
    expect(page).to have_content("#{@traveler_2.name}")
  end

  it "shows links to other trips going to the same destination" do

    visit "/trips/#{@trip_2.id}"

    expect(page).to have_link("D.C. Awareness Tour")
    expect(page).to_not have_link("Cheese Tour 2020")
  end
end
