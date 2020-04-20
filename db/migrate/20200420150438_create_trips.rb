class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination
      t.integer :mileage
    end
  end
end
