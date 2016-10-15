class AddLocationsPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :photo, :string
  end
end
