require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  it  'can see the titles of all trips listed in order of their mileage' do
    trip_1 = create(:trip, mileage: 5)
    trip_2 = create(:trip, mileage: 10)
    trip_3 = create(:trip, mileage: 15)

    visit "/trips"

    expect(trip_1.title).to appear_before(trip_2.title)
    expect(trip_2.title).to appear_before(trip_3.title)
    expect(trip_1.title).to appear_before(trip_3.title)

    expect(page).to have_content(trip_1.mileage)
    expect(page).to have_content(trip_2.mileage)
    expect(page).to have_content(trip_3.mileage)
  end
end
