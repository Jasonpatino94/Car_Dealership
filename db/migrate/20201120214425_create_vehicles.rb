class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :kind
      t.integer :customer_id
      t.integer :dealership_id

      t.timestamps
    end
  end
end
