# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trip.create( title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
Trip.create( title: "Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
Trip.create( title: "The Big Apple", destination: "New York City, NY", mileage: 850)
Trip.create( title: "Bike n’ Climb", destination: "Moab, UT", mileage: 700)
 
Traveler.create(name: "Sally Sue", age: 25) 
Traveler.create(name: "Tommy Tom", age: 46)
Traveler.create(name: "Cory Cory", age: 19) 
Traveler.create(name: "Mary Mae", age: 44) 
Traveler.create(name: "Smith John", age: 9)
