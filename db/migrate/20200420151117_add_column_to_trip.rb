class AddColumnToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :title, :string
    add_column :trips, :destination, :string
    add_column :trips, :milage, :integer
  end
end
