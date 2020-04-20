require "rails_helper"

RSpec.describe "As a user, when I visit the trip show page", type: :feature do
  it "I see links to delete travelers from this trip" do

    @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", miles: 1100)

    @traveler1 = @trip1.travelers.create!(name: "Jimbo", age: 49)
    @traveler2 = @trip1.travelers.create!(name: "Marie", age: 39)
    @traveler3 = @trip1.travelers.create!(name: "Jimmy", age: 14)

    visit "/trips"
    click_link(@trip1.title)
    expect(current_path).to eq("/trips/#{@trip1.id}")

    expect(page).to have_link("Remove #{@traveler1.name} From Trip")
    expect(page).to have_link("Remove #{@traveler2.name} From Trip")
    expect(page).to have_link("Remove #{@traveler3.name} From Trip")

    click_link("Remove #{@traveler3.name} From Trip")
    expect(current_path).to eq("/trips/#{@trip1.id}")

    expect(page).to_not have_content(@traveler3.name)

    expect(page).to have_content(@traveler2.name)
    expect(page).to have_content(@traveler1.name)
  end
end
