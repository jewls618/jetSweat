require 'spec_helper'
require 'rails_helper'

feature 'viewing categories' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id) }

  scenario 'unauthenticated user can view list of workouts after defining location and category' do

    visit "/locations/#{location.id}/categories/#{category.id}/workouts"

    expect(page).to have_content(category.category)
    expect(page).to have_content(workout.name)
  end

  scenario 'authenticated user can view list of categories after defining location and category' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)

    expect(page).to have_content(category.category)
    expect(page).to have_content(workout.name)
    expect(page).to have_content('jetSweat')
  end
end
