require 'spec_helper'
require 'rails_helper'

feature 'user creates account' do
  scenario 'specifies valid and required information' do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user.username
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in :user_password_confirmation, with: user.password_confirmation
    click_button 'Sign up'

    expect(page).to have_content('Welcome')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    user_2 = User.new(username: "test22", first_name: "Test", last_name: "Four", password: "password", password_confirmation: "password")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user_2.username
    fill_in 'First Name', with: user_2.first_name
    fill_in 'Last Name', with: user_2.last_name
    fill_in 'Password', with: user_2.password
    fill_in :user_password_confirmation, with: user_2.password_confirmation
    click_button 'Sign up'

    expect(page).to have_content('1 error prohibited this user from being saved')
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'password confirmation does not match password field' do
    user_3 = User.new(username: "Test4", first_name: "Test", last_name: "Hello", email: "test4@gmail.com", password: "password", password_confirmation: "notpassword")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user_3.username
    fill_in 'First Name', with: user_3.first_name
    fill_in 'Last Name', with: user_3.last_name
    fill_in 'Email', with: user_3.email
    fill_in 'Password', with: user_3.password
    fill_in :user_password_confirmation, with: user_3.password_confirmation
    click_button 'Sign up'

    expect(page).to have_content('1 error prohibited this user from being saved')
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  scenario 'user account is successfully registered if all form fields are passing' do
    user = User.new(username: "test0", first_name: "Test", last_name: "Zero", email: "test@test.com", password: "password", password_confirmation: "password")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user.username
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in :user_password_confirmation, with: user.password_confirmation
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end
end
