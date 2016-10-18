class Category < ActiveRecord::Base
  has_many :workouts

  validates :category, presence: true, uniqueness: true
end
