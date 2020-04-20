# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trip.destroy_all
Traveler.destroy_all

trip1 = Trip.create(title: "Cheese Tour 2020",
                    destination_city: "Madison, WI",
                    mileage: 1100)

trip2 = Trip.create(title: "Who is America Anyway?",
                    destination_city: "Washington, D.C.",
                    mileage: 300)

trip3 = Trip.create(title: "The Big Apple",
                    destination_city: "New York City, NY",
                    mileage: 850)

trip4 = Trip.create(title: "Bike n’ Climb",
                    destination_city: "Moab, UT",
                    mileage: 700)

trip5 = Trip.create(title: "Scary Houses",
                    destination_city: "Madison, WI",
                    mileage: 1500)

trip6 = Trip.create(title: "Wind for days",
                    destination_city: "New York City, NY",
                    mileage: 2135)

trip7 = Trip.create(title: "Cheese and Wine",
                    destination_city: "Madison, WI",
                    mileage: 1110)

traveler1 = trip1.travelers.create(name: "Sally Sue", age: 25)
traveler2 = trip1.travelers.create(name: "Tommy Tom", age: 46)
traveler3 = trip2.travelers.create(name: "Cory Cory", age: 19)
traveler4 = trip3.travelers.create(name: "Mary Mae", age: 44)
traveler5 = trip4.travelers.create(name: "Smith John", age: 9)

TripTraveler.create(trip_id: trip2.id, traveler_id: traveler1.id)
TripTraveler.create(trip_id: trip2.id, traveler_id: traveler4.id)
TripTraveler.create(trip_id: trip3.id, traveler_id: traveler1.id)
TripTraveler.create(trip_id: trip4.id, traveler_id: traveler2.id)
TripTraveler.create(trip_id: trip6.id, traveler_id: traveler3.id)
TripTraveler.create(trip_id: trip7.id, traveler_id: traveler4.id)
TripTraveler.create(trip_id: trip5.id, traveler_id: traveler1.id)
TripTraveler.create(trip_id: trip5.id, traveler_id: traveler2.id)
