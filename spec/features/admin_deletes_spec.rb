require 'spec_helper'
require 'rails_helper'
require 'support/vcr'

feature 'admin delete ability', vcr: true do
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:users) { FactoryGirl.create_list(:user, 5) }
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:workout) { Workout.create(name: 'Golds Gym', street: '12 Main St', location_id: location.id, category_id: category.id) }

  scenario 'an admin deletes users when desired' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link("Admin Controls")

    expect(page).to have_content("USERS")
    users.each do |user|
      expect(page).to have_content(user.username)
    end
  end

  scenario 'an admin deletes users when desired' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link("Admin Controls")

    expect(page).to have_button("Delete")
  end

  scenario 'an admin deletes workouts when desired' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to have_button("Delete")
  end

  scenario 'a non-admin cannot deletes workouts' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)

    expect(page).to have_content(workout.name)
    expect(page).to_not have_button("Delete")
  end

  scenario 'an unauthenticated user cannot delete workouts' do
    visit root_path

    expect(page).to have_content('jetSweat')
    expect(page).to_not have_button("Delete")
  end
end
