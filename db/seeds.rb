# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trip_1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip_2 = Trip.create!(title: "That 70's Tour", destination_city: "Madison, WI", mileage: 300)
trip_3 = Trip.create!(title: "Great Lakes Vista", destination_city: "Madison, WI", mileage: 800)
trip_4 = Trip.create!(title: "Frigid Heights", destination_city: "Madison, WI", mileage: 750)
trip_5 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)

traveler_1 = trip_1.travelers.create(name: "Sally Sue", age: 25)
traveler_2 = trip_1.travelers.create(name: "Tommy Tom", age: 46)
traveler_3 = trip_1.travelers.create(name: "Jane Doe", age: 21)

traveler_4 = trip_2.travelers.create(name: "Cory Cory", age: 19)
traveler_5 = trip_2.travelers.create(name: "Mary Mae", age: 44)
traveler_6 = trip_2.travelers.create(name: "Smith John", age: 9)

traveler_7 = trip_3.travelers.create(name: "Chandler Bing", age: 35)
traveler_8 = trip_3.travelers.create(name: "Joey Tribbiani", age: 30)
traveler_9 = trip_3.travelers.create(name: "Ross Geller", age: 36)

traveler_10 = trip_4.travelers.create(name: "Rachel Green", age: 25)
traveler_11 = trip_4.travelers.create(name: "Monica Geller", age: 27)
traveler_12 = trip_4.travelers.create(name: "Phoebe Buffay", age: 32)

traveler_13 = trip_5.travelers.create(name: "Bojack Horseman", age: 55)
traveler_14 = trip_5.travelers.create(name: "Diane Nguyen", age: 35)
traveler_15 = trip_5.travelers.create(name: "Todd Chavez", age: 28)
