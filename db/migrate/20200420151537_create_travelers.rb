class CreateTravelers < ActiveRecord::Migration[5.1]
  def change
    create_table :travelers do |t|
      t.string :name
      t.string :age
      t.references :trips, foreign_key: true
    end
  end
end
