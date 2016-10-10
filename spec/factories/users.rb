FactoryGirl.define do
  factory :user do
    first_name "Johnny"
    last_name "Appleseed"
    sequence(:username) { |n| "jappleseed#{n}" }
    password "appless"
    password_confirmation "appless"
    sequence(:email) { |n| "appleseed#{n}@gmail.com" }
  end
end
