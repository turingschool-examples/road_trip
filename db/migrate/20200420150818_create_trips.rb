class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :dest_city
      t.integer :milage

      t.timestamps
    end
  end
end
