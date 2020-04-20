# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
traveler1 = Traveler.create(name: "Sally Sue", age: 25)
traveler2 = Traveler.create(name: "John Wick", age: 20)
traveler3 = Traveler.create(name: "Luke Skywalker", age: 80)
traveler4 = Traveler.create(name: "Graham Cracker", age: 32)


trip1 = Trip.create(name: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip2 = Trip.create(name: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
trip3 = Trip.create(name: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
trip4 = Trip.create(name: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

TravelerTrip.create()