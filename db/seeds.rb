# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trip1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
trip2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
trip3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
trip4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
trip5 = Trip.create!(title: "Arches", destination: "Moab, UT", mileage: 900)

traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
traveler5 = Traveler.create!(name: "Smith John", age: 9)

TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler1.id)
TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler2.id)
TravelerTrip.create!(trip_id: trip1.id, traveler_id: traveler3.id)

TravelerTrip.create!(trip_id: trip2.id, traveler_id: traveler2.id)
TravelerTrip.create!(trip_id: trip2.id, traveler_id: traveler3.id)

TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler1.id)
TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler3.id)
TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler4.id)
TravelerTrip.create!(trip_id: trip3.id, traveler_id: traveler5.id)

TravelerTrip.create!(trip_id: trip4.id, traveler_id: traveler2.id)
TravelerTrip.create!(trip_id: trip4.id, traveler_id: traveler4.id)
TravelerTrip.create!(trip_id: trip4.id, traveler_id: traveler5.id)
