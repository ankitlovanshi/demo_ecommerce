class AddsellerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :seller, :boolean
    add_column :users, :buyer, :boolean
  end
end
