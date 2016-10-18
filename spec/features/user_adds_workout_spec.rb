require 'spec_helper'
require 'rails_helper'

feature 'adding workouts' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }

  scenario 'unauthenticated user cannot add workouts' do

    visit root_path
    click_link(location.city)
    click_link(category.category)
    click_link("Add New Workout")

    expect(page).to_not have_content('ADD A WORKOUT:')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to have_content('Log in')
  end

  scenario 'authenticated user can add workouts' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link("Add New Workout")

    expect(page).to have_content('ADD A WORKOUT:')
    expect(page).to have_content('Back to Results')
  end

  scenario 'authenticated user adds workout successfully' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link("Add New Workout")
    fill_in "Name", with: workout.name
    fill_in "Address", with: workout.street
    click_button("Add Workout")

    expect(page).to have_content('Workout has been added successfully.')
    expect(page).to have_content(workout.name)
    expect(page).to have_content('Add New Workout')
  end

  scenario 'authenticated user adds workout unsuccessfully' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link("Add New Workout")
    fill_in "Address", with: workout.street
    click_button("Add Workout")

    expect(page).to have_content('ADD A WORKOUT:')
    expect(page).to have_content('Name can\'t be blank')
  end
end
