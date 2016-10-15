class Workouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :name, presence: true
      t.integer :category_id
      t.string :hours
      t.string :price
      t.integer :location_id
      t.string :street
      t.string :zip

      t.timestamps
    end
  end
end
