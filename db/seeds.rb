# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TravelerTrip.destroy_all
Trip.destroy_all
Traveler.destroy_all

traveler1 = Traveler.create(name: "Sally Sue", age: 25)
traveler2 = Traveler.create(name: "John Wick", age: 20)
traveler3 = Traveler.create(name: "Luke Skywalker", age: 80)
traveler4 = Traveler.create(name: "Graham Cracker", age: 32)


trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip2 = Trip.create(name: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
trip3 = Trip.create(name: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
trip4 = Trip.create(name: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
trip5 = Trip.create(name: "Midwest College Tour", destination_city: "Madison, WI", mileage: 1100)
trip6 = Trip.create(name: "Badger Game Weekend", destination_city: "Madison, WI", mileage: 300)
trip7 = Trip.create(name: "Bar Crawl", destination_city: "Madison, WI", mileage: 1)

TravelerTrip.create(trip: trip1, traveler: traveler1)
TravelerTrip.create(trip: trip1, traveler: traveler2)
TravelerTrip.create(trip: trip1, traveler: traveler3)
TravelerTrip.create(trip: trip2, traveler: traveler1)
TravelerTrip.create(trip: trip2, traveler: traveler2)
TravelerTrip.create(trip: trip3, traveler: traveler4)
TravelerTrip.create(trip: trip4, traveler: traveler3)
TravelerTrip.create(trip: trip4, traveler: traveler4)
TravelerTrip.create(trip: trip5, traveler: traveler2)
TravelerTrip.create(trip: trip5, traveler: traveler3)
TravelerTrip.create(trip: trip5, traveler: traveler4)
TravelerTrip.create(trip: trip6, traveler: traveler4)
TravelerTrip.create(trip: trip6, traveler: traveler2)
TravelerTrip.create(trip: trip6, traveler: traveler3)
TravelerTrip.create(trip: trip7, traveler: traveler1)
TravelerTrip.create(trip: trip7, traveler: traveler2)
TravelerTrip.create(trip: trip7, traveler: traveler3)
TravelerTrip.create(trip: trip7, traveler: traveler4)