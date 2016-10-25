require 'spec_helper'
require 'rails_helper'

feature 'viewing workout show page', vcr: true do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }
  let!(:comment) {Comment.create(body: "Love this place!", user_id: user.id, workout_id: workout.id) }

  scenario 'unauthenticated user can view more info on each workout result' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to have_content(workout.name)
    expect(page).to have_content(workout.street)
    expect(page).to have_content('Back to Results')
  end

  scenario 'authenticated user can view more info on each workout result' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to have_content(workout.name)
    expect(page).to have_content(workout.street)
    expect(page).to have_content('Back to Results')
  end

  scenario 'any user can view location marker on google map' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts/#{workout.id}"

    expect(page).to have_content(workout.name)
    expect(page).to have_css('div#map')
  end

  scenario 'any user can view comments for workouts' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts/#{workout.id}"

    expect(page).to have_content("COMMENTS")
    expect(page).to have_content(comment.body)
    expect(page).to have_content(comment.user.username)
  end

  scenario 'any user can view workout picture if provided by google' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts/#{workout.id}"

    expect(page).to have_css('img.logo-pic')
  end
end
