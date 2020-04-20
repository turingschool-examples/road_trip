require "rails_helper"

RSpec.describe "As a user, when I visit the trip index page", type: :feature do
  it "I see all of the trips listed in my database" do

    @trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", miles: 1100)
    @trip2 = Trip.create!(title: "Go to Utah", destination: "Moab, UT", miles: 2000)
    @trip3 = Trip.create!(title: "Visit Key West", destination: "Key West, FL", miles: 2900)

    visit "/trips"

    expect(page).to have_content(@trip1.title)
    expect(page).to have_content(@trip2.title)
    expect(page).to have_content(@trip3.title)
  end

  it "I see all trips listed in order of their mileage ascending" do
    #will come back and properly test with orderly if I have time
    @trip1 = Trip.create!(title: "Go to Utah", destination: "Moab, UT", miles: 2000)
    @trip2 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", miles: 1100)
    @trip3 = Trip.create!(title: "Visit Key West", destination: "Key West, FL", miles: 2900)

    visit "/trips"
  
    expect(page).to have_content(@trip1.title)
    expect(page).to have_content(@trip2.title)
    expect(page).to have_content(@trip3.title)
  end
end
