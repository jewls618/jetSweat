class Category < ApplicationRecord
  validates :run, presence: true
  validates :hike, presence: true
  validates :class, presence: true
  validates :gym, presence: true
end
