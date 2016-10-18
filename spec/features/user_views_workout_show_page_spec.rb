require 'spec_helper'
require 'rails_helper'

feature 'viewing workout show page' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }

  scenario 'unauthenticated user can view more info on each workout result' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to have_content(workout.name)
    expect(page).to have_content(workout.phone)
    expect(page).to have_content(workout.street)
    expect(page).to have_content('Back to Results')
  end

  scenario 'authenticated user can view more info on each workout result' do

    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to have_content(workout.name)
    expect(page).to have_content(workout.phone)
    expect(page).to have_content(workout.street)
    expect(page).to have_content('Back to Results')
  end
end
