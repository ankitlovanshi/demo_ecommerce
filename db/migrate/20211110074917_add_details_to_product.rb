class AddDetailsToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :details, :string
  end
end
