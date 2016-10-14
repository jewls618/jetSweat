#jetSweat

![Build Status](https://codeship.com/projects/179109)


#Heroku Link

https://jetsweat.herokuapp.com/


#Description

jetSweat is a place where you can plan out your workouts when you're traveling to a new destination. If you are looking to stay on your strict workout schedule and need to find the closest gym to your hotel, jetSweat is for you! If you want to checkout a local barre class while you're on vacation, you've come to the right place! Just keep sweating!


#Ruby version

Ruby version 2.3.1


#Configuration

Run the following (after git cloning):

bundle install

rake db:create

rake db:migrate

rails s


#Features
- User has ability to signs up and update profile
- User uploads a profile picture
- User can pick a location and a type of workout
- User can view all workouts in that location
- User can save a location or workout to their favorites
- User can leave a review on a workout
- User can up vote or down vote a review
- User can add a review if they don't see it on the returned results
- Workout creator will receive an email when someone reviews their workout
- User has the ability to update or delete their review
- User had to ability to search for workouts on the results page


#Technologies Utilized
- Rails
- Ajax
- JQuery
- Devise (User Authentication)
- CarrierWave (Photo Uploads)
- Gmail SMTP (ActionMailer)
- Testing: Factory_Girl, Capybara, RSpec
