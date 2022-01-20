class DropOrderedItems < ActiveRecord::Migration[6.1]
  def change
    drop_table :ordered_items
  end
end
