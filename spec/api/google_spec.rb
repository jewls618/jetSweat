require 'spec_helper'
require 'rails_helper'

feature 'google results', vcr: true do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", street: "123 Main St.", category_id: category.id, location_id: location.id, phone: "123-456-7890") }

  scenario 'google places api makes call to find workouts' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts"

    expect(page).to have_content(category.category)
    expect(page).to have_content(workout.name)
  end

  scenario 'google maps api makes call to find all locations' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts"

    expect(page).to have_content(category.category)
    expect(page).to have_content(workout.name)
    expect(page).to have_css('div#result-map')
  end

  scenario 'google maps api makes call to find specific locations' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts/#{workout.id}"

    expect(page).to have_content(workout.name)
    expect(page).to have_css('div#map')
  end

  scenario 'google details api makes call to find workouts' do
    visit "/locations/#{location.id}/categories/#{category.id}/workouts/#{workout.id}"

    expect(page).to have_content(workout.name)
  end
end
