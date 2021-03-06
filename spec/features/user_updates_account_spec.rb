require 'spec_helper'
require 'rails_helper'

feature 'updating profile show page' do
  scenario 'current user can view edit user page' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Account'
    click_link 'Edit Profile'

    expect(page).to have_content('Edit')
  end

  scenario 'current user can make edits to account' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Account'
    click_link 'Edit Profile'
    fill_in 'Last name', with: 'Grace'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'unauthenticated user cannot view account page' do
    visit root_path

    expect(page).to_not have_link('My Account')
  end
end
