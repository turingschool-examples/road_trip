class CreateRoadTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination_city
      t.float :mileage
    end
  end
end
