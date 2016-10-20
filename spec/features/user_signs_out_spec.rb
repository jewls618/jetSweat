require 'spec_helper'
require 'rails_helper'

feature 'signing out' do
  scenario 'authenticated user signs out' do
    user = FactoryGirl.create(:user)

    visit root_path
    user_signs_in(user)
    click_link("Sign Out")

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Sign In')
  end
end
