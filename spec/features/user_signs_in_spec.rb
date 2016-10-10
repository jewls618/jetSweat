require 'spec_helper'
require 'rails_helper'

feature 'signing in' do
  scenario 'authenticated user specifies valid and required information' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('My Account')
  end

  scenario 'required information is not supplied' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.username
    click_button 'Log in'

    expect(page).to have_content('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end
end
