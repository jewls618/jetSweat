class UpdateWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :rating, :integer
  end
end
