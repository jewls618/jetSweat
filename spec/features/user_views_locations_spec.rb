require 'spec_helper'
require 'rails_helper'

feature 'viewing homepage' do
  scenario 'unauthenticated user can view list of locations on homepage' do
    location = FactoryGirl.create(:location)

    visit root_path

    expect(page).to have_content(location.city)
    expect(page).to have_content('jetSweat')
  end

  scenario 'authenticated user can view list of locations on homepage' do
    location = FactoryGirl.create(:location)
    user = FactoryGirl.create(:user)

    visit root_path
    user_signs_in(user)

    expect(page).to have_content(location.city)
    expect(page).to have_content('jetSweat')
  end
end
