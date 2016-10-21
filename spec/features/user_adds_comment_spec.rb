require 'spec_helper'
require 'rails_helper'

feature 'adding comments' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }
  let!(:comment) { Comment.new(body: "Dope gym", user_id: user.id, workout_id: workout.id)}

  scenario 'unauthenticated user cannot add comments' do
    visit root_path
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Add New Comment")

    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page).to have_content('Log in')
  end

  scenario 'authenticated user can add comments to workouts' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Add New Comment")

    expect(page).to have_content('ADD A COMMENT:')
  end

  scenario 'authenticated user adds comment successfully' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Add New Comment")
    fill_in "Comment", with: comment.body
    click_button("Add Comment")

    expect(page).to have_content('Comment added successfully!')
    expect(page).to have_content(comment.body)
    expect(page).to have_content('Add New Comment')
  end

  scenario 'authenticated user adds comment unsuccessfully' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Add New Comment")
    fill_in "Comment", with: nil
    click_button("Add Comment")

    expect(page).to have_content('ADD A COMMENT:')
    expect(page).to have_content('Body can\'t be blank')
  end
end
