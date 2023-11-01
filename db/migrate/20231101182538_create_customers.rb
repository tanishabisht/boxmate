class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :day
      t.string :time
      t.string :cuisine
      t.string :meal
      t.float :price
      t.integer :cheff_id

      t.timestamps
    end
  end
end
