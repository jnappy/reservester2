class AddUserToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :user, :string
  end
end
