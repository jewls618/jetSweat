class AddWorkoutColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :phone, :string
  end
end
