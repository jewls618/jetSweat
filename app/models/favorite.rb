class Favorite < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user

  validates :workout_id, presence: true, uniqueness: true
  validates :user_id, presence: true
end
