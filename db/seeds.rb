# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@trip_1 = Trip.create(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1110)
@trip_2 = Trip.create(title: "America Anyway?", destination_city: "Washington D.C.", mileage: 300)
@trip_3 = Trip.create(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)

@traveler_1 = Traveler.create(name: "Sally Sue", age: 25)
@traveler_2 = Traveler.create(name: "Tommy Tom", age: 46)
@traveler_3 = Traveler.create(name: "Mary Mae", age: 44)
@traveler_4 = Traveler.create(name: "Johnny Johnson", age: 16)
