class AddStreet < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :street, :string, presence: true
  end
end
