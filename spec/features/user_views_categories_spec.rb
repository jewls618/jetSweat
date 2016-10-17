require 'spec_helper'
require 'rails_helper'

feature 'viewing categories' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'unauthenticated user can view list of categories after defining location' do

    visit "/locations/#{location.id}/categories"

    expect(page).to have_content(category.category)
    expect(page).to have_content('Choose your workout')
  end

  scenario 'authenticated user can view list of categories after defining location' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)

    expect(page).to have_content(category.category)
    expect(page).to have_content('Choose your workout')
    expect(page).to have_content('jetSweat')
  end
end
