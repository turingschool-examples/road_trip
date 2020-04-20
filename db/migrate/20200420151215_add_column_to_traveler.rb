class AddColumnToTraveler < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :name, :string
    add_column :travelers, :age, :integer
  end
end
