class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout

  validates :body, presence: true
  validates :user_id, presence: true
  validates :workout_id, presence: true
end
