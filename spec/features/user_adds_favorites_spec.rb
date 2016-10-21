require 'spec_helper'
require 'rails_helper'

feature 'adding favorites' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }

  scenario 'unauthenticated user cannot add favorites' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to_not have_content("Add to Favorites")
  end

  scenario 'authenticated user can add workouts to favorites' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_button("Add to Favorites")

    expect(page).to have_content(workout.name)
    expect(page).to have_content(workout.street)
    expect(page).to have_content('Workout has been added to favorites!')
  end

  scenario 'authenticated user cannot add the same workout to favorites more than once' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_button("Add to Favorites")
    click_button("Add to Favorites")

    expect(page).to have_content(workout.name)
    expect(page).to have_content(workout.street)
    expect(page).to have_content('Workout is already a favorite.')
  end
end
