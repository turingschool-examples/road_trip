# README

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec and Shoulda-Matchers have been installed and set up.


## Setup

1. Fork and clone
2. `bundle`

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
