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

# Trip4
# title: "Bike n’ Climb"
# destination_city: "Moab, UT"
# mileage: 700
#
# Traveler1
# name: "Sally Sue"
# age: 25
#
# Traveler2
# name: "Tommy Tom"
# age: 46
#
# Traveler3
# name: "Cory Cory"
# age: 19
#
# Traveler4
# name: "Mary Mae"
# age: 44
#
# Traveler5
# name: "Smith John"
# age: 9
