class UpdatedWorkoutTable < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :place_id, :string
  end
end
