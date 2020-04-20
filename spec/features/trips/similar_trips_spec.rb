require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see a list of trip titles that have the same destination and are links to their show page' do
    trip1 = Trip.create(title: "Cheese Tour 2020",
                        destination_city: "Madison WI",
                        mileage: 1100)

    trip2 = Trip.create(title: "Who is America Anyway?",
                        destination_city: "Madison WI",
                        mileage: 300)

    trip3 = Trip.create(title: "The Big Apple",
                        destination_city: "Madison WI",
                        mileage: 850)

    trip4 = Trip.create(title: "Bike n’ Climb",
                        destination_city: "Moab, UT",
                        mileage: 700)

    visit "/trips/#{trip1.id}"

    expect(page).to have_content('Other Trips to this Destination')
    expect(page).to have_link(trip2.title)
    expect(page).to have_link(trip3.title)

    expect(page).to have_no_link(trip1.title)
    expect(page).to have_no_link(trip4.title)

  end
end