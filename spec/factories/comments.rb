FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "#{n}best place ever"}
  end
end
