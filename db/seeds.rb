# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
@traveler_3 = Traveler.create(name: "Cory Cory", age: 19)
@traveler_4 = Traveler.create(name: "Mary Mae", age: 44)
@traveler_5 = Traveler.create(name: "Smith John", age: 9)

@trip_1 = Trip.create!(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
@trip_2 = Trip.create!(title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
@trip_3 = Trip.create!(title: "The Big Apple", destination: "New York City, NY", mileage: 850)
@trip_4 = Trip.create!(title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
