class CreateDish < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :description
      t.float :production_cost
      t.float :sell_price
      t.integer :calories
      t.string :allergy_advice
      t.boolean :vegan, null: false, default: false
      t.boolean :vegeterian, null: false, default: false

      t.timestamps null: false
    end
  end
end
