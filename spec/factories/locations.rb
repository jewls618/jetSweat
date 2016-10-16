FactoryGirl.define do
  factory :location do
    sequence(:city) { |n| "#{n}city"}
  end
end
