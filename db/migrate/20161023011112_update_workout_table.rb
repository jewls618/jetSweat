class UpdateWorkoutTable < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :longitude, :string
    add_column :workouts, :latitude, :string
  end
end
