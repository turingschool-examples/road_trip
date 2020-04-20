# Trips
trip1 = Trip.create(title: "Cheese Tour 2020", destination: "Madison, WI", mileage: 1100)
trip2 = Trip.create(title: "“Who is America Anyway?", destination: "Washington, D.C.", mileage: 300)
trip3 = Trip.create(title: "The Big Apple", destination: "Moab, UT", mileage: 700)
trip4 = Trip.create(title: "Bike n’ Climb", destination: "New York City, NY", mileage: 850)
trip5 = Trip.create(title: "New Years Eve 2022", destination: "New York City, NY", mileage: 850)
trip6 = Trip.create(title: "Bushwig 2021", destination: "New York City, NY", mileage: 850)

# Travelers
traveler1 = Traveler.create(name: "Sally Sue", age: 25)
traveler2 = Traveler.create(name: "Tommy Tom", age: 46)
traveler3 = Traveler.create(name: "Cory Cory", age: 19)
traveler4 = Traveler.create(name: "Mary Mae", age: 44)
traveler5 = Traveler.create(name: "Smith John", age: 9)

# Add Travelers to Trips
trip1.travelers << [traveler1, traveler2]
trip2.travelers << [traveler1, traveler3]
trip4.travelers << [traveler4]