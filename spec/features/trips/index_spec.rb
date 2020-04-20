require 'rails_helper'

RSpec.describe "when I visit the trips index page" do
  before(:each) do

    @trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1110)
    @trip_2 = Trip.create(title: "America Anyway?", destination_city: "Washington D.C.", mileage: 300)
    @trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
  end

  it "shows all trips listed by mileage in ascending order" do

    visit "/trips"

    expect(page).to have_content("#{@trip_1.title}")
    expect(page).to have_content("#{@trip_1.destination_city}")
    expect(page).to have_content("#{@trip_1.mileage}")

    expect(page).to have_content("#{@trip_2.title}")
    expect(page).to have_content("#{@trip_2.destination_city}")
    expect(page).to have_content("#{@trip_2.mileage}")

    expect(page).to have_content("#{@trip_3.title}")
    expect(page).to have_content("#{@trip_3.destination_city}")
    expect(page).to have_content("#{@trip_3.mileage}")

    save_and_open_page
  end
end
