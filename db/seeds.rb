# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trip1 = Trip.create!(name: "Spring Trip", destination: "Florida", mileage: 500)
        trip2 = Trip.create!(name: "Summer Trip", destination: "New York", mileage: 250)
        trip3 = Trip.create!(name: "Fall Trip", destination: "Alaska", mileage: 2000)
        trav1 = trip1.travelers.create!(name: "Tom Cullen", age: 30)
        # trav1 = Traveler.create(name: "Tom Cullen", age: 30)
        tom = TravelerTrip.create(trip_id: trip1.id, traveler_id: trav1.id)
