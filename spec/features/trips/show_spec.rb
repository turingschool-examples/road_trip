require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before :each do
    @trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
    @trip_2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)

    @traveler_1 = @trip_1.travelers.create(name: "Sally Sue", age: 25)
    @traveler_2 = @trip_1.travelers.create(name: "Tommy Tom", age: 46)
    @traveler_3 = @trip_2.travelers.create(name: "Cory Cory", age: 19)
  end

  it "I can click on a trip title and view that trips show page" do
    visit trips_path

    click_link "#{@trip_1.title}"

    expect(current_path).to eq(trip_path(@trip_1))

    expect(page).to have_content(@trip_1.title)
    expect(page).to have_content("Destination City: #{@trip_1.destination_city}")
    expect(page).to have_content("Mileage: #{@trip_1.mileage}")

    expect(page).to have_content(@traveler_1.name)
    expect(page).to have_content(@traveler_2.name)
    expect(page).to_not have_content(@traveler_3.name)
  end

end
