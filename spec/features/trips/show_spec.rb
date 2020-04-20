require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
    before(:each) do
      @trip_1 = create(:trip)
      @trip_2 = create(:trip)
      @traveler_1 = create(:traveler, )
      @traveler_2 = create(:traveler)
      @traveler_3 = create(:traveler)

      @trip_1.travelers << [@traveler_1, @traveler_2, @traveler_3]
    end

  it "click on a trips title on index page and then routed to trips show page" do
    visit "/trips"

    expect(page).to have_link(@trip_1.title)

    click_link (@trip_1.title)

    expect(current_path).to eq(("/trips/#{@trip_1.id}"))
  end

  it "can see trips info with travelers names on" do
    visit "/trips/#{@trip_1.id}"

    expect(page).to have_content(@trip_1.title)
    expect(page).to have_content(@trip_1.destination_city)
    expect(page).to have_content(@trip_1.mileage)

    expect(page).to_not have_content(@trip_2.title)
    expect(page).to_not have_content(@trip_2.destination_city)

    within('#travelers') do
      expect(page).to have_content(@traveler_1.name)
      expect(page).to have_content(@traveler_2.name)
      expect(page).to have_content(@traveler_3.name)
    end
  end
end
