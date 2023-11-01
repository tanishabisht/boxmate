class CreateCheffs < ActiveRecord::Migration[7.0]
  def change
    create_table :cheffs do |t|
      t.string :day
      t.string :time
      t.string :cuisine
      t.string :meal
      t.float :price
      t.integer :booked_num
      t.integer :max_num

      t.timestamps
    end
  end
end
