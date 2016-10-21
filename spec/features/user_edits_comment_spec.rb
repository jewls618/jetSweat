require 'spec_helper'
require 'rails_helper'

feature 'editing comments' do
  let!(:location) { FactoryGirl.create(:location) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:workout) { Workout.create(name: "Test Gym", category_id: category.id, location_id: location.id, street: '123 Main St') }
  let!(:comment) { Comment.new(body: "Dope gym", user_id: user.id, workout_id: workout.id)}

  scenario 'unauthenticated user cannot edit comments' do
    visit root_path
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)

    expect(page).to_not have_content('Edit')
    expect(page).to have_content('Sign In')
  end

  scenario 'authenticated user can update their own comments to workouts' do
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
    expect(page).to have_content('Edit Comment')
    expect(page).to have_content('Add New Comment')
  end

  scenario 'authenticated user edits their own comment successfully' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Add New Comment")
    fill_in "Comment", with: "Hi"
    click_button("Add Comment")
    click_link("Edit Comment")
    fill_in "Comment", with: "Hi Mom"
    click_button("Update Comment")

    expect(page).to have_content('Comment updated')
    expect(page).to have_content('Hi Mom')
  end

  scenario 'authenticated user edits their own comment unsuccessfully' do
    visit root_path
    user_signs_in(user)
    click_link(location.city)
    click_link(category.category)
    click_link(workout.name)
    click_link("Add New Comment")
    fill_in "Comment", with: "Hi"
    click_button("Add Comment")
    click_link("Edit Comment")
    fill_in "Comment", with: nil
    click_button("Update Comment")

    expect(page).to have_content('EDIT COMMENT:')
    expect(page).to have_content('required')
  end
end
