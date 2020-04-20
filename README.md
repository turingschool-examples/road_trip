<!-- # README

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.1.7.

RSpec and Shoulda-Matchers have been installed and set up.


## Setup

1. Fork and clone
2. `bundle` -->

# Road Trip BEM2 Final Technical Assessment
<!-- ​
## Description
Road Trip is an application that will track road trips as well as travelers. Road trips can have multiple travelers, and travelers can be on multiple road trips. Trips will have a title, destination city, and mileage. Travelers will have a name and age. At the end of this file, we’ve made up some data you’re welcome to use for this assessment. -->
​
## Instructions
​
<!-- * Work on this assessment independently. DO NOT discuss with anyone.
* Fork this repository
* Clone your fork
* Run `bundle install`
* Run `rake db:{create}`
* Complete the tasks below
* Push your code to your fork once the time is up (not before!) -->
<!-- * Make a PR to turingschool-examples repo with your name as the title -->
​
## Tasks
<!-- 1. Create the tables for travelers and trips. You do not need to do validation testing. -->

​
<!-- 2. Set up a many to many relationship between travelers and trips -->
​
​
3. Complete the following user stories (we would like to see you at least start on user story 4):
​
​
<!-- ```
User Story 1, Trips Index Page
​
As a visitor
When I visit a trips index page
I see the titles of all trips in my database listed in order of their mileage (ascending order)
``` -->
​
```
User Story 2, Trips Show Page
​
As a visitor
When I visit a trips index page
And I click on a trips title
I’m taken to that trip’s show page
And I can see that trips title, destination city, mileage
And I also see a list of the names of the travelers that are on this trip
```


```
User Story 3, Remove a Traveler from a Trip
​
As a visitor
When I visit a trips show page
Next to each traveler’s name
I see a button to remove that traveler from the trip
When I click that button for a particular traveler
I am redirected back to the trips show page
And I no longer see that traveler’s name listed
```

Extension:

```
User Story 4, Similar Trips
​
As a visitor
When I visit a trips show page
I see a section on the page titled, “Other Trips to this Destination”
And under that title I see a list of trip titles that have the same destination as this trip, but this should not include the trip who’s show page I’m on
And all of those titles are links to that trips show page
```
