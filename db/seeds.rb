# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trip.destroy_all
Traveler.destroy_all
TravelerTrip.destroy_all

trip_1 = Trip.create(  title: "Shoreline Ampitheatre",
                        destination_city: "Mountain View, CA",
                        mileage: 1200)
trip_2 = Trip.create(  title: "Winterland Ballroom",
                        destination_city: "San Francisco, CA",
                        mileage: 1250)
trip_3 = Trip.create(  title: "Madison Square Garden",
                        destination_city: "New York City, NY",
                        mileage: 1800)
trip_4 = Trip.create(  title: "Red Rocks",
                        destination_city: "Morrison, CO",
                        mileage: 25)
trip_5 = Trip.create(  title: "Golden Gate Park",
                        destination_city: "San Francisco, CA",
                        mileage: 1250)
trip_6 = Trip.create(  title: "Haight Ashbury",
                        destination_city: "San Francisco, CA",
                        mileage: 1250)
traveler_1 = Traveler.create(  name: "Jack Straw",
                                age: 25)
traveler_2 = Traveler.create(  name: "Casey Jones",
                                age: 46)
traveler_3 = Traveler.create(  name: "Uncle John",
                                age: 19)
traveler_4 = Traveler.create(  name: "Stella Blue",
                                age: 44)
traveler_5 = Traveler.create(  name: "Bertha",
                                age: 9)
TravelerTrip.create( trip: trip_1, traveler: traveler_1 )
TravelerTrip.create( trip: trip_1, traveler: traveler_4 )
TravelerTrip.create( trip: trip_1, traveler: traveler_5 )
TravelerTrip.create( trip: trip_2, traveler: traveler_1 )
TravelerTrip.create( trip: trip_2, traveler: traveler_2 )
TravelerTrip.create( trip: trip_2, traveler: traveler_5 )
TravelerTrip.create( trip: trip_3, traveler: traveler_1 )
TravelerTrip.create( trip: trip_3, traveler: traveler_2 )
TravelerTrip.create( trip: trip_3, traveler: traveler_3 )
TravelerTrip.create( trip: trip_4, traveler: traveler_2 )
TravelerTrip.create( trip: trip_4, traveler: traveler_3 )
TravelerTrip.create( trip: trip_4, traveler: traveler_4 )
TravelerTrip.create( trip: trip_5, traveler: traveler_1 )
TravelerTrip.create( trip: trip_5, traveler: traveler_4 )
TravelerTrip.create( trip: trip_6, traveler: traveler_2 )
TravelerTrip.create( trip: trip_2, traveler: traveler_5 )
