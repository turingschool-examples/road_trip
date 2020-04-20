require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @trip1 = Trip.create!(title: "Fun", destination: "Madison", mileage: 300)
    @trip2 = Trip.create!(title: "Exciting", destination: "Nashville", mileage: 200)
    @trip3 = Trip.create!(title: "OK", destination: "Denver", mileage: 100)
  end
describe 'When I visit /trips'
  it 'I see the titles of all trips in my database listed in order of their mileage ' do
    visit '/trips'

    expect(page).to have_content(@trip1.title)
    expect(page).to have_content(@trip2.title)
    expect(page).to have_content(@trip3.title)

    @trip3.title.should appear_before(@trip2.title)
    @trip3.title.should appear_before(@trip1.title)
    @trip2.title.should appear_before(@trip1.title)
  end
  it 'I can click a trip title and be taken to that trips show page' do
    visit '/trips'
    click_link @trip1.title 

    expect(current_path).to eq("/trips/#{@trip1.id}")
  end

end
