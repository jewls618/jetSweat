require 'spec_helper'
require 'rails_helper'

feature 'admin edit ability' do
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:users) { FactoryGirl.create_list(:user, 5) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:workout) { Workout.create(name: 'Golds Gym', street: '12 Main St', location_id: location.id, category_id: category.id) }

  scenario 'an admin updates a workout when desired' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to have_button("Edit")
  end

  xscenario 'an admin successfully updates a workout' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Edit Workout")
    fill_in "Name", with: "New Name"
    fill_in "Address", with: workout.street
    click_button("Save Workout")

    expect(page).to have_content("New Name")
    expect(page).to have_button("Edit")
  end

  xscenario 'an admin unsuccessfully updates a workout' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Edit Workout")
    fill_in "Address", with: workout.street
    click_button("Save Workout")

    expect(page).to have_content("Edit Workout")
  end

  scenario 'a non-admin cannot edit workouts' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)

    expect(page).to have_content(workout.name)
    expect(page).to_not have_button("Edit")
  end

  scenario 'an unauthenticated user cannot update workout' do
    visit root_path

    expect(page).to have_content('jetSweat')
    expect(page).to_not have_button("Edit")
  end
end
