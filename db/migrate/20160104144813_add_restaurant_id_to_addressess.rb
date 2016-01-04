class AddRestaurantIdToAddressess < ActiveRecord::Migration
  def change
    add_reference :addresses, :restaurant
    add_foreign_key :addresses, :restaurants
  end
end
