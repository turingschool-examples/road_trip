# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


trip1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
trip3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
trip4 = Trip.create(title: "Bike n' Climb", destination_city: "Moab UT", mileage: 700)
trip5 = Trip.create(title: "Tour de Canyons", destination_city: "Moab UT", mileage: 400)
trip6 = Trip.create(title: "Cacti Cruise", destination_city: "Moab UT", mileage: 500)
trip7 = Trip.create(title: "Museums & Cherry Blossoms", destination_city: "Washington, D.C", mileage: 450)
molly = Traveler.create(name: "Molly", age: 26)
cath = Traveler.create(name: "Catherine", age: 28)
hannah = Traveler.create(name: "Hannah", age: 30)
lily = Traveler.create(name: "Lily", age: 25)
meg = Traveler.create(name: "Meg", age: 27)
TravelerTrip.create(trip: trip4, traveler: molly)
TravelerTrip.create(trip: trip4, traveler: cath)
TravelerTrip.create(trip: trip2, traveler: cath)
TravelerTrip.create(trip: trip4, traveler: hannah)
TravelerTrip.create(trip: trip1, traveler: lily)
TravelerTrip.create(trip: trip1, traveler: hannah)
TravelerTrip.create(trip: trip6, traveler: molly)
TravelerTrip.create(trip: trip6, traveler: meg)
TravelerTrip.create(trip: trip5, traveler: lily)
