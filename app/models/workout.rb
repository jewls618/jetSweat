class Workout < ApplicationRecord
  has_many :users
  belongs_to :location
  belongs_to :category

  validates :name, presence: true
  validates :category_id, presence: true
  validates :location_id, presence: true
end
