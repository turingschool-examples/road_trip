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
