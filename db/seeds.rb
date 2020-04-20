# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#trips
trip1 = Trip.create!(title: 'Cheese Tour 2020', destination_city: 'Madison, WI', mileage: 1100)
trip2 = Trip.create!(title: 'Who is America Anyway?', destination_city: 'Washington, D.C.', mileage: 300)
trip3 = Trip.create!(title: 'The Big Apple', destination_city: 'New York City, NY', mileage: 850)
trip4 = Trip.create!(title: 'Bike n’ Climb', destination_city: 'Moab, UT', mileage: 700)
#travelers
traveler1 = trip1.travelers.create!(name: 'Sally Sue', age: 25)
traveler2 = trip1.travelers.create!(name: 'Tommy Tom', age: 46)
traveler3 = trip2.travelers.create!(name: 'Cory Cory', age: 19)
traveler4 = trip2.travelers.create!(name: 'Mary Mae', age: 44)
traveler5 = trip3.travelers.create!(name: 'Smith John', age: 9)
traveler6 = trip3.travelers.create!(name: 'Sally Sue', age: 25)
traveler7 = trip4.travelers.create!(name: 'Tommy Tom', age: 46)
traveler8 = trip4.travelers.create!(name: 'Cory Cory', age: 19)
