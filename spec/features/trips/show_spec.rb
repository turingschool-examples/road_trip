require "rails_helper"

RSpec.describe "As a user, when I visit the trip show page", type: :feature do
  it "I see all of the trips listed in my database" do

    @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", miles: 1100)

    @traveler1 = @trip1.travelers.create!(name: "Jimbo", age: 49)
    @traveler2 = @trip1.travelers.create!(name: "Marie", age: 39)
    @traveler3 = @trip1.travelers.create!(name: "Jimmy", age: 14)

    visit "/trips"
    expect(page).to have_link(@trip1.title)

    click_link(@trip1.title)
    expect(current_path).to eq("/trips/#{@trip1.id}")
    save_and_open_page
    expect(page).to have_content(@trip1.title)
    expect(page).to have_content(@trip1.destination)
    expect(page).to have_content(@trip1.miles)
    expect(page).to have_content(@traveler1.name)
    expect(page).to have_content(@traveler2.name)
    expect(page).to have_content(@traveler3.name)
  end
end
