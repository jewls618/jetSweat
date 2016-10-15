class Category < ApplicationRecord
  has_many :workouts

  validates :category, presence: true, uniqueness: true
end
