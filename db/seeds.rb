#SEEDS:
#Trip
trip1 = Trip.create!(title: "Cheese Tour 2020", destination_city: "Madison, WI", mileage: 1100)
trip2 = Trip.create!(title: "Who is America Anyway?", destination_city: "Washington, D.C.", mileage: 300)
trip3 = Trip.create!(title: "The Big Apple", destination_city: "New York City, NY", mileage: 850)
trip4 = Trip.create!(title: "Bike n’ Climb", destination_city: "Moab, UT", mileage: 700)

#Traveler
traveler1 = Traveler.create!(name: "Sally Sue", age: 25)
traveler2 = Traveler.create!(name: "Tommy Tom", age: 46)
traveler3 = Traveler.create!(name: "Cory Cory", age: 19)
traveler4 = Traveler.create!(name: "Mary Mae", age: 44)
traveler5 = Traveler.create!(name: "Smith John", age: 9)

#TravelerTrip
trip1.traveler_trips.create!(traveler: traveler1)
trip1.traveler_trips.create!(traveler: traveler2)
trip1.traveler_trips.create!(traveler: traveler3)
trip2.traveler_trips.create!(traveler: traveler3)
trip2.traveler_trips.create!(traveler: traveler4)
trip2.traveler_trips.create!(traveler: traveler5)
trip3.traveler_trips.create!(traveler: traveler4)
trip3.traveler_trips.create!(traveler: traveler5)
trip3.traveler_trips.create!(traveler: traveler1)
trip4.traveler_trips.create!(traveler: traveler5)
trip4.traveler_trips.create!(traveler: traveler1)
trip4.traveler_trips.create!(traveler: traveler2)
