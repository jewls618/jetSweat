require 'spec_helper'
require 'rails_helper'

feature 'viewing categories' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'unauthenticated user can view list of categories after defining location' do

    # visit root_path
    # expect(page).to have_css("img[src='#{location.photo}']")
    #
    # click_img("#{l.city}")


    visit "/locations/#{location.id}/categories"
    # expect(page).to have_content(category.cateogory)
    expect(page).to have_content('Choose your workout')
  end

  scenario 'authenticated user can view list of categories after defining location' do

    visit root_path
    user_signs_in(user)

    expect(page).to have_content(location.city)
    expect(page).to have_content('jetSweat')
  end
end
