require "rails_helper"

feature "profile picture" do
  scenario "new user signing in uploads a profile picture" do
    visit root_path
    click_link "Sign Up"
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Test'
    fill_in 'Username', with: 'JTest'
    fill_in 'Email', with: 'jtest@test.com'
    fill_in 'Email', with: 'jtest@test.com'
    fill_in 'Password', with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    attach_file :user_avatar, "#{Rails.root}/spec/support/images/dog_test.png"
    click_button 'Sign up'

    expect(page).to have_content("Welcome")
    expect(page).to have_css("img[src*='dog_test.png']")
  end
end
