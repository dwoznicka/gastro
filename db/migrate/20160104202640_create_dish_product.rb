class CreateDishProduct < ActiveRecord::Migration
  def change
    create_table :dish_products do |t|
      t.belongs_to :product, null: false, index: true
      t.belongs_to :dish, null: false, index: true
      t.float :units_quantity, null: false

      t.timestamps null: false
    end
  end
end
