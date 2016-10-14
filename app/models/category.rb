class Category < ApplicationRecord
  belongs_to :user
  belongs_to :location
  
  validates :run, presence: true
  validates :hike, presence: true
  validates :class, presence: true
  validates :gym, presence: true
end
