class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :run, null: false
      t.string :gym, null: false
      t.string :class, null: false
      t.string :hike, null: false
      t.integer :user_id, null: false
      t.integer :location, null: false

      t.timestamps
    end
  end
end
