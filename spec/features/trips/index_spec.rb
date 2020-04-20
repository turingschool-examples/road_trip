require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can see the titles of all trips in ascending mileage" do
    trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
    trip2 = Trip.create(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
    trip3 = Trip.create(title: "The Big Cheese", destination: "Madison, WI", mileage: 850)
    trip4 = Trip.create(title: "Cheese n’ Climb", destination: "Madison, WI", mileage: 700)

    visit "/trips"

    within('#trips') do
      expect(page.all('li')[0]).to have_link(trip2.title, href: "/trips/#{trip2.id}")
      expect(page.all('li')[1]).to have_link(trip4.title, href: "/trips/#{trip4.id}")
      expect(page.all('li')[2]).to have_link(trip3.title, href: "/trips/#{trip3.id}")
      expect(page.all('li')[3]).to have_link(trip1.title, href: "/trips/#{trip1.id}")
    end
  end
end