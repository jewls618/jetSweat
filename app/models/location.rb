class Location < ApplicationRecord
  has_many :users
  has_many :categories
  has_many :workouts

  validates :city, presence: true
end
