FactoryGirl.define do
  factory :workout do
    sequence(:name) { |n| "#{n}Crossfit"}
    sequence(:street) { |s| "123 #{s} St"}
  end
end
