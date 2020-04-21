# README

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec and Shoulda-Matchers have been installed and set up.


## Setup

1. Fork and clone
2. `bundle`

# Road Trip Retake BEM2 Final Technical Assessment 
​
## Description
Road Trip is an application that will track road trips as well as travelers. Road trips can have multiple travelers, and travelers can be on multiple road trips. Trips have a title, destination city, and mileage. Travelers have a name and age. At the end of this file, we’ve made up some data you’re welcome to use for this assessment. In the repo you pulled down, your db is already set up for you.
​
## Instructions
​
* You are using the same repo that you used for the assessment on Monday. Please delete your forked copy of that on your github repositories tab
* clone & fork the repo from turingschool-examples again
* in your terminal, run `git clone <paste ssh key here> road_trip_retake` (renaming the repository)
* `cd road_trip_retake`
* `bundle`
* `rails db:{drop,create,migrate,seed}` (you’re starting with many to many relationship and some seeded data for you to use if you wish)
* when you run `bundle exec rspec` you should have 6 passing tests
* Work on this assessment independently. DO NOT discuss with anyone.
* Complete the tasks below
* Push your code to your fork once the time is up (not before!)
* Make a PR to turingschool-examples repo with your name as the title
​
## Tasks
1. Complete the two user stories below (Sad path testing is not required)
​
​
```
User Story 1, Traveler Show Page
​
As a visitor
When I visit a traveler’s show page
I see the traveler’s name and age
And I see all of the titles of the trips that this traveler is on
And I also see the average mileage of all of that traveler’s road trips
```
 
 
```
User Story 2, Add a Trip to a Traveler
​
As a visitor
When I visit a traveler’s show page
I see a section on the page titled “Add a trip”
And under that section, I see a form that allows me to enter an existing trip’s id
When I enter the id of an existing trip into that field
And click submit
I’m redirected to the traveler’s show page
Where I see the title of that trip I just added to the traveler on the page
```
 
Possible Data to use: 
 
Trip1
title: “Cheese Tour 2020”
destination_city: “Madison, WI”
mileage: 1100
 
Trip2
title: “Who is America Anyway?”
destination_city: “Washington, D.C.”
mileage: 300
 
Trip3
title: “The Big Apple”
destination_city: “New York City, NY”
mileage: 850
 
Trip4
title: “Bike n’ Climb”
destination_city: “Moab, UT”
mileage: 700
 
Traveler1
name: “Sally Sue”
age: 25
 
Traveler2 
name: “Tommy Tom”
age: 46
 
Traveler3
name: “Cory Cory”
age: 19
 
Traveler4
name: “Mary Mae”
age: 44
 
Traveler5
name: “Smith John”
age: 9