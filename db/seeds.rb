# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

traveler_1 = Traveler.create(name: "Sally Sue", age: 25)
traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
traveler_3 = Traveler.create(name: "Cory Cory", age: 19)
traveler_4 = Traveler.create(name: "Mary Mae", age: 44)
traveler_5 = Traveler.create(name: "Smith John", age: 9)

traveler_trip_1 = TravelerTrip.create(trip: trip_1, traveler: traveler_1)
traveler_trip_2 = TravelerTrip.create(trip: trip_1, traveler: traveler_2)
traveler_trip_3 = TravelerTrip.create(trip: trip_2, traveler: traveler_2)
traveler_trip_4 = TravelerTrip.create(trip: trip_3, traveler: traveler_5)
traveler_trip_5 = TravelerTrip.create(trip: trip_4, traveler: traveler_2)
traveler_trip_6 = TravelerTrip.create(trip: trip_4, traveler: traveler_3)
traveler_trip_7 = TravelerTrip.create(trip: trip_5, traveler: traveler_1)
traveler_trip_8 = TravelerTrip.create(trip: trip_5, traveler: traveler_2)
traveler_trip_9 = TravelerTrip.create(trip: trip_5, traveler: traveler_3)
traveler_trip_10 = TravelerTrip.create(trip: trip_5, traveler: traveler_4)
