class Location < ApplicationRecord
  has_many :users
  has_many :categories

  validates :city, presence: true
end
