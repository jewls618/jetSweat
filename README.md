#jetSweat

![Build Status](https://codeship.com/projects/653fd430-7435-0134-88cf-76a75a837005/status?branch=master)
![Code Climate](https://codeclimate.com/github/jewls618/jetSweat.png)
[![Coverage Status](https://coveralls.io/repos/github/jewls618/jetSweat/badge.svg?branch=master)](https://coveralls.io/github/jewls618/jetSweat?branch=master)

www.jet-sweat.com


#Heroku Link

https://jetsweat.herokuapp.com/


#Description

An app that helps workout fanatics plan their vacation workouts in advance. If you are looking to stay on your strict workout schedule and need to find the closest gym to your hotel, jetSweat is for you! If you want to checkout a local barre class while you're on vacation, you've come to the right place! Just keep sweating!


#Ruby version

Ruby version 2.3.1


#Technologies Utilized
- Ruby on Rails
- Javascript
- Google Places API
- Google Place Details API
- Google Place Photos API
- Google Maps API
- Yelp API
- Heroku for hosting
- Codeship for continuous integration and deployment
- CSS & Foundations for styling
- Ajax & JQuery
- Devise for User Authentication
- CarrierWave for Photo Uploads
- SASS & Foundations for styling
- Factory_Girl, Capybara, RSpec for testing


#Features
- User has ability to sign up and update profile
- User uploads a profile picture
- User can pick a location and a workout category
- User can view all workouts in specified location
- User can search the workouts results page
- User can save or remove a workout to their favorites
- User can leave a comment on a workout
- User can edit or delete their own comments
- User can add additional workouts
- User can checkout the Yelp page for each result from the workouts show page
- Admin has the ability to delete inappropriate comments, workouts or users


## Getting Started

### Viewing in the browser
- Clone the repository `git clone https://github.com/jewls618/jetSweat.git`
- Open the .env.example file, rename file as .env
- Retrieve all necessary API keys
- Bundle install `bundle`
- Create `rake db:create`
- Migrate `rake db:migrate`
- Seed `rake db:seed`
- Launch a Rails server `rails server`
- Visit `http://localhost:3000` in your browser

### Running the tests
- All of the above
- Run `rspec` or `rake` from the command line
