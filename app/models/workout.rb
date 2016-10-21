class Workout < ActiveRecord::Base
  has_many :users, through: :favorites
  has_many :favorites
  belongs_to :location
  belongs_to :category

  validates :name, presence: true
  validates :street, presence: true
  validates :category_id, presence: true
  validates :location_id, presence: true

  def self.search(search)
    where("name ILIKE ? OR street ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
