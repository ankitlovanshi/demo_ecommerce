class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :item_count
      t.decimal :total_price
      t.integer :user_id

      t.timestamps
    end
  end
end
