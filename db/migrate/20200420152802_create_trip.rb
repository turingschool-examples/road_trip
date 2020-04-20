class CreateTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination_city
      t.integer :mileage
    end
  end
end
