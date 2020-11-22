class CreateDealerships < ActiveRecord::Migration[6.0]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :kind
      t.integer :rating

      t.timestamps
    end
  end
end
