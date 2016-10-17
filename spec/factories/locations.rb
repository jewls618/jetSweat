FactoryGirl.define do
  factory :location do
    sequence(:city) { |n| "#{n}city"}
    photo "https://i.vimeocdn.com/portrait/58832_300x300"
  end
end
