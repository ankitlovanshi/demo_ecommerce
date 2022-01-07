class AddSelectQantityToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :select_quantity, :integer
  end
end
