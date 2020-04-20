# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip_2 = Trip.create(title: "Who is America Anyway?", destination_city: "Washington, D.C", mileage: 300)
trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
trip_4 = Trip.create(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)
trip_5 = Trip.create(title: "The land of over 14,000 lakes", destination_city: "Madison, WI", mileage: 450)
trip_6 = Trip.create(title: "A Winter Wonderland For Trout", destination_city: "Madison, WI", mileage: 175)
trip_7 = Trip.create(title: "Snowmobile Heaven!", destination_city: "Madison, WI", mileage: 200)

traveler_1 = Traveler.create(name: "Sally Sue", age: 25)
traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
traveler_3 = Traveler.create(name: "Cory Cory", age: 19)
traveler_4 = Traveler.create(name: "Mary Mae", age: 44)
traveler_5 = Traveler.create(name: "Smith John", age: 9)

TripTraveler.create(trip_id: trip_1.id, traveler_id: traveler_1.id)
TripTraveler.create(trip_id: trip_1.id, traveler_id: traveler_2.id)
TripTraveler.create(trip_id: trip_1.id, traveler_id: traveler_5.id)

TripTraveler.create(trip_id: trip_2.id, traveler_id: traveler_3.id)
TripTraveler.create(trip_id: trip_2.id, traveler_id: traveler_5.id)

TripTraveler.create(trip_id: trip_3.id, traveler_id: traveler_1.id)
TripTraveler.create(trip_id: trip_3.id, traveler_id: traveler_2.id)
TripTraveler.create(trip_id: trip_3.id, traveler_id: traveler_3.id)
TripTraveler.create(trip_id: trip_3.id, traveler_id: traveler_5.id)

TripTraveler.create(trip_id: trip_4.id, traveler_id: traveler_4.id)
