require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before :each do
    @trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
    @trip_3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
    @trip_4 = Trip.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
  end

  it "I can view a trip index page and see trips listed in ascending order by milage" do
    visit trips_path

    expect(page.all('.individual-trip')[0]).to have_content(@trip_2.title)
    expect(page.all('.individual-trip')[1]).to have_content(@trip_4.title)
    expect(page.all('.individual-trip')[2]).to have_content(@trip_3.title)
    expect(page.all('.individual-trip')[3]).to have_content(@trip_1.title)

    expect(page).to_not have_content(@trip_1.destination_city)
    expect(page).to_not have_content(@trip_1.mileage)
  end

end
