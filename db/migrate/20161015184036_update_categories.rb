class UpdateCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :workout_id, :integer
  end
end
