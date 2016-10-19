require 'spec_helper'
require 'rails_helper'

feature 'searching workouts' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }

  scenario 'authenticated user can search for a workout by name' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    fill_in 'search', with: workout.name
    click_button "Search"

    expect(page).to have_content workout.name
  end

  scenario 'unauthenticated user can search for a workout by name' do
    visit root_path
    click_link(location.city)
    click_link(category.category)
    fill_in 'search', with: workout.name
    click_button "Search"

    expect(page).to have_content workout.name
  end

  scenario 'any user can search for a workout by name' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)

    fill_in 'search', with: "Hello"
    click_button "Search"

    expect(page).to have_content("No results found.")
  end
end
