class UpdateWorkoutsStreet < ActiveRecord::Migration[5.0]
  def change
    remove_column :workouts, :street, :string
  end
end
